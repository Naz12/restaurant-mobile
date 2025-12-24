import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/database/database.dart';
import '../../../../core/providers/providers.dart';
import '../models/order_model.dart';
import '../../../../shared/services/connectivity_service.dart';
import 'package:intl/intl.dart';

class OrderRepository {
  final Ref ref;
  final ApiClient apiClient;
  final AppDatabase database;
  final ConnectivityService connectivityService;

  OrderRepository({
    required this.ref,
    required this.apiClient,
    required this.database,
    required this.connectivityService,
  });

  Future<List<OrderModel>> getOrders({
    String? status,
    int? tableId,
    int? waiterId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      // Default to today if no date range specified
      final today = DateTime.now();
      final defaultStartDate = startDate ?? DateTime(today.year, today.month, today.day);
      final defaultEndDate = endDate ?? defaultStartDate.add(const Duration(days: 1));

      // Fetch from API
      final response = await apiClient.dio.get(
        '/orders',
        queryParameters: {
          if (status != null) 'status': status,
          if (tableId != null) 'table_id': tableId,
          if (waiterId != null) 'waiter_id': waiterId,
          'start_date': DateFormat('yyyy-MM-dd').format(defaultStartDate),
          'end_date': DateFormat('yyyy-MM-dd').format(defaultEndDate),
        },
      );

      final ordersList = response.data['data']['orders'];
      if (ordersList == null) {
        print('No orders in response data');
        return [];
      }
      
      final orders = (ordersList as List)
          .map((json) {
            try {
              return OrderModel.fromJson(json as Map<String, dynamic>);
            } catch (e) {
              print('Error parsing order: $e');
              print('Order JSON: $json');
              rethrow;
            }
          })
          .toList();

      // Update local database
      await _saveOrdersToLocal(orders);

      return orders;
    } else {
      // Fetch from local database
      return await _getOrdersFromLocal(status: status, tableId: tableId);
    }
  }

  Future<OrderModel> createOrder({
    int? tableId,
    required int orderTypeId,
    required int numberOfPax,
    required List<Map<String, dynamic>> items,
    String? orderNote,
    String? action, // 'kot', 'bill', 'kot_bill_payment', etc.
    String? discountType, // 'percent' or 'fixed'
    double? discountValue,
    double? tipAmount,
    double? deliveryFee,
  }) async {
    final isOnline = await connectivityService.isOnline();

    // Determine order status based on action (matching web implementation)
    String? orderStatus;
    if (action != null) {
      if (action.contains('bill')) {
        orderStatus = 'billed';
      } else if (action.contains('kot')) {
        orderStatus = 'kot';
      }
    }

    final orderData = {
      if (tableId != null) 'table_id': tableId,
      'order_type_id': orderTypeId,
      'number_of_pax': numberOfPax,
      'items': items,
      if (orderNote != null) 'order_note': orderNote,
      if (orderStatus != null) 'status': orderStatus,
      if (action != null) 'action': action,
      if (discountType != null) 'discount_type': discountType,
      if (discountValue != null) 'discount_value': discountValue,
      if (tipAmount != null && tipAmount > 0) 'tip_amount': tipAmount,
      if (deliveryFee != null && deliveryFee > 0) 'delivery_fee': deliveryFee,
    };

    if (isOnline) {
      // Create directly via API
      final response = await apiClient.dio.post('/orders', data: orderData);
      final order = OrderModel.fromJson(response.data['data']);
      
      // Save to local database
      await _saveOrderToLocal(order);
      
      return order;
    } else {
      // Create locally with temp ID
      // Save to local database with synced=false
      // Return local order model
      throw UnimplementedError('Offline order creation');
    }
  }

  Future<OrderModel> updateOrderStatus({
    required int orderId,
    required String status,
  }) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      final response = await apiClient.dio.put(
        '/orders/$orderId/status',
        data: {'status': status},
      );
      final order = OrderModel.fromJson(response.data['data']);
      await _saveOrderToLocal(order);
      return order;
    } else {
      // Update locally, queue for sync
      throw UnimplementedError('Offline status update');
    }
  }

  Future<void> _saveOrdersToLocal(List<OrderModel> orders) async {
    // Save orders to local database
    for (final order in orders) {
      await _saveOrderToLocal(order);
    }
  }

  Future<void> _saveOrderToLocal(OrderModel order) async {
    // Insert or update order in local database
    // Implementation depends on Drift setup
  }

  Future<List<OrderModel>> _getOrdersFromLocal({
    String? status,
    int? tableId,
  }) async {
    // Query local database
    // Return list of OrderModel
    throw UnimplementedError('Local order retrieval');
  }
}

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  return OrderRepository(
    ref: ref,
    apiClient: ref.read(apiClientProvider),
    database: ref.read(databaseProvider),
    connectivityService: ref.read(connectivityServiceProvider),
  );
});

