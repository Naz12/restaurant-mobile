import 'package:flutter/foundation.dart' show kIsWeb;
import '../../core/config/app_config.dart';

// Only import notification packages on non-web platforms (dart.library.io means not web)
import 'package:flutter_local_notifications/flutter_local_notifications.dart' if (dart.library.html) 'package:flutter/foundation.dart' hide kIsWeb;
import 'package:firebase_core/firebase_core.dart' if (dart.library.html) 'package:flutter/foundation.dart' hide kIsWeb;
import 'package:firebase_messaging/firebase_messaging.dart' if (dart.library.html) 'package:flutter/foundation.dart' hide kIsWeb;

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  // Use dynamic to avoid type issues with conditional imports
  dynamic _localNotifications;
  dynamic _firebaseMessaging;

  Future<void> initialize() async {
    // Skip all notification initialization on web
    if (kIsWeb) return;
    
    // Initialize local notifications (only on mobile)
    // Use dynamic to avoid type resolution issues with conditional imports
    // ignore: avoid_dynamic_calls
    _localNotifications = (FlutterLocalNotificationsPlugin as dynamic)();
    // ignore: avoid_dynamic_calls
    final androidSettings = (AndroidInitializationSettings as dynamic)('@mipmap/ic_launcher');
    // ignore: avoid_dynamic_calls
    final iosSettings = (DarwinInitializationSettings as dynamic)();
    // ignore: avoid_dynamic_calls
    final initSettings = (InitializationSettings as dynamic)(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Create notification channel
    // ignore: avoid_dynamic_calls
    final androidChannel = (AndroidNotificationChannel as dynamic)(
      AppConfig.notificationChannelId,
      AppConfig.notificationChannelName,
      description: AppConfig.notificationChannelDescription,
      importance: (Importance as dynamic).high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);

    // Initialize Firebase Messaging if Firebase is available
    try {
      // Use dynamic to avoid type issues with conditional imports
      // ignore: avoid_dynamic_calls
      final firebase = Firebase as dynamic;
      if (firebase.apps.isNotEmpty) {
        // ignore: avoid_dynamic_calls
        _firebaseMessaging = (FirebaseMessaging as dynamic).instance;
        // Request permissions
        await _requestPermissions();
        // Setup Firebase messaging
        await _setupFirebaseMessaging();
      } else {
        print('Firebase not initialized, skipping Firebase Messaging setup');
        // Still request local notification permissions
        final androidImplementation = _localNotifications
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>();
        await androidImplementation?.requestNotificationsPermission();
      }
    } catch (e) {
      print('Error initializing Firebase Messaging: $e');
      // Still request local notification permissions
      final androidImplementation = _localNotifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      await androidImplementation?.requestNotificationsPermission();
    }
  }

  Future<void> _requestPermissions() async {
    if (_firebaseMessaging == null) return;
    
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    final androidImplementation = _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await androidImplementation?.requestNotificationsPermission();
  }

  Future<void> _setupFirebaseMessaging() async {
    if (_firebaseMessaging == null) return;
    
    // Get FCM token
    final token = await _firebaseMessaging.getToken();
    print('FCM Token: $token');
    // Send token to server for push notifications

    // Handle foreground messages
    // ignore: avoid_dynamic_calls
    (FirebaseMessaging as dynamic).onMessage.listen(_handleForegroundMessage);

    // Handle background messages
    // ignore: avoid_dynamic_calls
    (FirebaseMessaging as dynamic).onBackgroundMessage(_handleBackgroundMessage);
  }

  Future<void> _handleForegroundMessage(dynamic message) async {
    // Show local notification when app is in foreground
    await showNotification(
      title: (message?.notification?.title as String?) ?? 'New Notification',
      body: (message?.notification?.body as String?) ?? '',
      payload: message.data.toString(),
    );
  }

  static Future<void> _handleBackgroundMessage(dynamic message) async {
    // Handle background message
    print('Background message: ${message.messageId}');
  }

  Future<void> showNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    if (kIsWeb || _localNotifications == null) return;
    
    // ignore: avoid_dynamic_calls
    final androidDetails = (AndroidNotificationDetails as dynamic)(
      AppConfig.notificationChannelId,
      AppConfig.notificationChannelName,
      channelDescription: AppConfig.notificationChannelDescription,
      importance: (Importance as dynamic).high,
      priority: (Priority as dynamic).high,
    );

    // ignore: avoid_dynamic_calls
    final iosDetails = (DarwinNotificationDetails as dynamic)();

    // ignore: avoid_dynamic_calls
    final details = (NotificationDetails as dynamic)(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      DateTime.now().millisecond,
      title,
      body,
      details,
      payload: payload,
    );
  }

  void _onNotificationTapped(dynamic response) {
    // Handle notification tap
    // Navigate to relevant screen based on payload
    if (kIsWeb) return;
  }

  Future<String?> getFCMToken() async {
    if (_firebaseMessaging == null) return null;
    return await _firebaseMessaging.getToken();
  }
}

