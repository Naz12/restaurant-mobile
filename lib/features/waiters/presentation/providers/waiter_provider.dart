import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/waiter_repository.dart';
import '../../data/models/waiter_model.dart';

final waitersProvider = FutureProvider<List<WaiterModel>>((ref) async {
  final repository = ref.read(waiterRepositoryProvider);
  return await repository.getWaiters();
});

