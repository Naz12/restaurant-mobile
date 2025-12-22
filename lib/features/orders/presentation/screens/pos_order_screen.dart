import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/order_provider.dart';
import '../../../tables/presentation/screens/table_selection_screen.dart';
import '../../../tables/data/repositories/table_repository.dart';
import '../../../menu/presentation/screens/menu_item_detail_screen.dart';
import '../../../menu/presentation/widgets/menu_item_card.dart';
import '../../../menu/presentation/providers/menu_provider.dart';
import '../../../menu/data/models/menu_item_model.dart';
import '../../../../shared/services/permission_service.dart';
import '../../../../features/auth/presentation/providers/auth_provider.dart';
import '../../data/models/cart_item_model.dart';

/// POS-style order creation screen matching web version
class PosOrderScreen extends ConsumerStatefulWidget {
  const PosOrderScreen({super.key});

  @override
  ConsumerState<PosOrderScreen> createState() => _PosOrderScreenState();
}

class _PosOrderScreenState extends ConsumerState<PosOrderScreen> {
  // Order configuration
  int? _selectedOrderTypeId;
  String? _selectedOrderTypeName;
  int? _selectedTableId;
  String? _selectedTableCode;
  int _numberOfPax = 1;
  String? _orderNote;
  
  // Cart management
  final Map<String, CartItem> _cartItems = {}; // key -> CartItem
  double _subTotal = 0.0;
  double _discountAmount = 0.0;
  String? _discountType; // 'percent' or 'fixed'
  double _discountValue = 0.0;
  double _tipAmount = 0.0;
  double _deliveryFee = 0.0;
  double _total = 0.0;
  
  // UI state
  bool _showCart = false;
  int? _selectedCategoryId;
  String? _searchQuery;

  @override
  void initState() {
    super.initState();
    _loadOrderTypes();
  }

  Future<void> _loadOrderTypes() async {
    // TODO: Load order types from API
    // For now, default to dine-in
    setState(() {
      _selectedOrderTypeId = 1;
      _selectedOrderTypeName = 'Dine In';
    });
  }


  void _addToCart(MenuItemModel item, {
    MenuItemVariationModel? variation,
    List<int> modifierOptionIds = const [],
    String? note,
    int quantity = 1,
  }) {
    final key = _generateCartKey(item.id, variation?.id);
    
    setState(() {
      if (_cartItems.containsKey(key)) {
        // Update existing item
        final existing = _cartItems[key]!;
        _cartItems[key] = existing.copyWith(
          quantity: existing.quantity + quantity,
        );
      } else {
        // Add new item
        final basePrice = variation?.price ?? item.price;
        // TODO: Calculate modifier price from modifierOptionIds
        final modifierPrice = 0.0; // Calculate from modifierOptionIds
        
        _cartItems[key] = CartItem(
          key: key,
          menuItem: item,
          variation: variation,
          quantity: quantity,
          modifierOptionIds: modifierOptionIds,
          note: note,
          basePrice: basePrice,
          modifierPrice: modifierPrice,
          totalPrice: (basePrice + modifierPrice) * quantity,
        );
      }
      _calculateTotals();
    });
  }

  String _generateCartKey(int itemId, int? variationId) {
    return variationId != null ? '${itemId}_$variationId' : '$itemId';
  }

  void _updateCartItemQuantity(String key, int quantity) {
    if (quantity <= 0) {
      _removeFromCart(key);
      return;
    }
    
    setState(() {
      final item = _cartItems[key]!;
      _cartItems[key] = item.copyWith(
        quantity: quantity,
        totalPrice: (item.basePrice + item.modifierPrice) * quantity,
      );
      _calculateTotals();
    });
  }

  void _removeFromCart(String key) {
    setState(() {
      _cartItems.remove(key);
      _calculateTotals();
    });
  }

  void _calculateTotals() {
    _subTotal = _cartItems.values.fold(0.0, (sum, item) => sum + item.totalPrice);
    
    // Calculate discount
    if (_discountType != null && _discountValue > 0) {
      if (_discountType == 'percent') {
        _discountAmount = (_subTotal * _discountValue) / 100;
      } else {
        _discountAmount = _discountValue;
      }
    } else {
      _discountAmount = 0.0;
    }
    
    // Calculate total
    _total = _subTotal - _discountAmount + _tipAmount + _deliveryFee;
  }

