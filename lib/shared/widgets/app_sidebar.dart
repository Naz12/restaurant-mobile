import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/navigation/navigation_config.dart';
import '../../../core/theme/app_theme.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/sync_status_indicator.dart';

class AppSidebar extends ConsumerStatefulWidget {
  final AppRoute currentRoute;
  final Function(AppRoute) onRouteSelected;

  const AppSidebar({
    super.key,
    required this.currentRoute,
    required this.onRouteSelected,
  });

  @override
  ConsumerState<AppSidebar> createState() => _AppSidebarState();
}

class _AppSidebarState extends ConsumerState<AppSidebar> {
  bool _ordersExpanded = false;

  @override
  void initState() {
    super.initState();
    // Auto-expand Orders if current route is KOT or Orders
    _ordersExpanded = widget.currentRoute == AppRoute.kots || 
                     widget.currentRoute == AppRoute.orders;
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authStateProvider).user;
    final roles = user?.roles ?? [];
    final routes = NavigationConfig.getRoutesForRole(roles);
    final isTablet = ResponsiveLayout.isTablet(context);
    final sidebarWidth = ResponsiveLayout.getSidebarWidth(context);

    return Container(
      width: sidebarWidth,
      color: AppTheme.darkBackground,
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(isTablet ? 20 : 16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryPurple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'T',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    user?.restaurantName ?? 'Restaurant',
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          const Divider(color: Color(0xFF374151), height: 1),

          // Location (if available)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 16,
                  color: AppTheme.textSecondary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    user?.branchName ?? 'Branch ${user?.branchId ?? ''}',
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // Navigation Items
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: routes.length,
              itemBuilder: (context, index) {
                final item = routes[index];
                return _buildNavigationItem(item);
              },
            ),
          ),

          // Sync Status
          const Padding(
            padding: EdgeInsets.all(16),
            child: SyncStatusIndicator(),
          ),

          // User Info and Logout
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: AppTheme.primaryPurple,
                      child: Text(
                        user?.name.substring(0, 1).toUpperCase() ?? 'U',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user?.name ?? 'User',
                            style: const TextStyle(
                              color: AppTheme.textPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (roles.isNotEmpty)
                            Text(
                              roles.first.replaceAll(RegExp(r'_\d+$'), ''), // Remove restaurant ID suffix
                              style: const TextStyle(
                                color: AppTheme.textSecondary,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Logout Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      final authNotifier = ref.read(authStateProvider.notifier);
                      await authNotifier.logout();
                      if (context.mounted) {
                        context.go('/login');
                      }
                    },
                    icon: const Icon(
                      Icons.logout,
                      size: 16,
                      color: AppTheme.textSecondary,
                    ),
                    label: const Text(
                      'Logout',
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF374151)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItem(NavigationItem item) {
    final isSelected = widget.currentRoute == item.route;
    final hasSubItems = item.subItems != null && item.subItems!.isNotEmpty;
    final isExpanded = hasSubItems && _ordersExpanded;

    return Column(
      children: [
        InkWell(
          onTap: () {
            if (hasSubItems) {
              setState(() {
                _ordersExpanded = !_ordersExpanded;
              });
            } else {
              widget.onRouteSelected(item.route);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: isSelected ? AppTheme.primaryPurple.withOpacity(0.2) : Colors.transparent,
            child: Row(
              children: [
                Icon(
                  item.icon,
                  size: 20,
                  color: isSelected ? AppTheme.primaryPurple : AppTheme.textSecondary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.label,
                    style: TextStyle(
                      color: isSelected ? AppTheme.primaryPurple : AppTheme.textPrimary,
                      fontSize: 14,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
                if (hasSubItems)
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    size: 20,
                    color: AppTheme.textSecondary,
                  ),
              ],
            ),
          ),
        ),
        // Sub-items
        if (hasSubItems && isExpanded)
          ...item.subItems!.map((subItem) {
            final isSubSelected = widget.currentRoute == subItem.route;
            return InkWell(
              onTap: () => widget.onRouteSelected(subItem.route),
              child: Container(
                padding: const EdgeInsets.only(left: 48, right: 16, top: 8, bottom: 8),
                color: isSubSelected 
                    ? AppTheme.primaryPurple.withOpacity(0.2) 
                    : Colors.transparent,
                child: Row(
                  children: [
                    Icon(
                      subItem.icon,
                      size: 18,
                      color: isSubSelected 
                          ? AppTheme.primaryPurple 
                          : AppTheme.textSecondary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        subItem.label,
                        style: TextStyle(
                          color: isSubSelected 
                              ? AppTheme.primaryPurple 
                              : AppTheme.textSecondary,
                          fontSize: 13,
                          fontWeight: isSubSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
      ],
    );
  }
}

