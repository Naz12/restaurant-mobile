import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'core/database/database.dart';
import 'core/providers/providers.dart';
import 'core/theme/app_theme.dart';
import 'shared/services/notification_service.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/providers/auth_provider.dart';
import 'features/dashboard/presentation/screens/dashboard_screen.dart';
import 'features/orders/presentation/screens/pos_order_screen.dart';
import 'features/orders/presentation/screens/order_list_screen.dart';
import 'features/kots/presentation/screens/kot_list_screen.dart';

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
}

class RestaurantApp extends ConsumerWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    // Create router
    final router = GoRouter(
      initialLocation: '/login',
      redirect: (context, state) {
        final isAuthenticated = authState.isAuthenticated;
        final isLoginPage = state.matchedLocation == '/login';

        if (!isAuthenticated && !isLoginPage) {
          return '/login';
        }
        if (isAuthenticated && isLoginPage) {
          return '/dashboard';
        }
        return null;
      },
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/pos',
          builder: (context, state) => const PosOrderScreen(),
        ),
        GoRoute(
          path: '/orders',
          builder: (context, state) => const OrderListScreen(),
        ),
        GoRoute(
          path: '/kots',
          builder: (context, state) => const KotListScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Restaurant Mobile',
      theme: AppTheme.darkTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

// Providers are now exported from core/providers/providers.dart

