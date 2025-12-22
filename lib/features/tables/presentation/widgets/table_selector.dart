import 'package:flutter/material.dart';
import '../screens/table_selection_screen.dart';

class TableSelector extends StatelessWidget {
  final Function(int) onTableSelected;
  final int? selectedTableId;

  const TableSelector({
    super.key,
    required this.onTableSelected,
    this.selectedTableId,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => TableSelectionScreen(
              onTableSelected: onTableSelected,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Table',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  selectedTableId != null
                      ? 'Table #$selectedTableId'
                      : 'Tap to select table',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: selectedTableId != null
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: selectedTableId != null
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}

