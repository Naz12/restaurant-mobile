import 'package:flutter/material.dart';

enum AppRoute {
  dashboard,
  pos,
  orders,
  kots,
}

class NavigationConfig {
  // Helper to check if user has a role (handles roles with restaurant ID suffix)
  static bool _hasRole(List<String> roles, String roleName) {
    return roles.any((role) => 
      role == roleName || 
      role.startsWith('${roleName}_') ||
      role.contains(roleName)
    );
  }

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

    // POS - available to Waiter, Accountant, and Cashier
    if (_hasRole(roles, 'Waiter') || 
        _hasRole(roles, 'Accountant') || 
        _hasRole(roles, 'Cashier')) {
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
    if (_hasRole(roles, 'Chef') || _hasRole(roles, 'Kitchen')) {
      ordersSubItems.add(
        NavigationItem(
          route: AppRoute.kots,
          label: 'KOT',
          icon: Icons.restaurant_menu,
          available: true,
        ),
      );
    }

    // Orders list - available to Waiter, Accountant, and Cashier
    if (_hasRole(roles, 'Waiter') || 
        _hasRole(roles, 'Accountant') || 
        _hasRole(roles, 'Cashier')) {
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
        return _hasRole(roles, 'Waiter') || 
               _hasRole(roles, 'Accountant') || 
               _hasRole(roles, 'Cashier');
      case AppRoute.orders:
        return _hasRole(roles, 'Waiter') || 
               _hasRole(roles, 'Accountant') || 
               _hasRole(roles, 'Cashier');
      case AppRoute.kots:
        return _hasRole(roles, 'Chef') || _hasRole(roles, 'Kitchen');
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


