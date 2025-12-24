import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/kot_model.dart';
import '../providers/kot_provider.dart';
import '../providers/cancel_reason_provider.dart';
import '../../data/repositories/kot_repository.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/status_badge.dart';
import '../../../../shared/widgets/cancel_reason_modal.dart';

class KotDetailScreen extends ConsumerWidget {
  final int kotId;

  const KotDetailScreen({
    super.key,
    required this.kotId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kotAsync = ref.watch(kotProvider(kotId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('KOT Details'),
      ),
      body: kotAsync.when(
        data: (kot) {
          if (kot == null) {
            return const Center(child: Text('KOT not found'));
          }
          return _KotDetailView(kot: kot);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

class _KotDetailView extends ConsumerWidget {
  final KotModel kot;

  const _KotDetailView({required this.kot});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateNotifier = ref.read(updateKotStatusProvider.notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'KOT #${kot.kotNumber}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  StatusBadge(
                    label: kot.status == 'pending_confirmation' 
                        ? 'PENDING CONFIRMATION'
                        : kot.status == 'in_kitchen'
                            ? 'IN KITCHEN'
                            : kot.status == 'food_ready'
                                ? 'FOOD READY'
                                : kot.status.toUpperCase().replaceAll('_', ' '),
                    color: kot.status == 'pending' || kot.status == 'pending_confirmation'
                        ? AppTheme.pendingStatus
                        : AppTheme.getStatusColor(kot.status),
                  ),
                  const SizedBox(height: 8),
                  Text('Order: ${kot.order.formattedOrderNumber}'),
                  if (kot.table != null)
                    Text('Table: ${kot.table!.tableCode}'),
                  if (kot.waiter != null)
                    Text('Waiter: ${kot.waiter!.name}'),
                ],
              ),
            ),
          ),
          if (kot.items != null && kot.items!.isNotEmpty) ...[
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Items',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...kot.items!.map((item) {
                      return _KotItemCard(
                        item: item,
                                    kotId: kot.id,
                        updateNotifier: updateNotifier,
                        onStatusUpdated: () {
                          ref.invalidate(kotProvider(kot.id));
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 16),
          // KOT-level status actions (matching web flow: pending_confirmation → in_kitchen → food_ready)
          if (kot.status == 'pending' || kot.status == 'pending_confirmation')
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final success = await updateNotifier.confirmKot(kot.id);
                  if (success && context.mounted) {
                    ref.invalidate(kotProvider(kot.id));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('KOT confirmed - Cooking started'),
                        backgroundColor: AppTheme.successGreen,
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.restaurant_menu, size: 20),
                label: const Text('Start Cooking'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryPurple,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          if (kot.status == 'in_kitchen')
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final success = await updateNotifier.markReady(kot.id);
                  if (success && context.mounted) {
                    ref.invalidate(kotProvider(kot.id));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('KOT marked as ready'),
                        backgroundColor: AppTheme.successGreen,
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.check_circle, size: 20),
                label: const Text('Mark as Ready'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.successGreen,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          // Cancel KOT button (for non-cancelled KOTs)
          if (kot.status != 'cancelled' && kot.status != 'canceled')
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () async {
                  final reasonsAsync = ref.read(kotCancelReasonsProvider);
                  final reasons = await reasonsAsync.when(
                    data: (data) => Future.value(data),
                    loading: () => ref.read(kotRepositoryProvider).getCancelReasons(),
                    error: (_, __) => ref.read(kotRepositoryProvider).getCancelReasons(),
                  );
                  
                  if (context.mounted) {
                    showDialog(
                      context: context,
                      builder: (context) => CancelReasonModal(
                        title: 'Cancel KOT',
                        loadReasons: () async => reasons,
                        onConfirm: (reasonId, note) async {
                          final repository = ref.read(kotRepositoryProvider);
                          await repository.cancelKot(
                            kotId: kot.id,
                            cancelReasonId: reasonId,
                            cancelNote: note,
                          );
                          if (context.mounted) {
                            ref.invalidate(kotProvider(kot.id));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('KOT cancelled successfully'),
                                backgroundColor: AppTheme.successGreen,
                              ),
                            );
                          }
                        },
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.cancel, size: 20),
                label: const Text('Cancel KOT'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.errorRed,
                  side: const BorderSide(color: AppTheme.errorRed),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _KotItemCard extends ConsumerStatefulWidget {
  final KotItemModel item;
  final int kotId;
  final dynamic updateNotifier;
  final VoidCallback onStatusUpdated;

  const _KotItemCard({
    required this.item,
    required this.kotId,
    required this.updateNotifier,
    required this.onStatusUpdated,
  });

  @override
  ConsumerState<_KotItemCard> createState() => _KotItemCardState();
}

class _KotItemCardState extends ConsumerState<_KotItemCard> {
  late TextEditingController _quantityController;

  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController(text: '${widget.item.quantity}');
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(_KotItemCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.item.quantity != widget.item.quantity) {
      _quantityController.text = '${widget.item.quantity}';
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return AppTheme.pendingStatus;
      case 'cooking':
        return AppTheme.infoBlue;
      case 'ready':
        return AppTheme.successGreen;
      case 'cancelled':
      case 'canceled':
        return AppTheme.errorRed;
      default:
        return AppTheme.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final kotId = widget.kotId;
    final updateNotifier = widget.updateNotifier;
    final onStatusUpdated = widget.onStatusUpdated;
    
    return Consumer(
      builder: (context, ref, child) {
        return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
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
                        item.menuItem.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (item.variation != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          'Size: ${item.variation!.name}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Text(
                            'Quantity: ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline, size: 18),
                            color: AppTheme.textSecondary,
                            onPressed: item.status != 'cancelled' && item.status != 'canceled'
                                ? () async {
                                    if (item.quantity > 1) {
                                      final success = await updateNotifier.updateItemQuantity(
                                        kotId: kotId,
                                        itemId: item.id,
                                        quantity: item.quantity - 1,
                                      );
                                      if (success && context.mounted) {
                                        onStatusUpdated();
                                      }
                                    }
                                  }
                                : null,
                          ),
                          SizedBox(
                            width: 50,
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14),
                              controller: _quantityController,
                              keyboardType: TextInputType.number,
                              enabled: item.status != 'cancelled' && item.status != 'canceled',
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                isDense: true,
                              ),
                              onSubmitted: (value) async {
                                final newQuantity = int.tryParse(value) ?? item.quantity;
                                if (newQuantity > 0 && newQuantity != item.quantity) {
                                  final success = await updateNotifier.updateItemQuantity(
                                    kotId: kotId,
                                    itemId: item.id,
                                    quantity: newQuantity,
                                  );
                                  if (success && context.mounted) {
                                    onStatusUpdated();
                                  } else if (context.mounted) {
                                    setState(() {
                                      _quantityController.text = '${item.quantity}';
                                    });
                                  }
                                } else {
                                  setState(() {
                                    _quantityController.text = '${item.quantity}';
                                  });
                                }
                              },
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline, size: 18),
                            color: AppTheme.textSecondary,
                            onPressed: item.status != 'cancelled' && item.status != 'canceled'
                                ? () async {
                                    final success = await updateNotifier.updateItemQuantity(
                                      kotId: kotId,
                                      itemId: item.id,
                                      quantity: item.quantity + 1,
                                    );
                                    if (success && context.mounted) {
                                      onStatusUpdated();
                                    }
                                  }
                                : null,
                          ),
                        ],
                      ),
                      if (item.note != null && item.note!.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.yellow.shade50,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.yellow.shade200),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.note,
                                size: 16,
                                color: Colors.orange,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  item.note!,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (item.modifiers.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Wrap(
                          spacing: 4,
                          children: item.modifiers.map((modifier) {
                            return Chip(
                              label: Text(
                                modifier.name,
                                style: const TextStyle(fontSize: 10),
                              ),
                              padding: EdgeInsets.zero,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                ),
                StatusBadge(
                  label: item.status == 'pending' 
                      ? 'PENDING'
                      : item.status == 'cooking'
                          ? 'COOKING'
                          : item.status.toUpperCase(),
                  color: _getStatusColor(item.status),
                  fontSize: 12,
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Item-level status action buttons (matching web flow: pending → cooking → ready)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Show "Start Cooking" button when item is pending
                if (item.status == 'pending')
                  ElevatedButton.icon(
                    onPressed: () async {
                      final success = await updateNotifier.updateItemStatus(
                        kotId: kotId,
                        itemId: item.id,
                        status: 'cooking',
                      );
                      if (success && context.mounted) {
                        onStatusUpdated();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item marked as cooking'),
                            backgroundColor: AppTheme.infoBlue,
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.restaurant_menu, size: 18),
                    label: const Text('Start Cooking'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.infoBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                // Show "Mark Ready" button when item is pending or cooking
                if (item.status == 'pending' || item.status == 'cooking') ...[
                  if (item.status == 'pending') const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final success = await updateNotifier.updateItemStatus(
                        kotId: kotId,
                        itemId: item.id,
                        status: 'ready',
                      );
                      if (success && context.mounted) {
                        onStatusUpdated();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item marked as ready'),
                            backgroundColor: AppTheme.successGreen,
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.check_circle, size: 18),
                    label: const Text('Mark Ready'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.successGreen,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                ],
                // Cancel item button (for non-cancelled items)
                if (item.status != 'cancelled' && item.status != 'canceled') ...[
                  if (item.status == 'pending' || item.status == 'cooking') const SizedBox(width: 8),
                  OutlinedButton.icon(
                    onPressed: () async {
                      final reasonsAsync = ref.read(kotCancelReasonsProvider);
                      final reasons = await reasonsAsync.when(
                        data: (data) => Future.value(data),
                        loading: () => ref.read(kotRepositoryProvider).getCancelReasons(),
                        error: (_, __) => ref.read(kotRepositoryProvider).getCancelReasons(),
                      );
                      
                      if (context.mounted) {
                        showDialog(
                          context: context,
                          builder: (context) => CancelReasonModal(
                            title: 'Cancel Item',
                            loadReasons: () async => reasons,
                            onConfirm: (reasonId, note) async {
                              final repository = ref.read(kotRepositoryProvider);
                              await repository.cancelKotItem(
                                kotId: kotId,
                                itemId: item.id,
                                cancelReasonId: reasonId,
                                cancelNote: note,
                              );
                              if (context.mounted) {
                                onStatusUpdated();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Item cancelled successfully'),
                                    backgroundColor: AppTheme.successGreen,
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.cancel, size: 18),
                    label: const Text('Cancel'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.errorRed,
                      side: const BorderSide(color: AppTheme.errorRed),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
      },
    );
  }
}
