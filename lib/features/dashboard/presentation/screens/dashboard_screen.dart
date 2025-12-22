import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/navigation/navigation_config.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/app_scaffold.dart';
import '../../../../shared/widgets/responsive_layout.dart';
import '../../../../shared/widgets/status_badge.dart';
import '../providers/dashboard_provider.dart';
import '../../../orders/data/models/order_model.dart';
import '../../../orders/presentation/screens/order_detail_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(dashboardStatsProvider);
    final ordersAsync = ref.watch(todayOrdersProvider);
    final isTablet = ResponsiveLayout.isTablet(context);

    return AppScaffold(
      currentRoute: AppRoute.dashboard,
      child: Container(
        color: AppTheme.darkerBackground,
        padding: ResponsiveLayout.getPadding(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Statistics Section
            Expanded(
              flex: isTablet ? 1 : 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dashboard',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Statistics',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  statsAsync.when(
                    data: (stats) => _StatisticsCard(stats: stats),
                    loading: () => const _StatisticsCardLoading(),
                    error: (error, stack) => _StatisticsCardError(error: error.toString()),
                  ),
                ],
              ),
            ),
            if (isTablet) const SizedBox(width: 24),
            // Today's Orders Section
            Expanded(
              flex: isTablet ? 1 : 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 48), // Match Dashboard title height
                  const Text(
                    "Today's Orders",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ordersAsync.when(
                      data: (orders) => _TodayOrdersList(orders: orders),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (error, stack) => Center(
                        child: Text(
                          'Error: $error',
                          style: const TextStyle(color: AppTheme.errorRed),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatisticsCard extends StatelessWidget {
  final DashboardStats stats;

  const _StatisticsCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    final isPositive = stats.percentageChange >= 0;
    final changeText = isPositive
        ? '↑${stats.percentageChange.toStringAsFixed(0)}%'
        : '↓${stats.percentageChange.abs().toStringAsFixed(0)}%';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today's Orders",
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${stats.todayCount}',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  isPositive ? Icons.trending_up : Icons.trending_down,
                  color: isPositive ? AppTheme.successGreen : AppTheme.errorRed,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  '$changeText Since yesterday',
                  style: TextStyle(
                    fontSize: 14,
                    color: isPositive ? AppTheme.successGreen : AppTheme.errorRed,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatisticsCardLoading extends StatelessWidget {
  const _StatisticsCardLoading();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 14,
              width: 100,
              decoration: BoxDecoration(
                color: AppTheme.cardBackground,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 48,
              width: 80,
              decoration: BoxDecoration(
                color: AppTheme.cardBackground,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 14,
              width: 150,
              decoration: BoxDecoration(
                color: AppTheme.cardBackground,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatisticsCardError extends StatelessWidget {
  final String error;

  const _StatisticsCardError({required this.error});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'Error: $error',
          style: const TextStyle(color: AppTheme.errorRed),
        ),
      ),
    );
  }
}

class _TodayOrdersList extends StatelessWidget {
  final List<OrderModel> orders;

  const _TodayOrdersList({required this.orders});

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return const Center(
        child: Text(
          'No orders today',
          style: TextStyle(color: AppTheme.textSecondary),
        ),
      );
    }

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return _OrderCard(order: order);
      },
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
      margin: const EdgeInsets.only(bottom: 12),
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
                          order.formattedOrderNumber ?? 'Order #${order.id}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Dine In', // TODO: Get order type from order model
                          style: TextStyle(
                            fontSize: 12,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
              Row(
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
                  const SizedBox(width: 8),
                  const StatusBadge(
                    label: 'POS',
                    color: AppTheme.kotStatus,
                  ),
                ],
              ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order Date: $formattedDate',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  Text(
                    '${order.items.length} Item(s)',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${order.total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
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
                        order.status.toUpperCase() ?? 'UNKNOWN',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
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
                      order.waiter?.name ?? '',
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

