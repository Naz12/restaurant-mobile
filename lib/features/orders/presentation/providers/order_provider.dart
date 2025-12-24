import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/order_model.dart';
import '../../data/repositories/order_repository.dart';

final orderListProvider = FutureProvider.family<List<OrderModel>, Map<String, dynamic>>((ref, filters) async {
  final repository = ref.read(orderRepositoryProvider);
  return await repository.getOrders(
    status: filters['status'] as String?,
    orderType: filters['order_type'] as String?,
    tableId: filters['table_id'] as int?,
    waiterId: filters['waiter_id'] as int?,
    startDate: filters['start_date'] as DateTime?,
    endDate: filters['end_date'] as DateTime?,
  );
});

final orderProvider = FutureProvider.family<OrderModel?, int>((ref, orderId) async {
  // TODO: Implement get single order
  return null;
});

final createOrderProvider = StateNotifierProvider<CreateOrderNotifier, CreateOrderState>((ref) {
  return CreateOrderNotifier(ref);
});

class CreateOrderState {
  final bool isLoading;
  final String? error;
  final OrderModel? order;

  CreateOrderState({
    this.isLoading = false,
    this.error,
    this.order,
  });

  CreateOrderState copyWith({
    bool? isLoading,
    String? error,
    OrderModel? order,
  }) {
    return CreateOrderState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      order: order ?? this.order,
    );
  }
}

class CreateOrderNotifier extends StateNotifier<CreateOrderState> {
  final Ref ref;
  late final OrderRepository repository;

  CreateOrderNotifier(this.ref)
      : super(CreateOrderState()) {
    repository = ref.read(orderRepositoryProvider);
  }

  Future<OrderModel?> createOrder({
    int? tableId,
    required int orderTypeId,
    required int numberOfPax,
    required List<Map<String, dynamic>> items,
    String? orderNote,
    String? action,
    String? discountType,
    double? discountValue,
    double? tipAmount,
    double? deliveryFee,
    double? serviceCharge,
    double? packagingFee,
    int? customerId,
    int? waiterId,
    int? deliveryExecutiveId,
    DateTime? pickupTime,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final order = await repository.createOrder(
        tableId: tableId,
        orderTypeId: orderTypeId,
        numberOfPax: numberOfPax,
        items: items,
        orderNote: orderNote,
        action: action,
        discountType: discountType,
        discountValue: discountValue,
        tipAmount: tipAmount,
        deliveryFee: deliveryFee,
        serviceCharge: serviceCharge,
        packagingFee: packagingFee,
        customerId: customerId,
        waiterId: waiterId,
        deliveryExecutiveId: deliveryExecutiveId,
        pickupTime: pickupTime,
      );

      state = state.copyWith(isLoading: false, order: order);
      return order;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return null;
    }
  }
}

