import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/sync_status_indicator.dart';
import '../../../../shared/widgets/manual_sync_button.dart';
import '../../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../../features/auth/presentation/screens/login_screen.dart';
import '../providers/order_provider.dart';
import '../../data/models/order_model.dart';
import 'order_detail_screen.dart';
import 'create_order_screen.dart';

class OrderListScreen extends ConsumerStatefulWidget {
  const OrderListScreen({super.key});

  @override
  ConsumerState<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends ConsumerState<OrderListScreen> {
  String? _selectedStatus;
  Map<String, dynamic>? _cachedFilters;
  int? _cachedUserId;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authStateProvider).user;
    final userId = user?.id;
    
    // Only recreate filters if status or userId changed
    if (_cachedFilters == null || 
        _cachedFilters!['status'] != _selectedStatus || 
        _cachedUserId != userId) {
      _cachedFilters = {
        'status': _selectedStatus,
        'waiter_id': userId,
      };
      _cachedUserId = userId;
    }

    final ordersAsync = ref.watch(orderListProvider(_cachedFilters!));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        actions: [
          const SyncStatusIndicator(),
          const ManualSyncButton(),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(authStateProvider.notifier).logout();
              if (mounted) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Status filter
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedStatus,
                    hint: const Text('All Status'),
                    isExpanded: true,
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
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    ref.invalidate(orderListProvider(_cachedFilters!));
                  },
                ),
              ],
            ),
          ),
          // Orders list
          Expanded(
            child: ordersAsync.when(
              data: (orders) {
                if (orders.isEmpty) {
                  return const Center(
                    child: Text('No orders found'),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(orderListProvider(_cachedFilters!));
                  },
                  child: ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
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
                    Text('Error: $error'),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const CreateOrderScreen(),
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('New Order'),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final OrderModel order;

  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(order.orderNumber),
        ),
        title: Text(
          order.formattedOrderNumber,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (order.table != null)
              Text('Table: ${order.table!.tableCode}'),
            Text('Status: ${order.status.toUpperCase()}'),
            Text('Total: \$${order.total.toStringAsFixed(2)}'),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => OrderDetailScreen(orderId: order.id),
            ),
          );
        },
      ),
    );
  }
}
