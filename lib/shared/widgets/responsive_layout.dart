import 'package:flutter/material.dart';

class ResponsiveLayout {
  // Breakpoints
  static const double tabletBreakpoint = 768.0;
  static const double desktopBreakpoint = 1024.0;

  // Check if current screen is tablet or larger
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }

  // Check if current screen is desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopBreakpoint;
  }

  // Check if current screen is mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < tabletBreakpoint;
  }

  // Get responsive grid columns
  static int getGridColumns(BuildContext context, {
    int mobile = 2,
    int tablet = 3,
    int desktop = 4,
  }) {
    if (isDesktop(context)) return desktop;
    if (isTablet(context)) return tablet;
    return mobile;
  }

  // Get responsive padding
  static EdgeInsets getPadding(BuildContext context, {
    double mobile = 16.0,
    double tablet = 24.0,
    double desktop = 32.0,
  }) {
    if (isDesktop(context)) {
      return EdgeInsets.all(desktop);
    }
    if (isTablet(context)) {
      return EdgeInsets.all(tablet);
    }
    return EdgeInsets.all(mobile);
  }

  // Get responsive spacing
  static double getSpacing(BuildContext context, {
    double mobile = 8.0,
    double tablet = 12.0,
    double desktop = 16.0,
  }) {
    if (isDesktop(context)) return desktop;
    if (isTablet(context)) return tablet;
    return mobile;
  }

  // Sidebar width
  static double getSidebarWidth(BuildContext context) {
    if (isDesktop(context)) return 280;
    if (isTablet(context)) return 240;
    return 200;
  }

  // Should show persistent sidebar
  static bool shouldShowPersistentSidebar(BuildContext context) {
    return isTablet(context);
  }
}


