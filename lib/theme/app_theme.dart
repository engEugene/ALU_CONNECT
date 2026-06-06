import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {

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
      colorScheme: const ColorScheme(
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
         onSurface: AppColors.textPrimary,
         outline: AppColors.outline,
         outlineVariant: AppColors.divider,
       ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surfaceContainerHighest,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLg,
        headlineLarge: AppTextStyles.headingXl,
        headlineMedium: AppTextStyles.headingMd,
        bodyLarge: AppTextStyles.bodyLg,
        bodyMedium: AppTextStyles.bodyMd,
        labelLarge: AppTextStyles.labelLg,
        labelSmall: AppTextStyles.labelSm,
      ),
    );
  }
}
