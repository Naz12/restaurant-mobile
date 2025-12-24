import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/providers/providers.dart';
import '../../../../shared/services/connectivity_service.dart';
import '../models/waiter_model.dart';

class WaiterRepository {
  final Ref ref;
  final ApiClient apiClient;
  final ConnectivityService connectivityService;

  WaiterRepository({
    required this.ref,
    required this.apiClient,
    required this.connectivityService,
  });

  Future<List<WaiterModel>> getWaiters() async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      try {
        // Try to fetch from waiters endpoint (if it exists)
        final response = await apiClient.dio.get('/waiters');
        final waitersList = response.data['data']['waiters'] as List?;
        if (waitersList != null) {
          return waitersList
              .map((json) => WaiterModel.fromJson(json as Map<String, dynamic>))
              .toList();
        }
      } catch (e) {
        // If endpoint doesn't exist, return empty list for now
        // In production, this endpoint should be added to the API
        print('Waiters endpoint not available: $e');
        return [];
      }
    }
    return [];
  }
}

final waiterRepositoryProvider = Provider<WaiterRepository>((ref) {
  return WaiterRepository(
    ref: ref,
    apiClient: ref.read(apiClientProvider),
    connectivityService: ref.read(connectivityServiceProvider),
  );
});

