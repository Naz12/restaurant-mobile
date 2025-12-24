import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/kot_repository.dart';
import '../../data/models/kot_model.dart';

final kotListProvider = FutureProvider.family<List<KotModel>, Map<String, dynamic>>((ref, filters) async {
  final repository = ref.read(kotRepositoryProvider);
  return await repository.getKots(
    kitchenPlaceId: filters['kitchen_place_id'] as int?,
    status: filters['status'] as String?,
    filterOrders: filters['filter_orders'] as String?,
    startDate: filters['start_date'] as DateTime?,
    endDate: filters['end_date'] as DateTime?,
  );
});

final kotProvider = FutureProvider.family<KotModel?, int>((ref, kotId) async {
  final repository = ref.read(kotRepositoryProvider);
  try {
    return await repository.getKot(kotId);
  } catch (e) {
    return null;
  }
});

final orderKotsProvider = FutureProvider.family<List<KotModel>, int>((ref, orderId) async {
  final repository = ref.read(kotRepositoryProvider);
  return await repository.getKotsForOrder(orderId);
});

final updateKotStatusProvider = StateNotifierProvider<UpdateKotStatusNotifier, bool>((ref) {
  return UpdateKotStatusNotifier(ref);
});

class UpdateKotStatusNotifier extends StateNotifier<bool> {
  final Ref ref;
  final KotRepository repository;

  UpdateKotStatusNotifier(this.ref)
      : repository = ref.read(kotRepositoryProvider),
        super(false);

  Future<bool> confirmKot(int kotId) async {
    state = true;
    try {
      await repository.confirmKot(kotId);
      return true;
    } catch (e) {
      return false;
    } finally {
      state = false;
    }
  }

  Future<bool> markReady(int kotId) async {
    state = true;
    try {
      await repository.markKotReady(kotId);
      return true;
    } catch (e) {
      return false;
    } finally {
      state = false;
    }
  }

  Future<bool> updateItemStatus({
    required int kotId,
    required int itemId,
    required String status,
  }) async {
    state = true;
    try {
      await repository.updateKotItemStatus(
        kotId: kotId,
        itemId: itemId,
        status: status,
      );
      return true;
    } catch (e) {
      return false;
    } finally {
      state = false;
    }
  }

  Future<bool> updateItemQuantity({
    required int kotId,
    required int itemId,
    required int quantity,
  }) async {
    state = true;
    try {
      await repository.updateKotItemQuantity(
        kotId: kotId,
        itemId: itemId,
        quantity: quantity,
      );
      return true;
    } catch (e) {
      return false;
    } finally {
      state = false;
    }
  }
}
