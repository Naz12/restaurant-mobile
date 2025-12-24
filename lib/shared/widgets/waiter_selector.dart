import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/waiters/presentation/providers/waiter_provider.dart';
import '../../features/waiters/data/models/waiter_model.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';

class WaiterSelector extends ConsumerWidget {
  final WaiterModel? selectedWaiter;
  final Function(WaiterModel?) onWaiterSelected;

  const WaiterSelector({
    super.key,
    this.selectedWaiter,
    required this.onWaiterSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(authStateProvider).user;
    final waitersAsync = ref.watch(waitersProvider);

    return waitersAsync.when(
      data: (waiters) {
        // If no waiters from API, use current user as default
        final availableWaiters = waiters.isNotEmpty 
            ? waiters 
            : (currentUser != null 
                ? [WaiterModel(id: currentUser.id, name: currentUser.name, email: currentUser.email)]
                : []);

        return DropdownButtonFormField<WaiterModel>(
          value: selectedWaiter ?? (currentUser != null 
              ? WaiterModel(id: currentUser.id, name: currentUser.name, email: currentUser.email)
              : null),
          decoration: const InputDecoration(
            labelText: 'Waiter',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: availableWaiters.map((waiter) {
            return DropdownMenuItem<WaiterModel>(
              value: waiter,
              child: Text(waiter.name),
            );
          }).toList(),
          onChanged: (waiter) {
            onWaiterSelected(waiter);
          },
        );
      },
      loading: () => const SizedBox(
        height: 56,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => DropdownButtonFormField<WaiterModel>(
        value: currentUser != null 
            ? WaiterModel(id: currentUser.id, name: currentUser.name, email: currentUser.email)
            : null,
        decoration: const InputDecoration(
          labelText: 'Waiter',
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        items: currentUser != null
            ? [
                DropdownMenuItem<WaiterModel>(
                  value: WaiterModel(
                    id: currentUser.id,
                    name: currentUser.name,
                    email: currentUser.email,
                  ),
                  child: Text(currentUser.name),
                ),
              ]
            : [],
        onChanged: (waiter) {
          onWaiterSelected(waiter);
        },
      ),
    );
  }
}

