import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/providers/providers.dart';
import '../../../../shared/services/connectivity_service.dart';
import '../models/customer_model.dart';

class CustomerRepository {
  final Ref ref;
  final ApiClient apiClient;
  final ConnectivityService connectivityService;

  CustomerRepository({
    required this.ref,
    required this.apiClient,
    required this.connectivityService,
  });

  Future<List<CustomerModel>> getCustomers({String? search}) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      final response = await apiClient.dio.get(
        '/customers',
        queryParameters: {
          if (search != null && search.isNotEmpty) 'search': search,
        },
      );

      final customersList = response.data['data']['customers'] as List;
      return customersList
          .map((json) => CustomerModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      // Return empty list when offline - customers should be cached
      return [];
    }
  }

  Future<CustomerModel> createCustomer({
    required String name,
    String? email,
    String? phone,
    String? address,
  }) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      final response = await apiClient.dio.post(
        '/customers',
        data: {
          'name': name,
          if (email != null) 'email': email,
          if (phone != null) 'phone': phone,
          if (address != null) 'address': address,
        },
      );

      return CustomerModel.fromJson(response.data['data']);
    } else {
      throw UnimplementedError('Offline customer creation');
    }
  }
}

final customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  return CustomerRepository(
    ref: ref,
    apiClient: ref.read(apiClientProvider),
    connectivityService: ref.read(connectivityServiceProvider),
  );
});

