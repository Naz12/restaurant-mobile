import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/navigation/navigation_config.dart';
import '../../../../core/navigation/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/app_scaffold.dart';
import '../../../../shared/widgets/responsive_layout.dart';
import '../../../../shared/widgets/status_badge.dart';
import '../providers/kot_provider.dart';
import '../../data/models/kot_model.dart';
import 'kot_detail_screen.dart';
import 'package:intl/intl.dart';

class KotListScreen extends ConsumerStatefulWidget {
  const KotListScreen({super.key});

  @override
  ConsumerState<KotListScreen> createState() => _KotListScreenState();
}

class _KotListScreenState extends ConsumerState<KotListScreen> {
  String? _selectedStatus;
  int? _selectedKitchenPlaceId;

  @override
  Widget build(BuildContext context) {
    final filters = {
      'status': _selectedStatus,
      'kitchen_place_id': _selectedKitchenPlaceId,
    };
    final currentRoute = AppRouter.getRouteFromPath(GoRouterState.of(context).uri.path);

    final kotsAsync = ref.watch(kotListProvider(filters));
    final gridColumns = ResponsiveLayout.getGridColumns(context, mobile: 2, tablet: 3, desktop: 4);

    // Count KOTs by status
    final pendingCount = ref.watch(kotListProvider({'status': 'pending'}));
    final inKitchenCount = ref.watch(kotListProvider({'status': 'in_kitchen'}));
    final readyCount = ref.watch(kotListProvider({'status': 'ready'}));
    final cancelledCount = ref.watch(kotListProvider({'status': 'cancelled'}));

    return AppScaffold(
      currentRoute: currentRoute,
      child: Container(
        color: AppTheme.darkerBackground,
        padding: ResponsiveLayout.getPadding(context),
        child: Column(
        children: [
            // Header
            const Text(
              'Default Kitchen KOT',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            // Status Tabs
            Row(
              children: [
                Expanded(
                  child: _StatusTab(
                    label: 'Pending',
                    count: pendingCount.value?.length ?? 0,
                    isSelected: _selectedStatus == 'pending' || _selectedStatus == null,
                    onTap: () {
                      setState(() {
                        _selectedStatus = _selectedStatus == 'pending' ? null : 'pending';
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _StatusTab(
                    label: 'In Kitchen',
                    count: inKitchenCount.value?.length ?? 0,
                    isSelected: _selectedStatus == 'in_kitchen',
                    onTap: () {
                      setState(() {
                        _selectedStatus = _selectedStatus == 'in_kitchen' ? null : 'in_kitchen';
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _StatusTab(
                    label: 'Food is Ready',
                    count: readyCount.value?.length ?? 0,
                    isSelected: _selectedStatus == 'ready',
                    onTap: () {
                      setState(() {
                        _selectedStatus = _selectedStatus == 'ready' ? null : 'ready';
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _StatusTab(
                    label: 'Cancelled',
                    count: cancelledCount.value?.length ?? 0,
                    isSelected: _selectedStatus == 'cancelled',
                    onTap: () {
                      setState(() {
                        _selectedStatus = _selectedStatus == 'cancelled' ? null : 'cancelled';
                      });
                  },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // KOTs grid
          Expanded(
            child: kotsAsync.when(
              data: (kots) {
                if (kots.isEmpty) {
                  return const Center(
                      child: Text(
                        'No KOTs found',
                        style: TextStyle(color: AppTheme.textSecondary),
                      ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(kotListProvider(filters));
                  },
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: gridColumns,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.75,
                      ),
                    itemCount: kots.length,
                    itemBuilder: (context, index) {
                      final kot = kots[index];
                      return _KotCard(kot: kot);
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
                        ref.invalidate(kotListProvider(filters));
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

class _StatusTab extends StatelessWidget {
  final String label;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  const _StatusTab({
    required this.label,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected 
              ? AppTheme.primaryPurple.withOpacity(0.2) 
              : AppTheme.darkBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppTheme.primaryPurple : Colors.transparent,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            '$label ($count)',
            style: TextStyle(
              color: isSelected ? AppTheme.primaryPurple : AppTheme.textPrimary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class _KotCard extends ConsumerWidget {
  final KotModel kot;

  const _KotCard({required this.kot});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateNotifier = ref.read(updateKotStatusProvider.notifier);
    final dateFormat = DateFormat('MMM dd, hh:mm a');
    final formattedDate = kot.createdAt != null
        ? dateFormat.format(kot.createdAt!)
        : 'N/A';

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => KotDetailScreen(kotId: kot.id),
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
                  Text(
                    'KOT #${kot.kotNumber}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  Text(
                    'Order #${kot.order.formattedOrderNumber}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const StatusBadge(
                    label: 'Dine In',
                    color: AppTheme.infoBlue,
                    ),
                  const SizedBox(width: 8),
                  Text(
                    '${kot.items?.length ?? 0} Item(s)',
                      style: const TextStyle(
                        fontSize: 12,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                formattedDate,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 12),
              // Status badge
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: kot.status == 'pending' || kot.status == 'pending_confirmation'
                      ? AppTheme.pendingStatus.withOpacity(0.2)
                      : AppTheme.getStatusColor(kot.status).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: kot.status == 'pending' || kot.status == 'pending_confirmation'
                        ? AppTheme.pendingStatus
                        : AppTheme.getStatusColor(kot.status),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    kot.status == 'pending_confirmation' 
                        ? 'PENDING CONFIRMATION'
                        : kot.status.toUpperCase().replaceAll('_', ' '),
                    style: TextStyle(
                      color: kot.status == 'pending' || kot.status == 'pending_confirmation'
                          ? AppTheme.pendingStatus
                          : AppTheme.getStatusColor(kot.status),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              if (kot.waiter != null) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.restaurant,
                      size: 14,
                      color: AppTheme.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      kot.waiter!.name,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
              if (kot.items != null && kot.items!.isNotEmpty) ...[
                const SizedBox(height: 12),
                const Text(
                  'ITEM NAME',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                ...kot.items!.take(3).map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        Text(
                          '${item.quantity} x ${item.menuItem.name}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        const Spacer(),
                        StatusBadge(
                          label: item.status.toUpperCase(),
                          color: AppTheme.getStatusColor(item.status),
                          fontSize: 10,
                        ),
                      ],
                    ),
                  );
                }),
              ],
              const Spacer(),
              // Action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (kot.status == 'pending' || kot.status == 'pending_confirmation')
                    Expanded(
                      child: ElevatedButton.icon(
                      onPressed: () async {
                        final success = await updateNotifier.confirmKot(kot.id);
                        if (success && context.mounted) {
                          ref.invalidate(kotListProvider({}));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('KOT confirmed'),
                                backgroundColor: AppTheme.successGreen,
                            ),
                          );
                        }
                      },
                        icon: const Icon(Icons.restaurant_menu, size: 16),
                        label: const Text('Start Cooking'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryPurple,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ),
                  if (kot.status == 'in_kitchen')
                    Expanded(
                      child: ElevatedButton.icon(
                      onPressed: () async {
                        final success = await updateNotifier.markReady(kot.id);
                        if (success && context.mounted) {
                          ref.invalidate(kotListProvider({}));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('KOT marked as ready'),
                                backgroundColor: AppTheme.successGreen,
                            ),
                          );
                        }
                      },
                        icon: const Icon(Icons.check, size: 16),
                        label: const Text('Mark Ready'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.successGreen,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      // TODO: Implement cancel with reason
                    },
                    icon: const Icon(Icons.delete_outline),
                    color: AppTheme.errorRed,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
