import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/database/database.dart';
import '../../../../core/providers/providers.dart';
import '../../../../shared/services/connectivity_service.dart';
import '../models/kot_model.dart';

class KotRepository {
  final Ref ref;
  final ApiClient apiClient;
  final AppDatabase database;
  final ConnectivityService connectivityService;

  KotRepository({
    required this.ref,
    required this.apiClient,
    required this.database,
    required this.connectivityService,
  });

  Future<List<KotModel>> getKots({
    int? kitchenPlaceId,
    String? status,
    String? filterOrders,
  }) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      final response = await apiClient.dio.get(
        '/kots',
        queryParameters: {
          if (kitchenPlaceId != null) 'kitchen_place_id': kitchenPlaceId,
          if (status != null) 'status': status,
          if (filterOrders != null) 'filter_orders': filterOrders,
        },
      );

      final kots = (response.data['data']['kots'] as List)
          .map((json) => KotModel.fromJson(json))
          .toList();

      await _saveKotsToLocal(kots);
      return kots;
    } else {
      return await _getKotsFromLocal(status: status);
    }
  }

  Future<KotModel> getKot(int kotId) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      final response = await apiClient.dio.get('/kots/$kotId');
      final kot = KotModel.fromJson(response.data['data']);
      await _saveKotToLocal(kot);
      return kot;
    } else {
      // Get from local database
      throw UnimplementedError('Offline KOT retrieval');
    }
  }

  Future<KotModel> confirmKot(int kotId) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      final response = await apiClient.dio.post('/kots/$kotId/confirm');
      final kot = KotModel.fromJson(response.data['data']);
      await _saveKotToLocal(kot);
      return kot;
    } else {
      // Update locally, queue for sync
      throw UnimplementedError('Offline KOT confirmation');
    }
  }

  Future<KotModel> markKotReady(int kotId) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      final response = await apiClient.dio.post('/kots/$kotId/ready');
      final kot = KotModel.fromJson(response.data['data']);
      await _saveKotToLocal(kot);
      return kot;
    } else {
      // Update locally, queue for sync
      throw UnimplementedError('Offline KOT ready');
    }
  }

  Future<KotModel> updateKotItemStatus({
    required int kotId,
    required int itemId,
    required String status,
  }) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      final response = await apiClient.dio.put(
        '/kots/$kotId/items/$itemId/status',
        data: {'status': status},
      );
      final kot = KotModel.fromJson(response.data['data']);
      await _saveKotToLocal(kot);
      return kot;
    } else {
      // Update locally, queue for sync
      throw UnimplementedError('Offline item status update');
    }
  }

  Future<void> _saveKotsToLocal(List<KotModel> kots) async {
    for (final kot in kots) {
      await _saveKotToLocal(kot);
    }
  }

  Future<void> _saveKotToLocal(KotModel kot) async {
    // Save to local database
  }

  Future<List<KotModel>> _getKotsFromLocal({String? status}) async {
    // Query local database
    throw UnimplementedError('Local KOT retrieval');
  }
}

final kotRepositoryProvider = Provider<KotRepository>((ref) {
  return KotRepository(
    ref: ref,
    apiClient: ref.read(apiClientProvider),
    database: ref.read(databaseProvider),
    connectivityService: ref.read(connectivityServiceProvider),
  );
});

