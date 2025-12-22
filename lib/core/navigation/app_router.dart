import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'navigation_config.dart';

class AppRouter {
  static String getRoutePath(AppRoute route) {
    switch (route) {
      case AppRoute.dashboard:
        return '/dashboard';
      case AppRoute.pos:
        return '/pos';
      case AppRoute.orders:
        return '/orders';
      case AppRoute.kots:
        return '/kots';
    }
  }

  static AppRoute getRouteFromPath(String path) {
    switch (path) {
      case '/dashboard':
        return AppRoute.dashboard;
      case '/pos':
        return AppRoute.pos;
      case '/orders':
        return AppRoute.orders;
      case '/kots':
        return AppRoute.kots;
      default:
        return AppRoute.dashboard;
    }
  }

  static void navigateToRoute(BuildContext context, AppRoute route) {
    final path = getRoutePath(route);
    context.go(path);
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

