import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/database/database.dart';
import 'core/providers/providers.dart';
import 'shared/services/notification_service.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/providers/auth_provider.dart';
import 'features/orders/presentation/screens/order_list_screen.dart';
import 'features/kots/presentation/screens/kot_list_screen.dart';
import 'features/payments/presentation/screens/payment_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  try {
    await Firebase.initializeApp();
  } catch (e) {
    // Firebase might not be configured (missing google-services.json)
    // App can still work without Firebase for local notifications
    print('Firebase initialization failed: $e');
  }
  
  // Initialize database
  final database = AppDatabase();
  
  // Initialize notifications
  await NotificationService().initialize();
  
  runApp(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(database),
      ],
      child: const RestaurantApp(),
    ),
  );
  
  // Start update polling (after app is built)
  // This will be handled by the provider
}

class RestaurantApp extends ConsumerWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return MaterialApp(
      title: 'Restaurant Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: authState.isAuthenticated
          ? _getHomeScreen(authState.user?.roles ?? [])
          : const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _getHomeScreen(List<String> roles) {
    if (roles.contains('Waiter')) {
      return const OrderListScreen();
    } else if (roles.contains('Kitchen') || roles.contains('Chef')) {
      return const KotListScreen();
    } else if (roles.contains('Cashier')) {
      return const PaymentListScreen();
    }
    return const OrderListScreen(); // Default
  }
}

// Providers are now exported from core/providers/providers.dart

