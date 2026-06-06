import 'package:flutter/material.dart';

/// ALU Connect color palette — dark theme only.
/// 
/// Text colors use semantic naming:
/// - textPrimary: Main text (headings, body, labels)
/// - textSecondary: Supporting text (subtitles, hints)
/// - textTertiary: Disabled/muted text
class AppColors {
  AppColors._();

  // ── Brand Colors ────────────────────────────
  static const Color primary = Color(0xFFffb3b3); // Pink
  static const Color secondary = Color(0xFFafc8f0); // Blue
  static const Color tertiary = Color(0xFFacc7ff); // Light blue

  // ── Surfaces ────────────────────────────────
  static const Color background = Color(0xFF0b1326);
  static const Color surface = Color(0xFF0b1326);
  static const Color surfaceContainer = Color(0xFF171f33);
  static const Color surfaceContainerHigh = Color(0xFF222a3d);
  static const Color surfaceContainerHighest = Color(0xFF2d3449);

  // ── Text Hierarchy ──────────────────────────
  static const Color textPrimary = Color(0xFFdae2fd); // Light blue - main text
  static const Color textSecondary = Color(0xFFe6bdbc); // Light beige - supporting text
  static const Color textTertiary = Color(0xFFac8888); // Muted brown - disabled text

  // ── Semantic Colors ─────────────────────────
  static const Color error = Color(0xFFffb4ab);
  static const Color success = Color(0xFF18D26E);
  static const Color warning = Color(0xFFF59E0B);

  // ── Borders & Dividers ──────────────────────
  static const Color divider = Color(0xFF5c3f3f);
  static const Color outline = Color(0xFFac8888);

  // ── Legacy Material3 mappings (for theme) ───
  static const Color onPrimary = Color(0xFF680015);
  static const Color primaryContainer = Color(0xFFdc143c);
  static const Color onPrimaryContainer = Color(0xFFfff1f0);
  static const Color onSecondary = Color(0xFF163152);
  static const Color secondaryContainer = Color(0xFF2f486a);
  static const Color onSecondaryContainer = Color(0xFF9eb7de);
  static const Color onTertiary = Color(0xFF002f67);
  static const Color tertiaryContainer = Color(0xFF2f6ecc);
  static const Color onTertiaryContainer = Color(0xFFf3f4ff);
  static const Color onError = Color(0xFF690005);
  static const Color errorContainer = Color(0xFF93000a);
  static const Color onErrorContainer = Color(0xFFffdad6);
}
