import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/database/database.dart';
import '../../../../core/providers/providers.dart';
import '../../../../shared/services/connectivity_service.dart';
import '../models/kot_model.dart';
import '../models/cancel_reason_model.dart';
import 'package:intl/intl.dart';

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
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      try {
        // Default to today if no date range specified (matching web version)
        final today = DateTime.now();
        final defaultStartDate = startDate ?? DateTime(today.year, today.month, today.day);
        final defaultEndDate = endDate ?? defaultStartDate.add(const Duration(days: 1));
        
        // Map mobile status filters to API status values
        String? apiStatus = status;
        String? apiFilterOrders = filterOrders;
        
        // Handle pending_confirmation status - use filter_orders instead
        if (status == 'pending_confirmation') {
          apiStatus = null; // Don't filter by status
          apiFilterOrders = 'pending_confirmation'; // Use filter_orders instead
        }
        
        print('Fetching KOTs with filters: kitchen_place_id=$kitchenPlaceId, status=$apiStatus, filter_orders=$apiFilterOrders, start_date=$defaultStartDate, end_date=$defaultEndDate');
        final response = await apiClient.dio.get(
          '/kots',
          queryParameters: {
            if (kitchenPlaceId != null) 'kitchen_place_id': kitchenPlaceId,
            if (apiStatus != null) 'status': apiStatus,
            if (apiFilterOrders != null) 'filter_orders': apiFilterOrders,
            'start_date': DateFormat('yyyy-MM-dd').format(defaultStartDate),
            'end_date': DateFormat('yyyy-MM-dd').format(defaultEndDate),
          },
        );

        print('KOTs API response: ${response.data}');

        final kotsList = response.data['data']?['kots'];
        if (kotsList == null) {
          print('No KOTs in response data. Full response: ${response.data}');
          return [];
        }
        
        if (kotsList is! List) {
          print('KOTs data is not a list: ${kotsList.runtimeType}');
          return [];
        }

        if (kotsList.isEmpty) {
          print('KOTs list is empty');
          return [];
        }
        
        final kots = kotsList
            .map((json) {
              try {
                return KotModel.fromJson(json as Map<String, dynamic>);
              } catch (e) {
                print('Error parsing KOT: $e');
                print('KOT JSON: $json');
                rethrow;
              }
            })
            .toList();

        print('Successfully parsed ${kots.length} KOTs');
        await _saveKotsToLocal(kots);
        return kots;
      } catch (e, stackTrace) {
        print('Error fetching KOTs: $e');
        print('Stack trace: $stackTrace');
        rethrow;
      }
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

  Future<KotModel> updateKotItemQuantity({
    required int kotId,
    required int itemId,
    required int quantity,
  }) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      // Try to use the KOT item quantity endpoint, or fall back to order item update
      try {
        final response = await apiClient.dio.put(
          '/kots/$kotId/items/$itemId/quantity',
          data: {'quantity': quantity},
        );
        final kot = KotModel.fromJson(response.data['data']);
        await _saveKotToLocal(kot);
        return kot;
      } catch (e) {
        // If KOT endpoint doesn't exist, try to update through order item
        // First get the KOT to find the order ID
        final kot = await getKot(kotId);
        try {
          // Find the order item ID from the KOT item
          // This is a workaround - ideally the API should have a direct endpoint
          await apiClient.dio.put(
            '/orders/${kot.order.id}/items/$itemId',
            data: {'quantity': quantity},
          );
          // Refresh the KOT after order item update
          return await getKot(kotId);
        } catch (e2) {
          // If both fail, the endpoint needs to be added
          throw Exception('KOT item quantity update not available. Please add endpoint: PUT /kots/{kotId}/items/{itemId}/quantity');
        }
      }
    } else {
      // Update locally, queue for sync
      throw UnimplementedError('Offline item quantity update');
    }
  }

  Future<KotModel> cancelKot({
    required int kotId,
    required int cancelReasonId,
    String? cancelNote,
  }) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      final response = await apiClient.dio.post(
        '/kots/$kotId/cancel',
        data: {
          'cancel_reason_id': cancelReasonId,
          if (cancelNote != null) 'cancel_note': cancelNote,
        },
      );
      final kot = KotModel.fromJson(response.data['data']);
      await _saveKotToLocal(kot);
      return kot;
    } else {
      // Update locally, queue for sync
      throw UnimplementedError('Offline KOT cancellation');
    }
  }

  Future<KotModel> cancelKotItem({
    required int kotId,
    required int itemId,
    required int cancelReasonId,
    String? cancelNote,
  }) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      final response = await apiClient.dio.post(
        '/kots/$kotId/items/$itemId/cancel',
        data: {
          'cancel_reason_id': cancelReasonId,
          if (cancelNote != null) 'cancel_note': cancelNote,
        },
      );
      final kot = KotModel.fromJson(response.data['data']);
      await _saveKotToLocal(kot);
      return kot;
    } else {
      // Update locally, queue for sync
      throw UnimplementedError('Offline KOT item cancellation');
    }
  }

  Future<List<CancelReasonModel>> getCancelReasons() async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      final response = await apiClient.dio.get('/kots/cancel-reasons');
      final reasonsList = response.data['data']['reasons'] as List;
      return reasonsList
          .map((json) => CancelReasonModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      // Return cached reasons or empty list
      return [];
    }
  }

  Future<List<KotModel>> getKotsForOrder(int orderId) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      final response = await apiClient.dio.get(
        '/kots',
        queryParameters: {
          'order_id': orderId,
        },
      );
      final kotsList = response.data['data']?['kots'] as List?;
      if (kotsList == null) return [];
      
      return kotsList
          .map((json) => KotModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      return [];
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

