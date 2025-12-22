import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/order_provider.dart';
import '../../../tables/presentation/widgets/table_selector.dart';
import '../../../tables/data/repositories/table_repository.dart';
import '../../../menu/presentation/widgets/menu_selector.dart';
import '../../../menu/presentation/providers/menu_provider.dart';

class CreateOrderScreen extends ConsumerStatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  ConsumerState<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends ConsumerState<CreateOrderScreen> {
  int? _selectedTableId;
  String? _selectedTableCode;
  int? _selectedOrderTypeId = 1; // Default to dine-in
  int _numberOfPax = 1;
  final List<Map<String, dynamic>> _selectedItems = [];
  String? _orderNote;

  @override
  Widget build(BuildContext context) {
    final createOrderState = ref.watch(createOrderProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Order'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Table selection
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Table',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TableSelector(
                      selectedTableId: _selectedTableId,
                      onTableSelected: (tableId) async {
                        // Fetch table details to get table code
                        try {
                          final repository = ref.read(tableRepositoryProvider);
                          final table = await repository.getTable(tableId);
                          if (mounted) {
                            setState(() {
                              _selectedTableId = tableId;
                              _selectedTableCode = table.tableCode;
                            });
                          }
                        } catch (e) {
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error loading table: $e'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Number of pax
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Number of Guests',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            if (_numberOfPax > 1) {
                              setState(() {
                                _numberOfPax--;
                              });
                            }
                          },
                        ),
                        Text(
                          '$_numberOfPax',
                          style: const TextStyle(fontSize: 20),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              _numberOfPax++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Menu items
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Menu Items',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    MenuSelector(
                      onItemSelected: (item) {
                        setState(() {
                          _selectedItems.add({
                            'menu_item_id': item['id'],
                            'quantity': 1,
                            'modifiers': [],
                          });
                        });
                      },
                    ),
                    if (_selectedItems.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      const Text(
                        'Selected Items',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ..._selectedItems.asMap().entries.map((entry) {
                        final item = entry.value;
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text('${entry.key + 1}'),
                            ),
                            title: Text(
                              'Item ID: ${item['menu_item_id']}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (item['variation_id'] != null)
                                  Text('Variation: ${item['variation_id']}'),
                                Text('Quantity: ${item['quantity']}'),
                                if (item['modifiers'] != null && (item['modifiers'] as List).isNotEmpty)
                                  Text('Modifiers: ${(item['modifiers'] as List).length}'),
                                if (item['note'] != null && item['note'].toString().isNotEmpty)
                                  Text('Note: ${item['note']}'),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  _selectedItems.removeAt(entry.key);
                                });
                              },
                            ),
                          ),
                        );
                      }),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Order note
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order Note',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Add any special instructions for this order...',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                      onChanged: (value) {
                        _orderNote = value.isEmpty ? null : value;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Order summary
            if (_selectedItems.isNotEmpty) ...[
              Card(
                color: Colors.blue.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Order Summary',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (_selectedTableCode != null)
                        Text('Table: $_selectedTableCode'),
                      Text('Guests: $_numberOfPax'),
                      Text('Items: ${_selectedItems.length}'),
                      const Divider(),
                      Text(
                        'Total Items: ${_selectedItems.fold<int>(0, (sum, item) => sum + (item['quantity'] as int? ?? 1))}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
            // Create button
            ElevatedButton(
              onPressed: (_selectedTableId == null || _selectedItems.isEmpty || createOrderState.isLoading)
                  ? null
                  : () async {
                      final notifier = ref.read(createOrderProvider.notifier);
                      final order = await notifier.createOrder(
                        tableId: _selectedTableId!,
                        orderTypeId: _selectedOrderTypeId ?? 1,
                        numberOfPax: _numberOfPax,
                        items: _selectedItems,
                        orderNote: _orderNote,
                      );

                      if (order != null && mounted) {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Order created successfully'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(createOrderState.error ?? 'Failed to create order'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: createOrderState.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Text(
                      'Create Order',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

