import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/database/database.dart';
import '../../../../core/providers/providers.dart';
import '../../../../shared/services/connectivity_service.dart';
import '../models/payment_model.dart';

class PaymentRepository {
  final Ref ref;
  final ApiClient apiClient;
  final AppDatabase database;
  final ConnectivityService connectivityService;

  PaymentRepository({
    required this.ref,
    required this.apiClient,
    required this.database,
    required this.connectivityService,
  });

  Future<Map<String, dynamic>> processPayment({
    required int orderId,
    required String paymentMethod,
    required double amount,
    double? tipAmount,
    String? notes,
    List<Map<String, dynamic>>? splitPayments,
  }) async {
    final isOnline = await connectivityService.isOnline();

    final paymentData = {
      'order_id': orderId,
      'payment_method': paymentMethod,
      'amount': amount,
      if (tipAmount != null) 'tip_amount': tipAmount,
      if (notes != null) 'notes': notes,
      if (splitPayments != null) 'split_payments': splitPayments,
    };

    if (isOnline) {
      // Process directly via API
      final response = await apiClient.dio.post('/payments', data: paymentData);
      // Save to local database
      return response.data;
    } else {
      // Save locally with temp ID, queue for sync
      throw UnimplementedError('Offline payment processing');
    }
  }

  Future<List<Map<String, dynamic>>> getPayments({
    int? orderId,
    String? paymentMethod,
  }) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      final response = await apiClient.dio.get(
        '/payments',
        queryParameters: {
          if (orderId != null) 'order_id': orderId,
          if (paymentMethod != null) 'payment_method': paymentMethod,
        },
      );
      return (response.data['data']['payments'] as List).cast<Map<String, dynamic>>();
    } else {
      // Fetch from local database
      throw UnimplementedError('Local payment retrieval');
    }
  }

  Future<List<PaymentModel>> getOrderPayments(int orderId) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      final response = await apiClient.dio.get('/orders/$orderId/payments');
      final paymentsList = response.data['data']['payments'] as List?;
      if (paymentsList == null) return [];
      
      return paymentsList
          .map((json) => PaymentModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      return [];
    }
  }
}

final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  return PaymentRepository(
    ref: ref,
    apiClient: ref.read(apiClientProvider),
    database: ref.read(databaseProvider),
    connectivityService: ref.read(connectivityServiceProvider),
  );
});

