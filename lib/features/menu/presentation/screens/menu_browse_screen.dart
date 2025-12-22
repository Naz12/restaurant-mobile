import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/menu_provider.dart';
import '../widgets/menu_item_card.dart';
import 'menu_item_detail_screen.dart';

class MenuBrowseScreen extends ConsumerStatefulWidget {
  final Function(Map<String, dynamic>) onItemSelected;

  const MenuBrowseScreen({
    super.key,
    required this.onItemSelected,
  });

  @override
  ConsumerState<MenuBrowseScreen> createState() => _MenuBrowseScreenState();
}

class _MenuBrowseScreenState extends ConsumerState<MenuBrowseScreen> {
  int? _selectedCategoryId;
  String? _searchQuery;
  Map<String, dynamic>? _cachedFilters;
  int? _cachedCategoryId;
  String? _cachedSearchQuery;

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(menuCategoriesProvider);
    
    // Only recreate filters if category or search changed
    if (_cachedFilters == null || 
        _cachedCategoryId != _selectedCategoryId || 
        _cachedSearchQuery != _searchQuery) {
      _cachedFilters = {
        'category_id': _selectedCategoryId,
        'search': _searchQuery,
      };
      _cachedCategoryId = _selectedCategoryId;
      _cachedSearchQuery = _searchQuery;
    }
    
    final itemsAsync = ref.watch(menuItemsProvider(_cachedFilters!));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Menu Items'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search items...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.isEmpty ? null : value;
                });
              },
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          // Categories sidebar
          categoriesAsync.when(
            data: (categories) {
              if (categories.isEmpty) {
                return const SizedBox.shrink();
              }
              return Container(
                width: 200,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text('All Items'),
                      selected: _selectedCategoryId == null,
                      onTap: () {
                        setState(() {
                          _selectedCategoryId = null;
                        });
                      },
                    ),
                    ...categories.map((category) {
                      return ListTile(
                        title: Text(category.categoryName),
                        subtitle: Text('${category.itemsCount} items'),
                        selected: _selectedCategoryId == category.id,
                        onTap: () {
                          setState(() {
                            _selectedCategoryId = category.id;
                          });
                        },
                      );
                    }),
                  ],
                ),
              );
            },
            loading: () => const SizedBox(
              width: 200,
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => const SizedBox.shrink(),
          ),
          // Menu items grid
          Expanded(
            child: itemsAsync.when(
              data: (items) {
                if (items.isEmpty) {
                  return const Center(
                    child: Text('No items found'),
                  );
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return MenuItemCard(
                      item: item,
                      onTap: () async {
                        final selectedItem = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => MenuItemDetailScreen(
                              itemId: item.id,
                              onItemSelected: widget.onItemSelected,
                            ),
                          ),
                        );
                        if (selectedItem != null && mounted) {
                          Navigator.of(context).pop(selectedItem);
                        }
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
                        ref.invalidate(menuItemsProvider(_cachedFilters!));
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

