import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/providers/providers.dart';
import '../../../../shared/services/connectivity_service.dart';
import '../models/delivery_executive_model.dart';

class DeliveryExecutiveRepository {
  final Ref ref;
  final ApiClient apiClient;
  final ConnectivityService connectivityService;

  DeliveryExecutiveRepository({
    required this.ref,
    required this.apiClient,
    required this.connectivityService,
  });

  Future<List<DeliveryExecutiveModel>> getDeliveryExecutives() async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      try {
        final response = await apiClient.dio.get('/delivery-executives');
        final executivesList = response.data['data']['executives'] as List?;
        if (executivesList != null) {
          return executivesList
              .map((json) => DeliveryExecutiveModel.fromJson(json as Map<String, dynamic>))
              .toList();
        }
      } catch (e) {
        // If endpoint doesn't exist, return empty list for now
        print('Delivery executives endpoint not available: $e');
        return [];
      }
    }
    return [];
  }
}

final deliveryExecutiveRepositoryProvider = Provider<DeliveryExecutiveRepository>((ref) {
  return DeliveryExecutiveRepository(
    ref: ref,
    apiClient: ref.read(apiClientProvider),
    connectivityService: ref.read(connectivityServiceProvider),
  );
});

