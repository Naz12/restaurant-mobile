import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../data/models/order_model.dart';
import '../providers/order_provider.dart';
import '../../data/repositories/order_repository.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../kots/presentation/providers/kot_provider.dart';
import '../../../kots/presentation/screens/kot_detail_screen.dart';
import '../../../payments/presentation/providers/payment_provider.dart';
import '../../../payments/presentation/screens/payment_screen.dart';
import '../../../../shared/widgets/status_badge.dart';

class OrderDetailScreen extends ConsumerWidget {
  final int orderId;

  const OrderDetailScreen({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsync = ref.watch(orderProvider(orderId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: orderAsync.when(
        data: (order) {
          if (order == null) {
            return const Center(child: Text('Order not found'));
          }
          return _OrderDetailView(order: order);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

class _OrderDetailView extends ConsumerWidget {
  final OrderModel order;

  const _OrderDetailView({required this.order});

  void _showCancelDialog(BuildContext context, WidgetRef ref) {
    final TextEditingController reasonController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Order'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Please provide a reason for cancellation:'),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                hintText: 'Enter cancellation reason...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (reasonController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please provide a cancellation reason')),
                );
                return;
              }
              
              try {
                final repository = ref.read(orderRepositoryProvider);
                await repository.cancelOrder(
                  orderId: order.id,
                  cancelReasonId: 0, // Not used for orders, API uses cancel_reason text
                  cancelNote: reasonController.text,
                );
                
                if (context.mounted) {
                  Navigator.of(context).pop();
                  ref.invalidate(orderProvider(order.id));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Order cancelled successfully'),
                      backgroundColor: AppTheme.successGreen,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to cancel order: $e')),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.errorRed,
            ),
            child: const Text('Confirm Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canCancel = order.status != 'cancelled' && 
                      order.status != 'canceled' &&
                      order.status != 'delivered' &&
                      order.status != 'paid';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoCard(
            title: 'Order Information',
            children: [
              _InfoRow(label: 'Order Number', value: order.formattedOrderNumber),
              _InfoRow(label: 'Status', value: order.status.toUpperCase()),
              if (order.table != null)
                _InfoRow(label: 'Table', value: order.table!.tableCode),
              if (order.waiter != null)
                _InfoRow(label: 'Waiter', value: order.waiter!.name),
              _InfoRow(label: 'Pax', value: order.numberOfPax.toString()),
            ],
          ),
          const SizedBox(height: 16),
          // KOTs Section
          ref.watch(orderKotsProvider(order.id)).when(
            data: (kots) {
              if (kots.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _InfoCard(
                      title: 'KOTs (${kots.length})',
                      children: kots.map((kot) {
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            title: Text('KOT #${kot.kotNumber}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Status: ${kot.status.toUpperCase()}'),
                                if (kot.itemsCount != null)
                                  Text('Items: ${kot.itemsCount}'),
                              ],
                            ),
                            trailing: StatusBadge(
                              label: kot.status.toUpperCase(),
                              color: AppTheme.getStatusColor(kot.status),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => KotDetailScreen(kotId: kot.id),
                                ),
                              );
                            },
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
          _InfoCard(
            title: 'Items',
            children: order.items.map((item) {
              return ListTile(
                title: Text(item.menuItem.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Qty: ${item.quantity}'),
                    if (item.variation != null)
                      Text('Variation: ${item.variation!.name}'),
                    if (item.modifiers.isNotEmpty)
                      Text('Modifiers: ${item.modifiers.map((m) => m.name).join(', ')}'),
                    if (item.note != null && item.note!.isNotEmpty)
                      Text('Note: ${item.note}'),
                  ],
                ),
                trailing: Text('\$${item.amount.toStringAsFixed(2)}'),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          // Payment History Section
          ref.watch(orderPaymentsProvider(order.id)).when(
            data: (payments) {
              if (payments.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _InfoCard(
                      title: 'Payment History',
                      children: payments.map((payment) {
                        final dateFormat = DateFormat('MMM dd, yyyy hh:mm a');
                        return ListTile(
                          title: Text(payment.paymentMethod.toUpperCase()),
                          subtitle: Text(dateFormat.format(payment.createdAt)),
                          trailing: Text(
                            '\$${payment.amount.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
          _InfoCard(
            title: 'Summary',
            children: [
              _InfoRow(label: 'Subtotal', value: '\$${order.subTotal.toStringAsFixed(2)}'),
              _InfoRow(label: 'Discount', value: '\$${order.discountAmount.toStringAsFixed(2)}'),
              _InfoRow(label: 'Tax', value: '\$${order.totalTaxAmount.toStringAsFixed(2)}'),
              _InfoRow(label: 'Tip', value: '\$${order.tipAmount.toStringAsFixed(2)}'),
              if (order.deliveryFee > 0)
                _InfoRow(label: 'Delivery Fee', value: '\$${order.deliveryFee.toStringAsFixed(2)}'),
              const Divider(),
              _InfoRow(
                label: 'Total',
                value: '\$${order.total.toStringAsFixed(2)}',
                isTotal: true,
              ),
            ],
          ),
          if (order.orderNote != null && order.orderNote!.isNotEmpty) ...[
            const SizedBox(height: 16),
            _InfoCard(
              title: 'Order Notes',
              children: [
                Text(
                  order.orderNote!,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
          const SizedBox(height: 16),
          // Add Payment Button
          if (order.status != 'paid' && order.status != 'cancelled' && order.status != 'canceled')
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final result = await Navigator.of(context).push<bool>(
                    MaterialPageRoute(
                      builder: (_) => PaymentScreen(
                        orderId: order.id,
                        orderTotal: order.total,
                      ),
                    ),
                  );
                  if (result == true && context.mounted) {
                    ref.invalidate(orderProvider(order.id));
                    ref.invalidate(orderPaymentsProvider(order.id));
                  }
                },
                icon: const Icon(Icons.payment, size: 20),
                label: const Text('Add Payment'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryPurple,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          if (canCancel) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => _showCancelDialog(context, ref),
                icon: const Icon(Icons.cancel, size: 20),
                label: const Text('Cancel Order'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.errorRed,
                  side: const BorderSide(color: AppTheme.errorRed),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _InfoCard({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const _InfoRow({
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 18 : 14,
            ),
          ),
        ],
      ),
    );
  }
}

