import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';

/// Permission service for RBAC (Role-Based Access Control)
/// Matches backend permission checking logic
class PermissionService {
  final Ref ref;

  PermissionService(this.ref);

  /// Check if user has a specific permission
  /// Matches backend user_can() helper function
  bool userCan(String permission) {
    final user = ref.read(authStateProvider).user;
    if (user == null) return false;

    // Check direct permissions
    if (user.permissions != null && user.permissions!.contains(permission)) {
      return true;
    }

    // Check role-based permissions
    // Common permissions mapping based on roles
    if (user.roles.contains('Admin_${user.restaurantId}') ||
        user.roles.contains('Super Admin')) {
      return true; // Admins have all permissions
    }

    // Role-specific permissions
    switch (permission) {
      case 'Create Order':
        return user.roles.any((role) =>
            role.contains('Waiter') || role.contains('Admin'));
      case 'Update Order':
        return user.roles.any((role) =>
            role.contains('Waiter') ||
            role.contains('Admin') ||
            role.contains('Cashier'));
      case 'Delete Order':
        return user.roles.any((role) =>
            role.contains('Admin') || role.contains('Manager'));
      case 'View Orders':
        return user.roles.any((role) =>
            role.contains('Waiter') ||
            role.contains('Admin') ||
            role.contains('Cashier'));
      case 'View KOTs':
        return user.roles.any((role) =>
            role.contains('Kitchen') ||
            role.contains('Chef') ||
            role.contains('Admin'));
      case 'Update KOT':
        return user.roles.any((role) =>
            role.contains('Kitchen') ||
            role.contains('Chef') ||
            role.contains('Admin'));
      case 'Process Payment':
        return user.roles.any((role) =>
            role.contains('Cashier') ||
            role.contains('Admin') ||
            role.contains('Manager'));
      case 'Add Discount on POS':
        return user.roles.any((role) =>
            role.contains('Admin') ||
            role.contains('Manager') ||
            role.contains('Cashier'));
      default:
        return false;
    }
  }

  /// Check if user has any of the given permissions
  bool userCanAny(List<String> permissions) {
    return permissions.any((permission) => userCan(permission));
  }

  /// Check if user has all of the given permissions
  bool userCanAll(List<String> permissions) {
    return permissions.every((permission) => userCan(permission));
  }

  /// Check if user has a specific role
  bool hasRole(String role) {
    final user = ref.read(authStateProvider).user;
    if (user == null) return false;
    return user.roles.contains(role);
  }

  /// Check if user has any of the given roles
  bool hasAnyRole(List<String> roles) {
    final user = ref.read(authStateProvider).user;
    if (user == null) return false;
    return roles.any((role) => user.roles.contains(role));
  }
}

final permissionServiceProvider = Provider<PermissionService>((ref) {
  return PermissionService(ref);
});

