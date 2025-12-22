import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/sync_status_indicator.dart';
import '../../../../features/auth/presentation/providers/auth_provider.dart';
import '../providers/kot_provider.dart';
import '../../data/models/kot_model.dart';
import 'kot_detail_screen.dart';

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

    final kotsAsync = ref.watch(kotListProvider(filters));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kitchen Orders'),
        actions: const [
          SyncStatusIndicator(),
        ],
      ),
      body: Column(
        children: [
          // Filters
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
                      'pending',
                      'in_kitchen',
                      'ready',
                      'cancelled',
                    ].map((status) {
                      return DropdownMenuItem(
                        value: status,
                        child: Text(status.toUpperCase().replaceAll('_', ' ')),
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
                    ref.invalidate(kotListProvider(filters));
                  },
                ),
              ],
            ),
          ),
          // KOTs list
          Expanded(
            child: kotsAsync.when(
              data: (kots) {
                if (kots.isEmpty) {
                  return const Center(
                    child: Text('No KOTs found'),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(kotListProvider(filters));
                  },
                  child: ListView.builder(
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
                    Text('Error: $error'),
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
    );
  }
}

class _KotCard extends ConsumerWidget {
  final KotModel kot;

  const _KotCard({required this.kot});

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.orange;
      case 'in_kitchen':
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
    final updateNotifier = ref.read(updateKotStatusProvider.notifier);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(kot.status),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      kot.status.toUpperCase().replaceAll('_', ' '),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (kot.order != null)
                Text('Order: ${kot.order!.formattedOrderNumber}'),
              if (kot.table != null)
                Text('Table: ${kot.table!.tableCode}'),
              if (kot.waiter != null)
                Text('Waiter: ${kot.waiter!.name}'),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (kot.status == 'pending')
                    ElevatedButton(
                      onPressed: () async {
                        final success = await updateNotifier.confirmKot(kot.id);
                        if (success && context.mounted) {
                          ref.invalidate(kotListProvider({}));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('KOT confirmed'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                      child: const Text('Confirm'),
                    ),
                  if (kot.status == 'in_kitchen')
                    ElevatedButton(
                      onPressed: () async {
                        final success = await updateNotifier.markReady(kot.id);
                        if (success && context.mounted) {
                          ref.invalidate(kotListProvider({}));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('KOT marked as ready'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('Mark Ready'),
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
