import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/database/database.dart';
import '../../../../core/providers/providers.dart';
import '../../../orders/data/models/order_model.dart';
import '../../../../shared/services/connectivity_service.dart';
import 'package:intl/intl.dart';

class DashboardRepository {
  final Ref ref;
  final ApiClient apiClient;
  final AppDatabase database;
  final ConnectivityService connectivityService;

  DashboardRepository({
    required this.ref,
    required this.apiClient,
    required this.database,
    required this.connectivityService,
  });

  // Get today's orders count
  Future<int> getTodayOrdersCount() async {
    final isOnline = await connectivityService.isOnline();
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    if (isOnline) {
      try {
        final response = await apiClient.dio.get(
          '/orders',
          queryParameters: {
            'start_date': DateFormat('yyyy-MM-dd').format(startOfDay),
            'end_date': DateFormat('yyyy-MM-dd').format(endOfDay),
            'per_page': 1,
          },
        );
        return response.data['data']['pagination']['total'] ?? 0;
      } catch (e) {
        // Fallback to local
        return await _getTodayOrdersCountFromLocal(startOfDay, endOfDay);
      }
    } else {
      return await _getTodayOrdersCountFromLocal(startOfDay, endOfDay);
    }
  }

  // Get yesterday's orders count for comparison
  Future<int> getYesterdayOrdersCount() async {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    final startOfDay = DateTime(yesterday.year, yesterday.month, yesterday.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final isOnline = await connectivityService.isOnline();
    if (isOnline) {
      try {
        final response = await apiClient.dio.get(
          '/orders',
          queryParameters: {
            'start_date': DateFormat('yyyy-MM-dd').format(startOfDay),
            'end_date': DateFormat('yyyy-MM-dd').format(endOfDay),
            'per_page': 1,
          },
        );
        return response.data['data']['pagination']['total'] ?? 0;
      } catch (e) {
        return 0;
      }
    } else {
      return await _getTodayOrdersCountFromLocal(startOfDay, endOfDay);
    }
  }

  // Get today's orders list
  Future<List<OrderModel>> getTodayOrders({int limit = 10}) async {
    final isOnline = await connectivityService.isOnline();
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    if (isOnline) {
      try {
        final response = await apiClient.dio.get(
          '/orders',
          queryParameters: {
            'start_date': DateFormat('yyyy-MM-dd').format(startOfDay),
            'end_date': DateFormat('yyyy-MM-dd').format(endOfDay),
            'per_page': limit,
          },
        );

        final orders = (response.data['data']['orders'] as List)
            .map((json) => OrderModel.fromJson(json))
            .toList();

        // Update local database
        await _saveOrdersToLocal(orders);

        return orders;
      } catch (e) {
        // Fallback to local
        return await _getTodayOrdersFromLocal(startOfDay, endOfDay, limit);
      }
    } else {
      return await _getTodayOrdersFromLocal(startOfDay, endOfDay, limit);
    }
  }

  Future<int> _getTodayOrdersCountFromLocal(DateTime start, DateTime end) async {
    // TODO: Implement local database query
    // For now, return 0
    return 0;
  }

  Future<List<OrderModel>> _getTodayOrdersFromLocal(
    DateTime start,
    DateTime end,
    int limit,
  ) async {
    // TODO: Implement local database query
    // For now, return empty list
    return [];
  }

  Future<void> _saveOrdersToLocal(List<OrderModel> orders) async {
    // TODO: Implement local database save
  }
}

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository(
    ref: ref,
    apiClient: ref.read(apiClientProvider),
    database: ref.read(databaseProvider),
    connectivityService: ref.read(connectivityServiceProvider),
  );
});


