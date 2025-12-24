import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/navigation/navigation_config.dart';
import '../../../core/navigation/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../widgets/responsive_layout.dart';
import 'app_sidebar.dart';

class AppScaffold extends ConsumerStatefulWidget {
  final Widget child;
  final AppRoute currentRoute;

  const AppScaffold({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  @override
  ConsumerState<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends ConsumerState<AppScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onRouteSelected(AppRoute route) {
    AppRouter.navigateToRoute(context, route);
    // Close drawer on mobile after navigation
    if (ResponsiveLayout.isMobile(context)) {
      _scaffoldKey.currentState?.closeDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final showPersistentSidebar = ResponsiveLayout.shouldShowPersistentSidebar(context);

    if (showPersistentSidebar) {
      // Tablet/Desktop: Persistent sidebar
      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppTheme.darkerBackground,
        body: Row(
          children: [
            AppSidebar(
              currentRoute: widget.currentRoute,
              onRouteSelected: _onRouteSelected,
            ),
            Expanded(
              child: widget.child,
            ),
          ],
        ),
      );
    } else {
      // Mobile: Drawer
      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppTheme.darkerBackground,
        drawer: Drawer(
          width: ResponsiveLayout.getSidebarWidth(context),
          backgroundColor: AppTheme.darkBackground,
          child: AppSidebar(
            currentRoute: widget.currentRoute,
            onRouteSelected: _onRouteSelected,
          ),
        ),
        body: widget.child,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
        ),
      );
    }
  }
}


