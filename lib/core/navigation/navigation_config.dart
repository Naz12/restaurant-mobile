import 'package:flutter/material.dart';

enum AppRoute {
  dashboard,
  pos,
  orders,
  kots,
}

class NavigationConfig {
  // Get available routes for a role
  static List<NavigationItem> getRoutesForRole(List<String> roles) {
    final allRoutes = <NavigationItem>[];

    // Dashboard - available to all
    allRoutes.add(
      NavigationItem(
        route: AppRoute.dashboard,
        label: 'Dashboard',
        icon: Icons.dashboard,
        available: true,
      ),
    );

    // POS - available to Waiter and Accountant
    if (roles.contains('Waiter') || roles.contains('Accountant') || roles.contains('Cashier')) {
      allRoutes.add(
        NavigationItem(
          route: AppRoute.pos,
          label: 'POS',
          icon: Icons.point_of_sale,
          available: true,
        ),
      );
    }

    // Orders section - available to all
    final ordersSubItems = <NavigationItem>[];

    // KOT - available to Chef/Kitchen
    if (roles.contains('Chef') || roles.contains('Kitchen')) {
      ordersSubItems.add(
        NavigationItem(
          route: AppRoute.kots,
          label: 'KOT',
          icon: Icons.restaurant_menu,
          available: true,
        ),
      );
    }

    // Orders list - available to Waiter and Accountant
    if (roles.contains('Waiter') || roles.contains('Accountant') || roles.contains('Cashier')) {
      ordersSubItems.add(
        NavigationItem(
          route: AppRoute.orders,
          label: 'Orders',
          icon: Icons.receipt_long,
          available: true,
        ),
      );
    }

    if (ordersSubItems.isNotEmpty) {
      allRoutes.add(
        NavigationItem(
          route: AppRoute.orders,
          label: 'Orders',
          icon: Icons.restaurant,
          available: true,
          subItems: ordersSubItems,
        ),
      );
    }

    return allRoutes;
  }

  // Check if route is accessible for role
  static bool isRouteAccessible(AppRoute route, List<String> roles) {
    switch (route) {
      case AppRoute.dashboard:
        return true; // All roles
      case AppRoute.pos:
        return roles.contains('Waiter') || 
               roles.contains('Accountant') || 
               roles.contains('Cashier');
      case AppRoute.orders:
        return roles.contains('Waiter') || 
               roles.contains('Accountant') || 
               roles.contains('Cashier');
      case AppRoute.kots:
        return roles.contains('Chef') || roles.contains('Kitchen');
    }
  }
}

class NavigationItem {
  final AppRoute route;
  final String label;
  final IconData icon;
  final bool available;
  final List<NavigationItem>? subItems;

  NavigationItem({
    required this.route,
    required this.label,
    required this.icon,
    required this.available,
    this.subItems,
  });
}


