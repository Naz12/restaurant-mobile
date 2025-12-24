import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/navigation/navigation_config.dart';
import '../../../../core/navigation/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/app_scaffold.dart';
import '../../../../shared/widgets/responsive_layout.dart';
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
import '../../../payments/presentation/screens/payment_screen.dart';
import '../../../../shared/widgets/customer_selection_modal.dart';
import '../../../customers/data/models/customer_model.dart';
import '../../../../shared/widgets/waiter_selector.dart';
import '../../../waiters/data/models/waiter_model.dart';
import '../../../delivery_executives/data/models/delivery_executive_model.dart';
import '../../../delivery_executives/presentation/providers/delivery_executive_provider.dart';

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
  int? _orderNumber; // For existing orders
  CustomerModel? _selectedCustomer;
  WaiterModel? _selectedWaiter;
  DeliveryExecutiveModel? _selectedDeliveryExecutive;
  DateTime? _pickupTime;
  double _sgst = 0.0; // SGST amount
  double _cgst = 0.0; // CGST amount
  double _taxRate = 2.5; // Default tax rate (2.5% each for SGST and CGST)
  
  // Cart management
  final Map<String, CartItem> _cartItems = {}; // key -> CartItem
  double _subTotal = 0.0;
  double _discountAmount = 0.0;
  String? _discountType; // 'percent' or 'fixed'
  double _discountValue = 0.0;
  double _tipAmount = 0.0;
  double _deliveryFee = 0.0;
  double _serviceCharge = 0.0;
  double _packagingFee = 0.0;
  double _total = 0.0;
  
  // UI state
  int? _selectedCategoryId;
  String? _searchQuery;
  Map<String, dynamic>? _cachedMenuFilters;
  int? _cachedCategoryId;
  String? _cachedSearchQuery;
  int? _cachedOrderTypeId;

  @override
  void initState() {
    super.initState();
    _loadOrderTypes();
    _loadWaiter();
  }

  Future<void> _loadOrderTypes() async {
    // TODO: Load order types from API
    // For now, default to dine-in
    setState(() {
      _selectedOrderTypeId = 1;
      _selectedOrderTypeName = 'Dine In';
    });
  }

  Future<void> _loadWaiter() async {
    // Waiter is loaded from auth state
  }

  void _showOrderTypeModal() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.cardBackground,
        title: const Text(
          'Select Order Type',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
          ),
        ),
        content: const Text(
          'Choose your order type to proceed',
          style: TextStyle(
            color: AppTheme.textSecondary,
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _OrderTypeButton(
                icon: Icons.local_shipping,
                label: 'Delivery',
                onTap: () {
                  setState(() {
                    _selectedOrderTypeId = 3;
                    _selectedOrderTypeName = 'Delivery';
                  });
                  Navigator.of(context).pop();
                },
              ),
              _OrderTypeButton(
                icon: Icons.restaurant,
                label: 'Dine In',
                onTap: () {
                  setState(() {
                    _selectedOrderTypeId = 1;
                    _selectedOrderTypeName = 'Dine In';
                  });
                  Navigator.of(context).pop();
                },
              ),
              _OrderTypeButton(
                icon: Icons.shopping_bag,
                label: 'Pickup',
                onTap: () {
                  setState(() {
                    _selectedOrderTypeId = 2;
                    _selectedOrderTypeName = 'Pickup';
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ],
      ),
    );
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
    
    // Calculate item-level taxes if available, otherwise use order-level
    double totalItemTax = 0.0;
    bool hasItemLevelTax = false;
    
    // Update cart items with tax calculations
    final updatedCartItems = <String, CartItem>{};
    for (final entry in _cartItems.entries) {
      final item = entry.value;
      // Check if item has tax rate (from menu item - would need to be loaded from API)
      // For now, we'll use order-level tax, but structure supports item-level
      final itemTaxRate = item.itemTaxRate ?? _taxRate;
      final itemTaxAmount = (item.totalPrice * itemTaxRate) / 100;
      
      if (item.itemTaxRate != null) {
        hasItemLevelTax = true;
      }
      
      totalItemTax += itemTaxAmount;
      
      updatedCartItems[entry.key] = item.copyWith(
        itemTaxRate: itemTaxRate,
        itemTaxAmount: itemTaxAmount,
      );
    }
    
    // Update cart items with tax info
    _cartItems.clear();
    _cartItems.addAll(updatedCartItems);
    
    // Calculate tax (item-level or order-level)
    final taxableAmount = _subTotal - _discountAmount;
    if (hasItemLevelTax) {
      // Use item-level tax total
      _sgst = totalItemTax / 2; // Split equally for SGST/CGST
      _cgst = totalItemTax / 2;
    } else {
      // Use order-level tax calculation
      _sgst = (taxableAmount * _taxRate) / 100;
      _cgst = (taxableAmount * _taxRate) / 100;
    }
    
    // Calculate total
    _total = taxableAmount + _sgst + _cgst + _tipAmount + _deliveryFee + _serviceCharge + _packagingFee;
  }

  Future<void> _createOrder(String action) async {
    if (_cartItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add items to cart'),
          backgroundColor: AppTheme.errorRed,
        ),
      );
      return;
    }

    if (_selectedOrderTypeId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select order type'),
          backgroundColor: AppTheme.errorRed,
        ),
      );
      return;
    }

    // For dine_in, table is required
    if (_selectedOrderTypeName == 'Dine In' && _selectedTableId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a table'),
          backgroundColor: AppTheme.errorRed,
        ),
      );
      return;
    }

    final notifier = ref.read(createOrderProvider.notifier);
    
    // Convert cart items to API format
    final items = _cartItems.values.map((item) => item.toOrderItemJson()).toList();
    
    // Create order with action and financial parameters (matching web implementation)
    final order = await notifier.createOrder(
      tableId: _selectedTableId, // Can be null for non-dine_in
      orderTypeId: _selectedOrderTypeId!,
      numberOfPax: _numberOfPax,
      items: items,
      orderNote: _orderNote,
      action: action, // Pass action to determine order status
      discountType: _discountType,
      discountValue: _discountValue > 0 ? _discountValue : null,
      tipAmount: _tipAmount > 0 ? _tipAmount : null,
      deliveryFee: _deliveryFee > 0 ? _deliveryFee : null,
      serviceCharge: _serviceCharge > 0 ? _serviceCharge : null,
      packagingFee: _packagingFee > 0 ? _packagingFee : null,
      customerId: _selectedCustomer?.id,
      waiterId: _selectedWaiter?.id ?? ref.read(authStateProvider).user?.id, // Use selected waiter or default to current user
      deliveryExecutiveId: _selectedDeliveryExecutive?.id,
      pickupTime: _pickupTime,
    );

    if (order != null && mounted) {
      // Show success message
      String successMessage;
      if (action.contains('kot') && action.contains('bill') && action.contains('payment')) {
        successMessage = 'Order, KOT, and Bill created successfully';
      } else if (action.contains('kot') && action.contains('bill')) {
        successMessage = 'Order, KOT, and Bill created successfully';
      } else if (action.contains('kot')) {
        successMessage = 'KOT created successfully';
      } else if (action.contains('bill')) {
        successMessage = 'Order and Bill created successfully';
      } else {
        successMessage = 'Order created successfully';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(successMessage),
          backgroundColor: AppTheme.successGreen,
        ),
      );

      // If action contains 'payment', show payment modal (matching web flow)
      if (action.contains('payment')) {
        // Wait a bit for the snackbar to show, then open payment modal
        await Future.delayed(const Duration(milliseconds: 500));
        
        if (mounted) {
          final paymentResult = await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (context) => PaymentScreen(
              orderId: order.id,
              orderTotal: _total,
              orderNumber: order.formattedOrderNumber,
            ),
          );

          // If payment was successful, navigate back
          if (paymentResult == true && mounted) {
            Navigator.of(context).pop();
          }
        }
      } else {
        // For non-payment actions, navigate back after showing message
        await Future.delayed(const Duration(milliseconds: 1500));
        if (mounted) {
          Navigator.of(context).pop();
        }
      }
    } else if (mounted) {
      // Show error if order creation failed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(ref.read(createOrderProvider).error ?? 'Failed to create order'),
          backgroundColor: AppTheme.errorRed,
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
      final currentRoute = AppRouter.getRouteFromPath(GoRouterState.of(context).uri.path);
      return AppScaffold(
        currentRoute: currentRoute,
        child: const Center(
          child: Text(
            'You do not have permission to create orders',
            style: TextStyle(color: AppTheme.textPrimary),
          ),
        ),
      );
    }

    // Show order type selection modal if not selected
    if (_selectedOrderTypeId == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showOrderTypeModal();
      });
    }

    final isTablet = ResponsiveLayout.isTablet(context);

    return AppScaffold(
      currentRoute: AppRoute.pos,
      child: Container(
        color: AppTheme.darkerBackground,
        child: Row(
        children: [
          // Menu section (left side)
          Expanded(
              flex: isTablet ? 3 : 1,
            child: _buildMenuSection(),
          ),
            // Cart section (right side)
            if (isTablet)
            Container(
              width: 400,
                decoration: const BoxDecoration(
                border: Border(
                    left: BorderSide(color: Color(0xFF374151)),
                ),
                  color: AppTheme.darkBackground,
              ),
              child: _buildCartSection(canAddDiscount),
            ),
        ],
      ),
      ),
    );
  }

  Widget _buildMenuSection() {
    return Column(
      children: [
        // Search and category filters header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: AppTheme.darkBackground,
            border: Border(
              bottom: BorderSide(color: Color(0xFF374151)),
            ),
          ),
          child: Column(
            children: [
              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search your menu item here',
                  hintStyle: const TextStyle(color: AppTheme.textSecondary),
                  prefixIcon: const Icon(Icons.search, color: AppTheme.textSecondary),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.refresh, color: AppTheme.textSecondary),
                    onPressed: () {
                        setState(() {
                        _selectedCategoryId = null;
                        _searchQuery = null;
                        // Clear cached filters to force recreation on next build
                        if (_cachedMenuFilters != null) {
                          ref.invalidate(menuItemsProvider(_cachedMenuFilters!));
                        }
                        _cachedMenuFilters = null;
                        _cachedCategoryId = null;
                        _cachedSearchQuery = null;
                        });
                      },
                    ),
                  filled: true,
                  fillColor: AppTheme.cardBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFF4B5563)),
                              ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFF4B5563)),
                  ),
                  focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppTheme.primaryPurple, width: 2),
                          ),
                        ),
                style: const TextStyle(color: AppTheme.textPrimary),
                          onChanged: (value) {
                              setState(() {
                    _searchQuery = value.isEmpty ? null : value;
                    // Clear cached filters to force recreation on next build
                    if (_cachedMenuFilters != null) {
                      ref.invalidate(menuItemsProvider(_cachedMenuFilters!));
                    }
                    _cachedMenuFilters = null;
                    _cachedCategoryId = _selectedCategoryId;
                    _cachedSearchQuery = value.isEmpty ? null : value;
                              });
                          },
                        ),
              const SizedBox(height: 12),
              // Category filter buttons
              _buildCategoryFilters(),
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

  Widget _buildCategoryFilters() {
    final categoriesAsync = ref.watch(menuCategoriesProvider);
    
    return categoriesAsync.when(
            data: (categories) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
                children: [
              _CategoryFilterButton(
                label: 'Show All',
                isSelected: _selectedCategoryId == null,
                    onTap: () {
                        setState(() {
                        _selectedCategoryId = null;
                        // Clear cached filters to force recreation on next build
                        _cachedMenuFilters = null;
                        _cachedCategoryId = null;
                        _cachedSearchQuery = _searchQuery;
                        });
                      },
                  ),
              const SizedBox(width: 8),
                  ...categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _CategoryFilterButton(
                    label: category.categoryName,
                    isSelected: _selectedCategoryId == category.id,
                          onTap: () {
                            setState(() {
                              _selectedCategoryId = category.id;
                              // Clear cached filters to force recreation on next build
                              _cachedMenuFilters = null;
                              _cachedCategoryId = category.id;
                              _cachedSearchQuery = _searchQuery;
                            });
                          },
                  ),
                    );
                  }),
                ],
          ),
              );
            },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildMenuBrowseArea() {
    // Only recreate filters if category, search, or order type changed (prevent infinite refetch loop)
    if (_cachedMenuFilters == null || 
        _cachedCategoryId != _selectedCategoryId || 
        _cachedSearchQuery != _searchQuery ||
        _cachedOrderTypeId != _selectedOrderTypeId) {
      // Invalidate the old provider if it exists
      if (_cachedMenuFilters != null) {
        ref.invalidate(menuItemsProvider(_cachedMenuFilters!));
      }
      
      // Create new filter map with order type included
      _cachedMenuFilters = {
        'category_id': _selectedCategoryId,
        'search': _searchQuery,
        if (_selectedOrderTypeId != null) 'order_type_id': _selectedOrderTypeId,
      };
      _cachedCategoryId = _selectedCategoryId;
      _cachedSearchQuery = _searchQuery;
      _cachedOrderTypeId = _selectedOrderTypeId;
    }
    
    final itemsAsync = ref.watch(menuItemsProvider(_cachedMenuFilters!));

    return Container(
      color: AppTheme.darkerBackground,
                child: itemsAsync.when(
                  data: (items) {
                    if (items.isEmpty) {
            return const Center(
              child: Text(
                'No items found',
                style: TextStyle(color: AppTheme.textSecondary),
              ),
            );
                    }
          final gridColumns = ResponsiveLayout.getGridColumns(
            context,
            mobile: 2,
            tablet: 3,
            desktop: 4,
          );
                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridColumns,
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
                            final result = await Navigator.of(context).push<Map<String, dynamic>>(
                              MaterialPageRoute(
                                builder: (_) => MenuItemDetailScreen(
                                  itemId: item.id,
                                  onItemSelected: (itemData) {
                                    // This callback is called when Add to Order is pressed
                                    // The data will be passed back via Navigator.pop
                                  },
                                ),
                              ),
                            );
                            
                            // Handle the result when returning from detail screen
                            if (result != null && mounted) {
                              try {
                                final variationId = result['variation_id'] as int?;
                                MenuItemVariationModel? variation;
                                if (variationId != null && item.variations != null) {
                                  try {
                                    variation = item.variations!.firstWhere((v) => v.id == variationId);
                                  } catch (e) {
                                    // Variation not found, use null
                                    variation = null;
                                  }
                                }
                                final modifiers = (result['modifiers'] as List<dynamic>?)
                                    ?.map((e) => e as int)
                                    .toList() ?? [];
                                final note = result['note'] as String?;
                                final quantity = result['quantity'] as int? ?? 1;
                                
                                _addToCart(
                                  item,
                                  variation: variation,
                                  modifierOptionIds: modifiers,
                                  note: note,
                                  quantity: quantity,
                                );
                                
                                // Show success message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${item.itemName} added to order'),
                                    backgroundColor: AppTheme.successGreen,
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                              } catch (e) {
                                // Show error if something went wrong
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Error adding item: $e'),
                                      backgroundColor: AppTheme.errorRed,
                                    ),
                                  );
                                }
                              }
                            }
                          },
                        );
                      },
                    );
                  },
        loading: () => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryPurple),
          ),
        ),
                  error: (error, stack) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
              Text(
                'Error: $error',
                style: const TextStyle(color: AppTheme.errorRed),
              ),
              const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            if (_cachedMenuFilters != null) {
                              ref.invalidate(menuItemsProvider(_cachedMenuFilters!));
                            }
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }

  Widget _buildCartSection(bool canAddDiscount) {
    return Column(
      children: [
        // Order header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: AppTheme.darkBackground,
            border: Border(
              bottom: BorderSide(color: Color(0xFF374151)),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                  Text(
                    'Order Type: ${_selectedOrderTypeName ?? "Not Selected"}',
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontWeight: FontWeight.w600,
                ),
              ),
                  TextButton(
                    onPressed: _showOrderTypeModal,
                    child: const Text('Change'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => CustomerSelectionModal(
                      onCustomerSelected: (customer) {
                        setState(() {
                          _selectedCustomer = customer;
                        });
                      },
                      selectedCustomer: _selectedCustomer,
                    ),
                  );
                },
                icon: const Icon(Icons.person_add, size: 16),
                label: Text(_selectedCustomer != null 
                    ? 'Customer: ${_selectedCustomer!.name}' 
                    : '+ Add Customer Details'),
                style: TextButton.styleFrom(
                  foregroundColor: AppTheme.primaryPurple,
                ),
              ),
              if (_orderNumber != null) ...[
                const SizedBox(height: 8),
                Text(
                  'Order #$_orderNumber',
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              if (_selectedOrderTypeName == 'Dine In') ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () async {
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
                                  backgroundColor: AppTheme.errorRed,
                                ),
                              );
                            }
                          }
                        }
                      },
                      icon: const Icon(Icons.table_restaurant, size: 16),
                      label: Text(_selectedTableCode ?? 'Assign Table'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.cardBackground,
                        foregroundColor: AppTheme.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 8),
              // Waiter selection (for dine-in orders)
              if (_selectedOrderTypeName == 'Dine In')
                WaiterSelector(
                  selectedWaiter: _selectedWaiter,
                  onWaiterSelected: (waiter) {
                    setState(() {
                      _selectedWaiter = waiter;
                    });
                  },
                ),
              const SizedBox(height: 8),
              // Delivery executive selection (for delivery orders)
              if (_selectedOrderTypeName == 'Delivery')
                ref.watch(deliveryExecutivesProvider).when(
                  data: (executives) {
                    return DropdownButtonFormField<DeliveryExecutiveModel>(
                      value: _selectedDeliveryExecutive,
                      decoration: const InputDecoration(
                        labelText: 'Delivery Executive',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      items: executives.map((executive) {
                        return DropdownMenuItem<DeliveryExecutiveModel>(
                          value: executive,
                          child: Text('${executive.name} - ${executive.phone}'),
                        );
                      }).toList(),
                      onChanged: (executive) {
                        setState(() {
                          _selectedDeliveryExecutive = executive;
                        });
                      },
                    );
                  },
                  loading: () => const SizedBox(
                    height: 56,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (_, __) => const SizedBox.shrink(),
                ),
              if (_selectedOrderTypeName == 'Delivery') const SizedBox(height: 8),
              // Pickup time selection (for pickup orders)
              if (_selectedOrderTypeName == 'Pickup')
                InkWell(
                  onTap: () async {
                    final now = DateTime.now();
                    final selectedDateTime = await showDatePicker(
                      context: context,
                      initialDate: _pickupTime ?? now,
                      firstDate: now,
                      lastDate: now.add(const Duration(days: 30)),
                    );
                    if (selectedDateTime != null && mounted) {
                      final selectedTime = await showTimePicker(
                        context: context,
                        initialTime: _pickupTime != null
                            ? TimeOfDay.fromDateTime(_pickupTime!)
                            : TimeOfDay.now(),
                      );
                      if (selectedTime != null && mounted) {
                        setState(() {
                          _pickupTime = DateTime(
                            selectedDateTime.year,
                            selectedDateTime.month,
                            selectedDateTime.day,
                            selectedTime.hour,
                            selectedTime.minute,
                          );
                        });
                      }
                    }
                  },
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Pickup Time',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      suffixIcon: Icon(Icons.access_time),
                    ),
                    child: Text(
                      _pickupTime != null
                          ? '${_pickupTime!.day}/${_pickupTime!.month}/${_pickupTime!.year} ${_pickupTime!.hour.toString().padLeft(2, '0')}:${_pickupTime!.minute.toString().padLeft(2, '0')}'
                          : 'Select pickup time',
                      style: TextStyle(
                        color: _pickupTime != null
                            ? AppTheme.textPrimary
                            : AppTheme.textSecondary,
                      ),
                    ),
                  ),
                ),
              if (_selectedOrderTypeName == 'Pickup') const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.people, size: 16, color: AppTheme.textSecondary),
                  const SizedBox(width: 4),
                  Text(
                    'Pax $_numberOfPax',
                    style: const TextStyle(color: AppTheme.textSecondary),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, size: 16),
                    color: AppTheme.textSecondary,
                    onPressed: () {
                      _showPaxDialog();
                    },
                  ),
                ],
                ),
            ],
          ),
        ),
        // Cart items list
        Expanded(
          child: _cartItems.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 64,
                        color: AppTheme.textSecondary.withOpacity(0.5),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'No record found',
                        style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  color: AppTheme.darkerBackground,
                  child: Column(
                    children: [
                      // Table header
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: const BoxDecoration(
                          color: AppTheme.darkBackground,
                          border: Border(
                            bottom: BorderSide(color: Color(0xFF374151)),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Expanded(flex: 3, child: Text('ITEM NAME', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSecondary))),
                            Expanded(flex: 1, child: Text('QTY', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSecondary), textAlign: TextAlign.center)),
                            Expanded(flex: 1, child: Text('PRICE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSecondary), textAlign: TextAlign.center)),
                            Expanded(flex: 1, child: Text('AMOUNT', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSecondary), textAlign: TextAlign.center)),
                            Expanded(flex: 1, child: Text('ACTION', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.textSecondary), textAlign: TextAlign.center)),
                          ],
                        ),
                      ),
                      // Items list
                      Expanded(
                        child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: _cartItems.length,
                  itemBuilder: (context, index) {
                    final item = _cartItems.values.elementAt(index);
                    return _buildCartItemCard(item);
                  },
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        // Totals and actions
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: AppTheme.darkBackground,
            border: Border(
              top: BorderSide(color: Color(0xFF374151)),
            ),
          ),
          child: Column(
            children: [
              // Order summary
              _buildTotalRow('Item(s)', _cartItems.values.fold<int>(0, (sum, item) => sum + item.quantity).toDouble(), isLabel: true),
              _buildTotalRow('Sub Total', _subTotal),
              if (canAddDiscount && _discountAmount == 0)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Discount',
                        style: TextStyle(color: AppTheme.textSecondary),
                      ),
                      TextButton(
                        onPressed: _showDiscountDialog,
                        child: const Text('+ Add Discount'),
                      ),
                    ],
                  ),
                ),
              if (_discountAmount > 0)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount',
                        style: TextStyle(
                          color: AppTheme.errorRed,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '-\$${_discountAmount.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: AppTheme.errorRed,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.close, size: 16),
                            color: AppTheme.errorRed,
                            onPressed: () {
                              setState(() {
                                _discountType = null;
                                _discountValue = 0.0;
                                _discountAmount = 0.0;
                                _calculateTotals();
                              });
                            },
                            tooltip: 'Remove Discount',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              // Show item-level tax breakdown if available, otherwise order-level
              if (_cartItems.values.any((item) => item.itemTaxAmount != null && item.itemTaxAmount! > 0)) ...[
                // Item-level tax breakdown
                ExpansionTile(
                  title: const Text(
                    'Tax Breakdown',
                    style: TextStyle(fontSize: 14),
                  ),
                  children: _cartItems.values.where((item) => item.itemTaxAmount != null && item.itemTaxAmount! > 0).map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${item.menuItem.itemName} (x${item.quantity})',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          Text(
                            '\$${(item.itemTaxAmount! * item.quantity).toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                _buildTotalRow('Total Tax', _sgst + _cgst),
              ] else ...[
                // Order-level tax
                _buildTotalRow('SGST (${_taxRate}%)', _sgst),
                _buildTotalRow('CGST (${_taxRate}%)', _cgst),
              ],
              if (_serviceCharge > 0)
                _buildTotalRow('Service Charge', _serviceCharge),
              if (_packagingFee > 0)
                _buildTotalRow('Packaging Fee', _packagingFee),
              if (_tipAmount > 0)
                _buildTotalRow('Tip', _tipAmount),
              if (_deliveryFee > 0)
                _buildTotalRow('Delivery Fee', _deliveryFee),
              const Divider(color: Color(0xFF374151)),
              _buildTotalRow('Total', _total, isTotal: true),
              const SizedBox(height: 8),
              // Extra charges buttons
              Row(
                children: [
                  if (_serviceCharge == 0)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _showExtraChargeDialog('Service Charge', (value) {
                          setState(() {
                            _serviceCharge = value;
                            _calculateTotals();
                          });
                        }),
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('Service Charge'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ),
                  if (_serviceCharge == 0 && _packagingFee == 0) const SizedBox(width: 8),
                  if (_packagingFee == 0)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _showExtraChargeDialog('Packaging Fee', (value) {
                          setState(() {
                            _packagingFee = value;
                            _calculateTotals();
                          });
                        }),
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('Packaging Fee'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ),
                ],
              ),
              if (_serviceCharge > 0 || _packagingFee > 0) ...[
                const SizedBox(height: 4),
                Wrap(
                  spacing: 8,
                  children: [
                    if (_serviceCharge > 0)
                      Chip(
                        label: Text('Service Charge: \$${_serviceCharge.toStringAsFixed(2)}'),
                        onDeleted: () {
                          setState(() {
                            _serviceCharge = 0.0;
                            _calculateTotals();
                          });
                        },
                        deleteIcon: const Icon(Icons.close, size: 16),
                      ),
                    if (_packagingFee > 0)
                      Chip(
                        label: Text('Packaging Fee: \$${_packagingFee.toStringAsFixed(2)}'),
                        onDeleted: () {
                          setState(() {
                            _packagingFee = 0.0;
                            _calculateTotals();
                          });
                        },
                        deleteIcon: const Icon(Icons.close, size: 16),
                      ),
                  ],
                ),
              ],
              const SizedBox(height: 16),
              // Action buttons
              if (_cartItems.isNotEmpty) ...[
                // KOT buttons row
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _createOrder('kot'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.cardBackground,
                          foregroundColor: AppTheme.textPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('KOT'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _createOrder('kot_print'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.cardBackground,
                          foregroundColor: AppTheme.textPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('KOT & Print'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _createOrder('kot_bill_payment'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.cardBackground,
                          foregroundColor: AppTheme.textPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('KOT, Bill & Payment'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Bill buttons row
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _createOrder('bill'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryPurple,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('BILL'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _createOrder('bill_payment'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.successGreen,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Bill & Payment'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _createOrder('bill_print'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.infoBlue,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Bill & Print'),
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
    final itemPrice = item.basePrice + item.modifierPrice;
    final itemAmount = itemPrice * item.quantity;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFF374151)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Text(
                  item.menuItem.itemName,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            if (item.variation != null)
                  Text(
                    'Variation: ${item.variation!.name ?? 'Variation ${item.variation!.id}'}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                    ),
                  ),
            if (item.modifierOptionIds.isNotEmpty)
                  Text(
                    'Modifiers: ${item.modifierOptionIds.length}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                    ),
                  ),
            if (item.note != null && item.note!.isNotEmpty)
                  Text(
                    'Note: ${item.note}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
          ],
        ),
          ),
          Expanded(
            flex: 1,
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline, size: 18),
                  color: AppTheme.textSecondary,
                  onPressed: () {
                    _updateCartItemQuantity(item.key, item.quantity - 1);
                  },
                ),
                SizedBox(
                  width: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppTheme.textPrimary),
                    controller: TextEditingController(text: '${item.quantity}')..selection = TextSelection.collapsed(offset: '${item.quantity}'.length),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      isDense: true,
                    ),
                    onSubmitted: (value) {
                      final newQuantity = int.tryParse(value) ?? item.quantity;
                      if (newQuantity > 0) {
                        _updateCartItemQuantity(item.key, newQuantity);
                      } else {
                        // Reset to current quantity if invalid
                        setState(() {});
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline, size: 18),
                  color: AppTheme.textSecondary,
                  onPressed: () {
                    _updateCartItemQuantity(item.key, item.quantity + 1);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                '\$${itemPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                '\$${itemAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: const Icon(Icons.delete_outline, size: 20),
              color: AppTheme.errorRed,
                  onPressed: () {
                    _removeFromCart(item.key);
                  },
                ),
            ),
          ],
      ),
    );
  }

  Widget _buildTotalRow(String label, double amount, {bool isDiscount = false, bool isTotal = false, bool isLabel = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isDiscount 
                  ? AppTheme.successGreen 
                  : isLabel
                      ? AppTheme.textSecondary
                      : AppTheme.textPrimary,
              fontSize: isTotal ? 18 : 14,
            ),
          ),
          Text(
            isLabel ? amount.toInt().toString() : '\$${amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isDiscount 
                  ? AppTheme.successGreen 
                  : isLabel
                      ? AppTheme.textSecondary
                      : AppTheme.textPrimary,
              fontSize: isTotal ? 18 : 14,
            ),
          ),
        ],
      ),
    );
  }

  void _showPaxDialog() {
    final controller = TextEditingController(text: '$_numberOfPax');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.cardBackground,
        title: const Text(
          'Number of Guests',
          style: TextStyle(color: AppTheme.textPrimary),
        ),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: AppTheme.textPrimary),
          decoration: const InputDecoration(
            labelText: 'Pax',
            labelStyle: TextStyle(color: AppTheme.textSecondary),
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final pax = int.tryParse(controller.text);
              if (pax != null && pax > 0) {
                setState(() {
                  _numberOfPax = pax;
                });
                Navigator.pop(context);
              }
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showDiscountDialog() {
    final valueController = TextEditingController(text: _discountValue > 0 ? _discountValue.toString() : '');
    String? selectedType = _discountType;
    
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          backgroundColor: AppTheme.cardBackground,
          title: const Text(
            'Add Discount',
            style: TextStyle(color: AppTheme.textPrimary),
          ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: valueController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: AppTheme.textPrimary),
              decoration: const InputDecoration(
                labelText: 'Discount Value',
                  labelStyle: TextStyle(color: AppTheme.textSecondary),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _discountValue = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
                value: selectedType,
              hint: const Text('Discount Type'),
              isExpanded: true,
                dropdownColor: AppTheme.cardBackground,
                style: const TextStyle(color: AppTheme.textPrimary),
              items: const [
                DropdownMenuItem(value: 'percent', child: Text('Percent (%)')),
                DropdownMenuItem(value: 'fixed', child: Text('Fixed Amount')),
              ],
              onChanged: (value) {
                  setDialogState(() {
                    selectedType = value;
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
                  _discountType = selectedType;
                  _discountValue = double.tryParse(valueController.text) ?? 0.0;
                _calculateTotals();
              });
              Navigator.pop(context);
            },
            child: const Text('Apply'),
          ),
        ],
        ),
      ),
    );
  }

  void _showExtraChargeDialog(String title, Function(double) onApply) {
    final valueController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.cardBackground,
        title: Text(
          'Add $title',
          style: const TextStyle(color: AppTheme.textPrimary),
        ),
        content: TextField(
          controller: valueController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: const TextStyle(color: AppTheme.textPrimary),
          decoration: const InputDecoration(
            labelText: 'Amount',
            labelStyle: TextStyle(color: AppTheme.textSecondary),
            border: OutlineInputBorder(),
            prefixText: '\$',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final value = double.tryParse(valueController.text) ?? 0.0;
              if (value > 0) {
                onApply(value);
                Navigator.pop(context);
              }
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}

class _OrderTypeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _OrderTypeButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: AppTheme.darkBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppTheme.primaryPurple,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: AppTheme.primaryPurple,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryFilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryFilterButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryPurple : AppTheme.cardBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppTheme.textPrimary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
