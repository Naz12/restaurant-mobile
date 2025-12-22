import 'package:flutter/material.dart';

class AppTheme {
  // Color Palette (matching web version)
  static const Color primaryPurple = Color(0xFF9333EA); // Purple accent
  static const Color darkBackground = Color(0xFF1F2937); // Dark grey background
  static const Color darkerBackground = Color(0xFF111827); // Darker background
  static const Color cardBackground = Color(0xFF374151); // Card background
  static const Color textPrimary = Color(0xFFF9FAFB); // Light text
  static const Color textSecondary = Color(0xFFD1D5DB); // Secondary text
  static const Color successGreen = Color(0xFF10B981); // PAID status
  static const Color infoBlue = Color(0xFF3B82F6); // BILLED status
  static const Color warningYellow = Color(0xFFF59E0B);
  static const Color errorRed = Color(0xFFEF4444);
  static const Color pendingRed = Color(0xFFDC2626); // PENDING CONFIRMATION

  // Status Colors
  static const Color paidStatus = successGreen;
  static const Color billedStatus = infoBlue;
  static const Color kotStatus = primaryPurple;
  static const Color pendingStatus = pendingRed;
  static const Color inKitchenStatus = Color(0xFF8B5CF6);
  static const Color foodReadyStatus = Color(0xFF06B6D4);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryPurple,
      scaffoldBackgroundColor: darkerBackground,
      colorScheme: ColorScheme.dark(
        primary: primaryPurple,
        secondary: primaryPurple,
        surface: cardBackground,
        background: darkerBackground,
        error: errorRed,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textPrimary,
        onBackground: textPrimary,
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkBackground,
        foregroundColor: textPrimary,
        elevation: 0,
      ),
      cardTheme: CardTheme(
        color: cardBackground,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF4B5563)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF4B5563)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryPurple, width: 2),
        ),
        labelStyle: const TextStyle(color: textSecondary),
        hintStyle: const TextStyle(color: textSecondary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPurple,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: textPrimary, fontSize: 32, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(color: textPrimary, fontSize: 28, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(color: textPrimary, fontSize: 24, fontWeight: FontWeight.bold),
        headlineLarge: TextStyle(color: textPrimary, fontSize: 22, fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(color: textPrimary, fontSize: 20, fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(color: textPrimary, fontSize: 18, fontWeight: FontWeight.w600),
        titleLarge: TextStyle(color: textPrimary, fontSize: 16, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(color: textPrimary, fontSize: 14, fontWeight: FontWeight.w600),
        titleSmall: TextStyle(color: textPrimary, fontSize: 12, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: textPrimary, fontSize: 16),
        bodyMedium: TextStyle(color: textPrimary, fontSize: 14),
        bodySmall: TextStyle(color: textSecondary, fontSize: 12),
        labelLarge: TextStyle(color: textPrimary, fontSize: 14, fontWeight: FontWeight.w500),
        labelMedium: TextStyle(color: textSecondary, fontSize: 12, fontWeight: FontWeight.w500),
        labelSmall: TextStyle(color: textSecondary, fontSize: 10, fontWeight: FontWeight.w500),
      ),
    );
  }

  // Status Badge Colors
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return paidStatus;
      case 'billed':
        return billedStatus;
      case 'kot':
        return kotStatus;
      case 'pending':
      case 'pending_confirmation':
        return pendingStatus;
      case 'in_kitchen':
        return inKitchenStatus;
      case 'food_ready':
      case 'ready':
        return foodReadyStatus;
      case 'cancelled':
      case 'canceled':
        return errorRed;
      default:
        return textSecondary;
    }
  }
}


