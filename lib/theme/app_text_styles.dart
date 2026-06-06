import 'package:flutter/material.dart';
import 'app_colors.dart';

/// ALU Connect text styles — semantic naming based on usage.
/// 
/// All styles default to [AppColors.textPrimary].
/// Use `.copyWith(color: ...)` to override for secondary/tertiary text.
class AppTextStyles {
  AppTextStyles._();

  // ── Display (Extra large headings) ─────────────────────
  static TextStyle get displayLg => const TextStyle(
    fontFamily: 'Inter',
    fontSize: 48,
    fontWeight: FontWeight.w800,
    height: 56 / 48,
    letterSpacing: -0.02,
    color: AppColors.textPrimary,
  );

  static TextStyle get displaySm => const TextStyle(
    fontFamily: 'Inter',
    fontSize: 36,
    fontWeight: FontWeight.w800,
    height: 44 / 36,
    letterSpacing: -0.02,
    color: AppColors.textPrimary,
  );

  // ── Headings (Large page titles) ───────────────────────
  static TextStyle get headingXl => const TextStyle(
    fontFamily: 'Inter',
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 40 / 32,
    letterSpacing: -0.01,
    color: AppColors.textPrimary,
  );

  static TextStyle get headingLg => const TextStyle(
    fontFamily: 'Inter',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 32 / 24,
    letterSpacing: -0.01,
    color: AppColors.textPrimary,
  );

  static TextStyle get headingMd => const TextStyle(
    fontFamily: 'Inter',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 32 / 24,
    color: AppColors.textPrimary,
  );

  // ── Body (Regular text content) ────────────────────────
  static TextStyle get bodyLg => const TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 28 / 18,
    color: AppColors.textPrimary,
  );

  static TextStyle get bodyMd => const TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    color: AppColors.textPrimary,
  );

  // ── Labels & Buttons (Small text) ──────────────────────
  static TextStyle get labelLg => const TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0.01,
    color: AppColors.textPrimary,
  );

  static TextStyle get labelMd => const TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
    letterSpacing: 0.02,
    color: AppColors.textPrimary,
  );

  static TextStyle get labelSm => const TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
    letterSpacing: 0.02,
    color: AppColors.textPrimary,
  );

  // ── Caption (Extra small text) ─────────────────────────
  static TextStyle get caption => const TextStyle(
    fontFamily: 'Inter',
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: AppColors.textTertiary,
  );
}
