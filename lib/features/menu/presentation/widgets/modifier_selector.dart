import 'package:flutter/material.dart';
import '../../data/models/menu_item_model.dart';

class ModifierSelector extends StatelessWidget {
  final ModifierGroupModel group;
  final List<int> selectedOptions;
  final Function(List<int>) onOptionsChanged;

  const ModifierSelector({
    super.key,
    required this.group,
    required this.selectedOptions,
    required this.onOptionsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  group.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (group.isRequired)
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      '(Required)',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
            if (group.description != null) ...[
              const SizedBox(height: 4),
              Text(
                group.description!,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
            ],
            if (group.minSelections > 0 || group.maxSelections > 0) ...[
              const SizedBox(height: 4),
              Text(
                'Select ${group.minSelections}-${group.maxSelections}',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
            ],
            const SizedBox(height: 8),
            ...group.options.map((option) {
              final isSelected = selectedOptions.contains(option.id);
              return CheckboxListTile(
                title: Text(option.name),
                subtitle: option.price > 0
                    ? Text('\$${option.price.toStringAsFixed(2)}')
                    : null,
                value: isSelected,
                onChanged: (value) {
                  final newSelection = List<int>.from(selectedOptions);
                  if (value == true) {
                    // Check max selections
                    if (group.maxSelections > 0 &&
                        newSelection.length >= group.maxSelections) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Maximum ${group.maxSelections} selection(s) allowed',
                          ),
                        ),
                      );
                      return;
                    }
                    newSelection.add(option.id);
                  } else {
                    newSelection.remove(option.id);
                  }
                  // Check min selections
                  if (group.minSelections > 0 &&
                      newSelection.length < group.minSelections) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Minimum ${group.minSelections} selection(s) required',
                        ),
                      ),
                    );
                    return;
                  }
                  onOptionsChanged(newSelection);
                },
                dense: true,
              );
            }),
          ],
        ),
      ),
    );
  }
}

