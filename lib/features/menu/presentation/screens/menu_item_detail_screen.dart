import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../providers/menu_provider.dart';
import '../widgets/variation_selector.dart';
import '../widgets/modifier_selector.dart';

class MenuItemDetailScreen extends ConsumerStatefulWidget {
  final int itemId;
  final Function(Map<String, dynamic>) onItemSelected;

  const MenuItemDetailScreen({
    super.key,
    required this.itemId,
    required this.onItemSelected,
  });

  @override
  ConsumerState<MenuItemDetailScreen> createState() => _MenuItemDetailScreenState();
}

class _MenuItemDetailScreenState extends ConsumerState<MenuItemDetailScreen> {
  int _quantity = 1;
  int? _selectedVariationId;
  double _basePrice = 0;
  final Map<int, List<int>> _selectedModifiers = {}; // groupId -> [optionIds]
  String? _note;

  @override
  Widget build(BuildContext context) {
    final itemAsync = ref.watch(menuItemProvider({'id': widget.itemId}));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: itemAsync.when(
        data: (item) {
          _basePrice = _selectedVariationId != null
              ? item.variations?.firstWhere((v) => v.id == _selectedVariationId).price ?? item.price
              : item.price;

          double totalPrice = _basePrice * _quantity;
          for (final groupModifiers in _selectedModifiers.values) {
            for (final optionId in groupModifiers) {
              for (final group in item.modifierGroups ?? []) {
                final option = group.options.firstWhere(
                  (opt) => opt.id == optionId,
                  orElse: () => throw StateError('Option not found'),
                );
                totalPrice += option.price * _quantity;
              }
            }
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Item image
                if (item.image != null && item.image!.isNotEmpty)
                  SizedBox(
                    height: 250,
                    child: CachedNetworkImage(
                      imageUrl: item.image!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: Colors.grey.shade200,
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.restaurant_menu, size: 64),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Item name and price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.itemName,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            '\$${_basePrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      if (item.description != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          item.description!,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                      const SizedBox(height: 24),
                      // Variations
                      if (item.hasVariations && item.variations != null && item.variations!.isNotEmpty)
                        VariationSelector(
                          variations: item.variations!,
                          selectedVariationId: _selectedVariationId,
                          onVariationSelected: (variationId, price) {
                            setState(() {
                              _selectedVariationId = variationId;
                              _basePrice = price;
                            });
                          },
                        ),
                      // Modifier groups
                      if (item.modifierGroups != null && item.modifierGroups!.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        const Text(
                          'Add-ons & Modifiers',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...item.modifierGroups!.map((group) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: ModifierSelector(
                              group: group,
                              selectedOptions: _selectedModifiers[group.id] ?? [],
                              onOptionsChanged: (optionIds) {
                                setState(() {
                                  _selectedModifiers[group.id] = optionIds;
                                });
                              },
                            ),
                          );
                        }),
                      ],
                      // Note
                      const SizedBox(height: 24),
                      const Text(
                        'Special Instructions',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'Add any special instructions...',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                        onChanged: (value) {
                          _note = value.isEmpty ? null : value;
                        },
                      ),
                      // Quantity selector
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Quantity',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: () {
                                  if (_quantity > 1) {
                                    setState(() {
                                      _quantity--;
                                    });
                                  }
                                },
                              ),
                              Text(
                                '$_quantity',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () {
                                  setState(() {
                                    _quantity++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Total price
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${totalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                  ref.invalidate(menuItemProvider({'id': widget.itemId}));
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: itemAsync.when(
        data: (item) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                final selectedItem = {
                  'menu_item_id': item.id,
                  'variation_id': _selectedVariationId,
                  'quantity': _quantity,
                  'modifiers': _selectedModifiers.values.expand((ids) => ids).toList(),
                  'note': _note,
                };
                widget.onItemSelected(selectedItem);
                Navigator.of(context).pop(selectedItem);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Add to Order'),
            ),
          ),
        ),
        loading: () => const SizedBox.shrink(),
        error: (_, __) => const SizedBox.shrink(),
      ),
    );
  }
}

