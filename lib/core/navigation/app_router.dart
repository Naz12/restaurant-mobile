import 'package:flutter/material.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/orders/presentation/screens/pos_order_screen.dart';
import '../../features/orders/presentation/screens/order_list_screen.dart';
import '../../features/kots/presentation/screens/kot_list_screen.dart';
import 'navigation_config.dart';

class AppRouter {
  static Widget getRouteWidget(AppRoute route) {
    switch (route) {
      case AppRoute.dashboard:
        return const DashboardScreen();
      case AppRoute.pos:
        return const PosOrderScreen();
      case AppRoute.orders:
        return const OrderListScreen();
      case AppRoute.kots:
        return const KotListScreen();
    }
  }

  static void navigateToRoute(BuildContext context, AppRoute route) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => getRouteWidget(route),
      ),
    );
  }

  static AppRoute getRouteFromString(String? routeName) {
    switch (routeName) {
      case 'dashboard':
        return AppRoute.dashboard;
      case 'pos':
        return AppRoute.pos;
      case 'orders':
        return AppRoute.orders;
      case 'kots':
        return AppRoute.kots;
      default:
        return AppRoute.dashboard;
    }
  }
}

