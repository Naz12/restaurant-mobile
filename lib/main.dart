import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/database/database.dart';
import 'core/providers/providers.dart';
import 'core/theme/app_theme.dart';
import 'core/navigation/app_router.dart';
import 'core/navigation/navigation_config.dart';
import 'shared/services/notification_service.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/providers/auth_provider.dart';
import 'features/dashboard/presentation/screens/dashboard_screen.dart';

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
      theme: AppTheme.darkTheme,
      home: authState.isAuthenticated
          ? AppRouter.getRouteWidget(AppRoute.dashboard)
          : const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

}

// Providers are now exported from core/providers/providers.dart

