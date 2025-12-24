import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/payment_repository.dart';
import '../../data/models/payment_model.dart';

final orderPaymentsProvider = FutureProvider.family<List<PaymentModel>, int>((ref, orderId) async {
  final repository = ref.read(paymentRepositoryProvider);
  return await repository.getOrderPayments(orderId);
});

