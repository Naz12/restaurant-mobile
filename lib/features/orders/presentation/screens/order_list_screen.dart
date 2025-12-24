import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/navigation/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/app_scaffold.dart';
import '../../../../shared/widgets/responsive_layout.dart';
import '../../../../shared/widgets/status_badge.dart';
import '../../../../shared/widgets/manual_sync_button.dart';
import '../../../../shared/widgets/date_range_picker.dart';
import '../../../../features/auth/presentation/providers/auth_provider.dart';
import '../providers/order_provider.dart';
import '../../data/models/order_model.dart';
import 'order_detail_screen.dart';
import 'pos_order_screen.dart';

class OrderListScreen extends ConsumerStatefulWidget {
  const OrderListScreen({super.key});

  @override
  ConsumerState<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends ConsumerState<OrderListScreen> {
  String? _selectedStatus;
  String? _selectedOrderType;
  DateTime? _startDate;
  DateTime? _endDate;
  String? _searchQuery;
  Map<String, dynamic>? _cachedFilters;
  int? _cachedUserId;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authStateProvider).user;
    final userId = user?.id;
    final currentRoute = AppRouter.getRouteFromPath(GoRouterState.of(context).uri.path);
    
    // Default to today's date if not set (matching web version behavior)
    final today = DateTime.now();
    final startOfDay = _startDate ?? DateTime(today.year, today.month, today.day);
    final endOfDay = _endDate ?? startOfDay.add(const Duration(days: 1));
    
    // Only recreate filters if status, order type, userId, or date range changed
    if (_cachedFilters == null || 
        _cachedFilters!['status'] != _selectedStatus || 
        _cachedFilters!['order_type'] != _selectedOrderType ||
        _cachedFilters!['start_date'] != startOfDay ||
        _cachedFilters!['end_date'] != endOfDay ||
        _cachedUserId != userId) {
      _cachedFilters = {
        'status': _selectedStatus,
        'order_type': _selectedOrderType,
        'waiter_id': userId,
        'start_date': startOfDay,
        'end_date': endOfDay,
      };
      _cachedUserId = userId;
    }

    final ordersAsync = ref.watch(orderListProvider(_cachedFilters!));
    final gridColumns = ResponsiveLayout.getGridColumns(context, mobile: 2, tablet: 3, desktop: 4);

    return AppScaffold(
      currentRoute: currentRoute,
      child: Container(
        color: AppTheme.darkerBackground,
        padding: ResponsiveLayout.getPadding(context),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Orders',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
                Row(
                  children: [
          const ManualSyncButton(),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const PosOrderScreen(),
                          ),
                );
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('New Order'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryPurple,
                      ),
                    ),
                  ],
          ),
        ],
      ),
            const SizedBox(height: 16),
            // Search and Filters
          Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.darkBackground,
                borderRadius: BorderRadius.circular(8),
              ),
            child: Column(
              children: [
                // Search bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search by order number, table, customer...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: AppTheme.cardBackground,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value.isEmpty ? null : value;
                    });
                  },
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        value: _selectedStatus,
                        hint: const Text('All Status'),
                        isExpanded: true,
                        dropdownColor: AppTheme.cardBackground,
                        style: const TextStyle(color: AppTheme.textPrimary),
                        items: [
                          'placed',
                          'confirmed',
                          'preparing',
                          'served',
                          'cancelled',
                        ].map((status) {
                          return DropdownMenuItem(
                            value: status,
                            child: Text(status.toUpperCase()),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedStatus = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButton<String>(
                        value: _selectedOrderType,
                        hint: const Text('All Order Types'),
                        isExpanded: true,
                        dropdownColor: AppTheme.cardBackground,
                        style: const TextStyle(color: AppTheme.textPrimary),
                        items: [
                          'dine_in',
                          'delivery',
                          'pickup',
                        ].map((type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(type.replaceAll('_', ' ').toUpperCase()),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedOrderType = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        ref.invalidate(orderListProvider(_cachedFilters!));
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: DateRangePicker(
                        startDate: _startDate,
                        endDate: _endDate,
                        onDateRangeSelected: (start, end) {
                          setState(() {
                            _startDate = start;
                            _endDate = end;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
            const SizedBox(height: 16),
            // Orders grid
          Expanded(
            child: ordersAsync.when(
              data: (orders) {
                // Filter orders by search query if provided
                final displayOrders = (_searchQuery == null || _searchQuery!.isEmpty)
                    ? orders
                    : orders.where((order) {
                        final query = _searchQuery!.toLowerCase();
                        return order.formattedOrderNumber.toLowerCase().contains(query) ||
                               (order.table != null && order.table!.tableCode.toLowerCase().contains(query)) ||
                               (order.waiter != null && order.waiter!.name.toLowerCase().contains(query));
                      }).toList();
                
                if (displayOrders.isEmpty) {
                  return const Center(
                      child: Text(
                        'No orders found',
                        style: TextStyle(color: AppTheme.textSecondary),
                      ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(orderListProvider(_cachedFilters!));
                  },
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: gridColumns,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.85,
                      ),
                    itemCount: displayOrders.length,
                    itemBuilder: (context, index) {
                      final order = displayOrders[index];
                      return _OrderCard(order: order);
                    },
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
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
                        ref.invalidate(orderListProvider(_cachedFilters!));
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
    );
  }
}

class _OrderCard extends StatelessWidget {
  final OrderModel order;

  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy hh:mm a');
    final formattedDate = dateFormat.format(order.createdAt);

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => OrderDetailScreen(orderId: order.id),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.formattedOrderNumber,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          order.table?.tableCode ?? 'Dine In',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (order.status.toLowerCase() == 'paid')
                        const StatusBadge(
                          label: 'PAID',
                          color: AppTheme.paidStatus,
                        ),
                      if (order.status.toLowerCase() == 'billed')
                        const StatusBadge(
                          label: 'BILLED',
                          color: AppTheme.billedStatus,
                        ),
                      const SizedBox(height: 4),
                      const StatusBadge(
                        label: 'POS',
                        color: AppTheme.kotStatus,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Order Date: $formattedDate',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${order.items.length} Item(s)',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  Text(
                    '\$${order.total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryPurple,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    order.status.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
              if (order.waiter != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 14,
                      color: AppTheme.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      order.waiter!.name,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
