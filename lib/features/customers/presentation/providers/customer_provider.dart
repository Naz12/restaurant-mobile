import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/customer_repository.dart';
import '../../data/models/customer_model.dart';

final customersProvider = FutureProvider.family<List<CustomerModel>, String?>((ref, search) async {
  final repository = ref.read(customerRepositoryProvider);
  return await repository.getCustomers(search: search);
});

final createCustomerProvider = FutureProvider.family<CustomerModel, Map<String, dynamic>>((ref, data) async {
  final repository = ref.read(customerRepositoryProvider);
  return await repository.createCustomer(
    name: data['name'] as String,
    email: data['email'] as String?,
    phone: data['phone'] as String?,
    address: data['address'] as String?,
  );
});

