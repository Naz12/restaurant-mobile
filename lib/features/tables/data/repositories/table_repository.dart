import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/providers/providers.dart';
import '../../../../shared/services/connectivity_service.dart';
import '../models/table_model.dart';

class TableRepository {
  final Ref ref;
  final ApiClient apiClient;
  final ConnectivityService connectivityService;

  TableRepository({
    required this.ref,
    required this.apiClient,
    required this.connectivityService,
  });

  Future<List<TableModel>> getTables({
    int? areaId,
    String? status,
  }) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      try {
        final response = await apiClient.dio.get(
          '/tables',
          queryParameters: {
            if (areaId != null) 'area_id': areaId,
            if (status != null && status.isNotEmpty) 'status': status,
          },
        );

        print('Tables response: ${response.data}');
        
        if (response.data['success'] == true && response.data['data'] != null) {
          final tablesList = response.data['data']['tables'] as List?;
          if (tablesList != null) {
            final tables = tablesList
                .map((json) => TableModel.fromJson(json as Map<String, dynamic>))
                .toList();
            print('Loaded ${tables.length} tables');
            return tables;
          }
        }
        
        print('No tables found in response');
        return [];
      } catch (e) {
        print('Error loading tables: $e');
        rethrow;
      }
    } else {
      // Return cached tables from local database
      // TODO: Implement local database retrieval
      return [];
    }
  }

  Future<TableModel> getTable(int id) async {
    try {
      final response = await apiClient.dio.get('/tables/$id');
      
      print('Table response: ${response.data}');
      
      if (response.data['success'] == true && response.data['data'] != null) {
        return TableModel.fromJson(response.data['data'] as Map<String, dynamic>);
      } else {
        throw Exception('Table not found or invalid response');
      }
    } catch (e) {
      print('Error loading table: $e');
      rethrow;
    }
  }

  Future<List<TableAreaModel>> getAreas() async {
    final response = await apiClient.dio.get('/tables/areas');
    
    final areas = (response.data['data']['areas'] as List)
        .map((json) => TableAreaModel.fromJson(json))
        .toList();

    return areas;
  }

  Future<void> lockTable(int id) async {
    await apiClient.dio.post('/tables/$id/lock');
  }

  Future<void> unlockTable(int id, {bool force = false}) async {
    await apiClient.dio.post(
      '/tables/$id/unlock',
      queryParameters: {'force': force},
    );
  }
}

final tableRepositoryProvider = Provider<TableRepository>((ref) {
  return TableRepository(
    ref: ref,
    apiClient: ref.read(apiClientProvider),
    connectivityService: ref.read(connectivityServiceProvider),
  );
});

