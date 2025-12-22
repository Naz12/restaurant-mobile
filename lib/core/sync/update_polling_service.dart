import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';
import '../config/app_config.dart';
import '../network/api_client.dart';
import '../database/database.dart';
import '../../shared/services/connectivity_service.dart';
import '../../shared/services/notification_service.dart';
import '../../features/orders/data/models/order_model.dart';
import '../../features/kots/data/models/kot_model.dart';

class UpdatePollingService {
  final Ref ref;
  final ApiClient apiClient;
  final AppDatabase database;
  final ConnectivityService connectivityService;
  final NotificationService notificationService;
  Timer? _pollTimer;
  DateTime? _lastSyncTime;

  UpdatePollingService({
    required this.ref,
    required this.apiClient,
    required this.database,
    required this.connectivityService,
    required this.notificationService,
  });

  void startPolling() {
    _pollTimer?.cancel();
    _lastSyncTime = DateTime.now().subtract(const Duration(hours: 1));

    _pollTimer = Timer.periodic(
      AppConfig.onlineSyncInterval,
      (_) => _pollForUpdates(),
    );
  }

  Future<void> _pollForUpdates() async {
    final isOnline = await connectivityService.isOnline();
    if (!isOnline) return;

    try {
      // Poll for order updates
      await _pollOrders();
      
      // Poll for KOT updates
      await _pollKots();
      
      // Poll for payment updates
      await _pollPayments();
      
      _lastSyncTime = DateTime.now();
    } catch (e) {
      print('Polling error: $e');
    }
  }

  Future<void> _pollOrders() async {
    try {
      final response = await apiClient.dio.get(
        '/updates/orders',
        queryParameters: {
          'last_sync': _lastSyncTime?.toIso8601String(),
        },
      );

      if (response.data['success']) {
        final orders = (response.data['data']['orders'] as List)
            .map((json) => OrderModel.fromJson(json))
            .toList();

        // Update local database
        // Show notifications for new orders
        for (final order in orders) {
          if (order.status == 'placed') {
            await notificationService.showNotification(
              title: 'New Order',
              body: 'Order ${order.formattedOrderNumber} received',
              payload: 'order:${order.id}',
            );
          }
        }
      }
    } catch (e) {
      print('Error polling orders: $e');
    }
  }

  Future<void> _pollKots() async {
    try {
      final response = await apiClient.dio.get(
        '/updates/kots',
        queryParameters: {
          'last_sync': _lastSyncTime?.toIso8601String(),
        },
      );

      if (response.data['success']) {
        final kots = (response.data['data']['kots'] as List)
            .map((json) => KotModel.fromJson(json))
            .toList();

        // Update local database
        // Show notifications for KOT status changes
        for (final kot in kots) {
          if (kot.status == 'ready') {
            await notificationService.showNotification(
              title: 'KOT Ready',
              body: 'KOT #${kot.kotNumber} is ready',
              payload: 'kot:${kot.id}',
            );
          }
        }
      }
    } catch (e) {
      print('Error polling KOTs: $e');
    }
  }

  Future<void> _pollPayments() async {
    try {
      final response = await apiClient.dio.get(
        '/updates/payments',
        queryParameters: {
          'last_sync': _lastSyncTime?.toIso8601String(),
        },
      );

      if (response.data['success']) {
        // Update local database with payment updates
      }
    } catch (e) {
      print('Error polling payments: $e');
    }
  }

  void stopPolling() {
    _pollTimer?.cancel();
  }

  void dispose() {
    stopPolling();
  }
}

final updatePollingServiceProvider = Provider<UpdatePollingService>((ref) {
  final service = UpdatePollingService(
    ref: ref,
    apiClient: ref.read(apiClientProvider),
    database: ref.read(databaseProvider),
    connectivityService: ref.read(connectivityServiceProvider),
    notificationService: NotificationService(),
  );
  service.startPolling();
  ref.onDispose(() => service.dispose());
  return service;
});