  Future<void> _createOrder(String action) async {
    if (_cartItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add items to cart'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_selectedOrderTypeId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select order type'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // For dine_in, table is required
    if (_selectedOrderTypeName == 'Dine In' && _selectedTableId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a table'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final notifier = ref.read(createOrderProvider.notifier);
    
    // Convert cart items to API format
    final items = _cartItems.values.map((item) => item.toOrderItemJson()).toList();
    
    // Determine order status based on action
    // 'kot' -> creates order with status='kot' (backend creates KOTs)
    // 'bill' -> creates order with status='billed' (backend creates order items)
    
                      final order = await notifier.createOrder(
      tableId: _selectedTableId, // Can be null for non-dine_in
      orderTypeId: _selectedOrderTypeId!,
      numberOfPax: _numberOfPax,
      items: items,
      orderNote: _orderNote,
    );

    if (order != null && mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(action == 'kot' 
            ? 'KOT created successfully' 
            : 'Order created successfully'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final permissionService = ref.read(permissionServiceProvider);
    final canCreateOrder = permissionService.userCan('Create Order');
    final canAddDiscount = permissionService.userCan('Add Discount on POS');
    
    if (!canCreateOrder) {
      return Scaffold(
        appBar: AppBar(title: const Text('Create Order')),
        body: const Center(
          child: Text('You do not have permission to create orders'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Order'),
        actions: [
          if (_cartItems.isNotEmpty)
            IconButton(
              icon: Stack(
                children: [
                  const Icon(Icons.shopping_cart),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        '${_cartItems.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                setState(() {
                  _showCart = !_showCart;
                });
              },
            ),
        ],
      ),
      body: Row(
        children: [
          // Menu section (left side)
          Expanded(
            flex: 2,
            child: _buildMenuSection(),
          ),
          // Cart section (right side or bottom sheet on mobile)
          if (MediaQuery.of(context).size.width > 800)
            Container(
              width: 400,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.grey.shade300),
                ),
                color: Colors.grey.shade50,
              ),
              child: _buildCartSection(canAddDiscount),
            ),
        ],
      ),
      // Bottom cart sheet for mobile
      bottomSheet: MediaQuery.of(context).size.width <= 800 && _showCart
          ? Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: _buildCartSection(canAddDiscount),
            )
          : null,
    );
  }

  Widget _buildMenuSection() {
    return Column(
      children: [
        // Order type and table selection header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: Column(
            children: [
              // Order type selection
              Row(
                children: [
                  const Text('Order Type: '),
                  Expanded(
                    child: DropdownButton<int>(
                      value: _selectedOrderTypeId,
                      hint: const Text('Select Order Type'),
                      isExpanded: true,
                      items: [
                        const DropdownMenuItem(
                          value: 1,
                          child: Text('Dine In'),
                        ),
                        const DropdownMenuItem(
                          value: 2,
                          child: Text('Takeaway'),
                        ),
                        const DropdownMenuItem(
                          value: 3,
                          child: Text('Delivery'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedOrderTypeId = value;
                          _selectedOrderTypeName = value == 1 
                              ? 'Dine In' 
                              : value == 2 
                                  ? 'Takeaway' 
                                  : 'Delivery';
                          // Clear table if not dine_in
                          if (value != 1) {
                            _selectedTableId = null;
                            _selectedTableCode = null;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              // Table selection (only for dine_in)
              if (_selectedOrderTypeName == 'Dine In') ...[
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Table: '),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final tableId = await Navigator.of(context).push<int>(
                            MaterialPageRoute(
                              builder: (_) => TableSelectionScreen(
                                onTableSelected: (id) => Navigator.of(context).pop(id),
                              ),
                            ),
                          );
                          if (tableId != null) {
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
                                    content: Text('Error: $e'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _selectedTableCode ?? 'Select Table',
                                style: TextStyle(
                                  color: _selectedTableCode != null
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              ),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (_selectedTableCode != null) ...[
                      const SizedBox(width: 8),
                      Text('Pax: '),
                      SizedBox(
                        width: 60,
                        child: TextField(
                          controller: TextEditingController(text: '$_numberOfPax'),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 8),
                          ),
                          onChanged: (value) {
                            final pax = int.tryParse(value);
                            if (pax != null && pax > 0) {
                              setState(() {
                                _numberOfPax = pax;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ],
          ),
        ),
        // Menu browsing area
        Expanded(
          child: _buildMenuBrowseArea(),
        ),
      ],
    );
  }

  Widget _buildMenuBrowseArea() {
    final categoriesAsync = ref.watch(menuCategoriesProvider);
    
    // Only recreate filters if category or search changed
    final filters = {
      'category_id': _selectedCategoryId,
      'search': _searchQuery,
    };
    
    final itemsAsync = ref.watch(menuItemsProvider(filters));

    return Row(
      children: [
        // Categories sidebar
        Container(
          width: 200,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Colors.grey.shade300),
            ),
            color: Colors.grey.shade50,
          ),
          child: categoriesAsync.when(
            data: (categories) {
              return ListView(
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
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => const Center(child: Text('Error loading categories')),
          ),
        ),
        // Menu items grid
        Expanded(
          child: Column(
            children: [
              // Search bar
              Padding(
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
              // Items grid
              Expanded(
                child: itemsAsync.when(
                  data: (items) {
                    if (items.isEmpty) {
                      return const Center(child: Text('No items found'));
                    }
                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
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
                            await Navigator.of(context).push<Map<String, dynamic>>(
                              MaterialPageRoute(
                                builder: (_) => MenuItemDetailScreen(
                                  itemId: item.id,
                                  onItemSelected: (itemData) {
                                    // Extract data from itemData
                                    final menuItem = item;
                                    final variationId = itemData['variation_id'] as int?;
                                    final variation = variationId != null
                                        ? menuItem.variations?.firstWhere((v) => v.id == variationId)
                                        : null;
                                    final modifiers = (itemData['modifiers'] as List<dynamic>?)
                                        ?.map((e) => e as int)
                                        .toList() ?? [];
                                    final note = itemData['note'] as String?;
                                    final quantity = itemData['quantity'] as int? ?? 1;
                                    
                                    _addToCart(
                                      menuItem,
                                      variation: variation,
                                      modifierOptionIds: modifiers,
                                      note: note,
                                      quantity: quantity,
                                    );
                                    
                                    // Show cart on mobile
                                    if (MediaQuery.of(context).size.width <= 800) {
                                      setState(() {
                                        _showCart = true;
                                      });
                                    }
                                  },
                                ),
                              ),
                            );
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
                            ref.invalidate(menuItemsProvider(filters));
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
        ),
      ],
    );
  }

  Widget _buildCartSection(bool canAddDiscount) {
    return Column(
      children: [
        // Cart header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Cart',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (MediaQuery.of(context).size.width <= 800)
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      _showCart = false;
                    });
                  },
                ),
            ],
          ),
        ),
        // Cart items list
        Expanded(
          child: _cartItems.isEmpty
              ? const Center(
                  child: Text('Cart is empty'),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: _cartItems.length,
                  itemBuilder: (context, index) {
                    final item = _cartItems.values.elementAt(index);
                    return _buildCartItemCard(item);
                  },
                ),
        ),
        // Totals and actions
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: Column(
            children: [
              // Discount section
              if (canAddDiscount && _cartItems.isNotEmpty) ...[
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _showDiscountDialog(),
                        icon: const Icon(Icons.discount),
                        label: const Text('Add Discount'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade200,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
              // Totals
              _buildTotalRow('Subtotal', _subTotal),
              if (_discountAmount > 0)
                _buildTotalRow('Discount', -_discountAmount, isDiscount: true),
              if (_tipAmount > 0)
                _buildTotalRow('Tip', _tipAmount),
              if (_deliveryFee > 0)
                _buildTotalRow('Delivery Fee', _deliveryFee),
              const Divider(),
              _buildTotalRow('Total', _total, isTotal: true),
              const SizedBox(height: 16),
              // Action buttons
              if (_cartItems.isNotEmpty) ...[
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _createOrder('kot'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade700,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Create KOT'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _createOrder('bill'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Create Bill'),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCartItemCard(CartItem item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(item.menuItem.itemName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.variation != null)
              Text('Size: ${item.variation!.name}'),
            if (item.modifierOptionIds.isNotEmpty)
              Text('Modifiers: ${item.modifierOptionIds.length}'),
            if (item.note != null && item.note!.isNotEmpty)
              Text('Note: ${item.note}', style: TextStyle(fontStyle: FontStyle.italic)),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\$${item.totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline, size: 20),
                  onPressed: () {
                    _updateCartItemQuantity(item.key, item.quantity - 1);
                  },
                ),
                Text('${item.quantity}'),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline, size: 20),
                  onPressed: () {
                    _updateCartItemQuantity(item.key, item.quantity + 1);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline, size: 20, color: Colors.red),
                  onPressed: () {
                    _removeFromCart(item.key);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalRow(String label, double amount, {bool isDiscount = false, bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isDiscount ? Colors.green : Colors.black,
            ),
          ),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 18 : 14,
              color: isDiscount ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  void _showDiscountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Discount'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Discount Value',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _discountValue = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: _discountType,
              hint: const Text('Discount Type'),
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: 'percent', child: Text('Percent (%)')),
                DropdownMenuItem(value: 'fixed', child: Text('Fixed Amount')),
              ],
              onChanged: (value) {
                setState(() {
                  _discountType = value;
                });
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _calculateTotals();
              });
              Navigator.pop(context);
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}

