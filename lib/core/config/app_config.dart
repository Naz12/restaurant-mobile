class AppConfig {
  // API Configuration
  static const String apiBaseUrl = 'https://restaurant.akmicroservice.com/api/mobile';

  // Sync Configuration
  static const Duration onlineSyncInterval = Duration(seconds: 5);
  static const Duration offlineSyncInterval = Duration(seconds: 3);
  static const Duration peerToPeerSyncInterval = Duration(seconds: 2);
  
  // Network Configuration
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  
  // Local Network Configuration
  static const int localServerPort = 8080;
  static const String localServiceName = 'restaurant-mobile-sync';
  
  // Notification Configuration
  static const String notificationChannelId = 'restaurant_notifications';
  static const String notificationChannelName = 'Restaurant Notifications';
  static const String notificationChannelDescription = 'Notifications for orders and KOTs';
}

