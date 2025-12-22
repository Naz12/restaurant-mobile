import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/order_model.dart';
import '../providers/order_provider.dart';

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

class _OrderDetailView extends StatelessWidget {
  final OrderModel order;

  const _OrderDetailView({required this.order});

  @override
  Widget build(BuildContext context) {
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
          _InfoCard(
            title: 'Items',
            children: order.items.map((item) {
              return ListTile(
                title: Text(item.menuItem.name),
                subtitle: Text('Qty: ${item.quantity}'),
                trailing: Text('\$${item.amount.toStringAsFixed(2)}'),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          _InfoCard(
            title: 'Summary',
            children: [
              _InfoRow(label: 'Subtotal', value: '\$${order.subTotal.toStringAsFixed(2)}'),
              _InfoRow(label: 'Discount', value: '\$${order.discountAmount.toStringAsFixed(2)}'),
              _InfoRow(label: 'Tax', value: '\$${order.totalTaxAmount.toStringAsFixed(2)}'),
              _InfoRow(label: 'Tip', value: '\$${order.tipAmount.toStringAsFixed(2)}'),
              const Divider(),
              _InfoRow(
                label: 'Total',
                value: '\$${order.total.toStringAsFixed(2)}',
                isTotal: true,
              ),
            ],
          ),
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

