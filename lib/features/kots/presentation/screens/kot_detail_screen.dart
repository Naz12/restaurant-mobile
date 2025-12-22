import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/kot_model.dart';
import '../providers/kot_provider.dart';

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
                  Text('Status: ${kot.status.toUpperCase()}'),
                  if (kot.order != null)
                    Text('Order: ${kot.order!.formattedOrderNumber}'),
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
          if (kot.status == 'pending')
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final success = await updateNotifier.confirmKot(kot.id);
                  if (success && context.mounted) {
                    ref.invalidate(kotProvider(kot.id));
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Confirm KOT'),
              ),
            ),
          if (kot.status == 'in_kitchen')
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final success = await updateNotifier.markReady(kot.id);
                  if (success && context.mounted) {
                    ref.invalidate(kotProvider(kot.id));
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text('Mark as Ready'),
              ),
            ),
        ],
      ),
    );
  }
}

class _KotItemCard extends ConsumerWidget {
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

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.orange;
      case 'preparing':
        return Colors.blue;
      case 'ready':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      Text(
                        'Quantity: ${item.quantity}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
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
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(item.status),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    item.status.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Status action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (item.status == 'pending' || item.status == 'preparing')
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
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.check, size: 18),
                    label: const Text('Mark Ready'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                if (item.status == 'pending')
                  const SizedBox(width: 8),
                if (item.status == 'pending')
                  ElevatedButton.icon(
                    onPressed: () async {
                      final success = await updateNotifier.updateItemStatus(
                        kotId: kotId,
                        itemId: item.id,
                        status: 'preparing',
                      );
                      if (success && context.mounted) {
                        onStatusUpdated();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item marked as preparing'),
                            backgroundColor: Colors.blue,
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.play_arrow, size: 18),
                    label: const Text('Start Preparing'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
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
