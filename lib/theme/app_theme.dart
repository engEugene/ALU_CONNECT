import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  // Text Styles
  static const TextStyle displayLarge = TextStyle(
    fontFamily: 'Inter',
    fontSize: 48,
    fontWeight: FontWeight.w800,
    height: 56 / 48,
    letterSpacing: -0.02,
  );

  static const TextStyle displayLargeMobile = TextStyle(
    fontFamily: 'Inter',
    fontSize: 36,
    fontWeight: FontWeight.w800,
    height: 44 / 36,
    letterSpacing: -0.02,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: 'Inter',
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 40 / 32,
    letterSpacing: -0.01,
  );

  static const TextStyle headlineLargeMobile = TextStyle(
    fontFamily: 'Inter',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 32 / 24,
    letterSpacing: -0.01,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: 'Inter',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 32 / 24,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 28 / 18,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0.01,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
    letterSpacing: 0.02,
  );

  // Spacing constants
  static const double spacingXs = 4;
  static const double spacingBase = 8;
  static const double spacingSm = 8;
  static const double spacingMd = 16;
  static const double spacingLg = 24;
  static const double spacingXl = 32;
  static const double gutterMobile = 16;
  static const double gutterDesktop = 24;
  static const double marginMobile = 16;

  // Border radius constants
  static const double radiusSm = 0.5 * 16; // 8px (0.5rem * 16)
  static const double radiusDefault = 1 * 16; // 16px
  static const double radiusMd = 1.5 * 16; // 24px
  static const double radiusLg = 2 * 16; // 32px
  static const double radiusXl = 3 * 16; // 48px
  static const double radiusFull = 9999;

  // Theme Data - Dark theme only
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
         brightness: Brightness.dark,
         primary: AppColors.primary,
         onPrimary: AppColors.onPrimary,
         primaryContainer: AppColors.primaryContainer,
         onPrimaryContainer: AppColors.onPrimaryContainer,
         secondary: AppColors.secondary,
         onSecondary: AppColors.onSecondary,
         secondaryContainer: AppColors.secondaryContainer,
         onSecondaryContainer: AppColors.onSecondaryContainer,
         tertiary: AppColors.tertiary,
         onTertiary: AppColors.onTertiary,
         tertiaryContainer: AppColors.tertiaryContainer,
         onTertiaryContainer: AppColors.onTertiaryContainer,
         error: AppColors.error,
         onError: AppColors.onError,
         errorContainer: AppColors.errorContainer,
         onErrorContainer: AppColors.onErrorContainer,
         surface: AppColors.surface,
         onSurface: AppColors.onSurface,
         outline: AppColors.outline,
         outlineVariant: AppColors.outlineVariant,
       ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surfaceContainerHighest,
        foregroundColor: AppColors.onSurface,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        displayLarge: displayLarge,
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        labelLarge: labelLarge,
        labelSmall: labelSmall,
      ),
    );
  }
}
