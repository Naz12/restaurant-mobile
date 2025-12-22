import 'package:flutter/material.dart';
import '../screens/menu_browse_screen.dart';

class MenuSelector extends StatelessWidget {
  final Function(Map<String, dynamic>) onItemSelected;

  const MenuSelector({
    super.key,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        final selectedItem = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MenuBrowseScreen(
              onItemSelected: onItemSelected,
            ),
          ),
        );
        if (selectedItem != null) {
          onItemSelected(selectedItem);
        }
      },
      icon: const Icon(Icons.restaurant_menu),
      label: const Text('Select Menu Items'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    );
  }
}

