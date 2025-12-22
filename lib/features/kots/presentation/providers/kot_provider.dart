import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/kot_model.dart';
import '../../data/repositories/kot_repository.dart';

final kotListProvider = FutureProvider.family<List<KotModel>, Map<String, dynamic>>((ref, filters) async {
  final repository = ref.read(kotRepositoryProvider);
  return await repository.getKots(
    kitchenPlaceId: filters['kitchen_place_id'] as int?,
    status: filters['status'] as String?,
    filterOrders: filters['filter_orders'] as String?,
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

final updateKotStatusProvider = StateNotifierProvider<UpdateKotStatusNotifier, UpdateKotStatusState>((ref) {
  return UpdateKotStatusNotifier(ref);
});

class UpdateKotStatusState {
  final bool isLoading;
  final String? error;

  UpdateKotStatusState({
    this.isLoading = false,
    this.error,
  });

  UpdateKotStatusState copyWith({
    bool? isLoading,
    String? error,
  }) {
    return UpdateKotStatusState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class UpdateKotStatusNotifier extends StateNotifier<UpdateKotStatusState> {
  final Ref ref;
  final KotRepository repository;

  UpdateKotStatusNotifier(this.ref)
      : repository = ref.read(kotRepositoryProvider),
        super(UpdateKotStatusState());

  Future<bool> confirmKot(int kotId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await repository.confirmKot(kotId);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<bool> markReady(int kotId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await repository.markKotReady(kotId);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<bool> updateItemStatus({
    required int kotId,
    required int itemId,
    required String status,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await repository.updateKotItemStatus(
        kotId: kotId,
        itemId: itemId,
        status: status,
      );
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }
}

