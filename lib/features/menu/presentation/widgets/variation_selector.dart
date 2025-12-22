import 'package:flutter/material.dart';
import '../../data/models/menu_item_model.dart';

class VariationSelector extends StatelessWidget {
  final List<MenuItemVariationModel> variations;
  final int? selectedVariationId;
  final Function(int variationId, double price) onVariationSelected;

  const VariationSelector({
    super.key,
    required this.variations,
    this.selectedVariationId,
    required this.onVariationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Size',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: variations.map((variation) {
            final isSelected = selectedVariationId == variation.id;
            return ChoiceChip(
              label: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(variation.name),
                  Text(
                    '\$${variation.price.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  onVariationSelected(variation.id, variation.price);
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

