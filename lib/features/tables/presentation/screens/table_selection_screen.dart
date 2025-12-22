import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/table_provider.dart';
import '../widgets/table_card.dart';

class TableSelectionScreen extends ConsumerStatefulWidget {
  final Function(int) onTableSelected;

  const TableSelectionScreen({
    super.key,
    required this.onTableSelected,
  });

  @override
  ConsumerState<TableSelectionScreen> createState() => _TableSelectionScreenState();
}

class _TableSelectionScreenState extends ConsumerState<TableSelectionScreen> {
  int? _selectedAreaId;
  String? _selectedStatus;
  Map<String, dynamic>? _cachedFilters;
  int? _cachedAreaId;
  String? _cachedStatus;

  @override
  Widget build(BuildContext context) {
    final areasAsync = ref.watch(tableAreasProvider);
    
    // Only recreate filters if area or status changed
    if (_cachedFilters == null || 
        _cachedAreaId != _selectedAreaId || 
        _cachedStatus != _selectedStatus) {
      _cachedFilters = {
        'area_id': _selectedAreaId,
        'status': _selectedStatus,
      };
      _cachedAreaId = _selectedAreaId;
      _cachedStatus = _selectedStatus;
    }
    
    final tablesAsync = ref.watch(tablesProvider(_cachedFilters!));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Table'),
      ),
      body: Column(
        children: [
          // Filters
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Area filter
                Expanded(
                  child: areasAsync.when(
                    data: (areas) {
                      return DropdownButton<int>(
                        value: _selectedAreaId,
                        hint: const Text('All Areas'),
                        isExpanded: true,
                        items: [
                          const DropdownMenuItem<int>(
                            value: null,
                            child: Text('All Areas'),
                          ),
                          ...areas.map((area) {
                            return DropdownMenuItem<int>(
                              value: area.id,
                              child: Text(area.areaName),
                            );
                          }),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedAreaId = value;
                          });
                        },
                      );
                    },
                    loading: () => DropdownButton<int>(
                      value: null,
                      items: const [],
                      hint: const Text('Loading areas...'),
                      onChanged: null,
                    ),
                    error: (_, __) => DropdownButton<int>(
                      value: null,
                      items: const [],
                      hint: const Text('Error loading areas'),
                      onChanged: null,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Status filter
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedStatus,
                    hint: const Text('All Status'),
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem<String>(
                        value: null,
                        child: Text('All Status'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'available',
                        child: Text('Available'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'occupied',
                        child: Text('Occupied'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedStatus = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          // Tables grid
          Expanded(
            child: tablesAsync.when(
              data: (tables) {
                if (tables.isEmpty) {
                  return const Center(
                    child: Text('No tables found'),
                  );
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: tables.length,
                  itemBuilder: (context, index) {
                    final table = tables[index];
                    return TableCard(
                      table: table,
                      onTap: () {
                        widget.onTableSelected(table.id);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: $error'),
                    ElevatedButton(
                      onPressed: () {
                        ref.invalidate(tablesProvider(_cachedFilters!));
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

