import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography definitions using the Cairo font family.
///
/// All styles define ONLY size, weight, and line-height.
/// Colors are applied at the theme or widget level, never here.
abstract final class AppTypography {
  // ─── Private factory ───────────────────────────────────────────────────────
  static TextStyle _t({
    required double size,
    required FontWeight weight,
    double height = 1.5,
    double? letterSpacing,
  }) =>
      GoogleFonts.cairo(
        fontSize: size,
        fontWeight: weight,
        height: height,
        letterSpacing: letterSpacing,
      );

  // ─── Display ───────────────────────────────────────────────────────────────
  /// Used for hero titles (e.g. splash screen, winner banner).
  static TextStyle get displayLarge =>
      _t(size: 48, weight: FontWeight.w900, height: 1.1);

  /// Used for screen-level headings.
  static TextStyle get displayMedium =>
      _t(size: 36, weight: FontWeight.w800, height: 1.2);

  // ─── Headline ──────────────────────────────────────────────────────────────
  static TextStyle get headlineLarge =>
      _t(size: 28, weight: FontWeight.w700, height: 1.3);

  static TextStyle get headlineMedium =>
      _t(size: 24, weight: FontWeight.w700, height: 1.3);

  static TextStyle get headlineSmall =>
      _t(size: 20, weight: FontWeight.w600, height: 1.4);

  // ─── Title ─────────────────────────────────────────────────────────────────
  static TextStyle get titleLarge =>
      _t(size: 18, weight: FontWeight.w600, height: 1.4);

  static TextStyle get titleMedium =>
      _t(size: 16, weight: FontWeight.w600, height: 1.5);

  static TextStyle get titleSmall =>
      _t(size: 14, weight: FontWeight.w600, height: 1.5);

  // ─── Body ──────────────────────────────────────────────────────────────────
  static TextStyle get bodyLarge =>
      _t(size: 16, weight: FontWeight.w400, height: 1.6);

  static TextStyle get bodyMedium =>
      _t(size: 14, weight: FontWeight.w400, height: 1.6);

  static TextStyle get bodySmall =>
      _t(size: 12, weight: FontWeight.w400, height: 1.6);

  // ─── Label ─────────────────────────────────────────────────────────────────
  static TextStyle get labelLarge =>
      _t(size: 14, weight: FontWeight.w500, height: 1.4);

  static TextStyle get labelMedium =>
      _t(size: 12, weight: FontWeight.w500, height: 1.4);

  static TextStyle get labelSmall =>
      _t(size: 10, weight: FontWeight.w500, height: 1.4, letterSpacing: 0.5);

  // ─── Special ───────────────────────────────────────────────────────────────
  /// Used on buttons.
  static TextStyle get button =>
      _t(size: 16, weight: FontWeight.w700, height: 1.2);

  /// Used for room codes and numeric displays.
  static TextStyle get mono =>
      _t(size: 24, weight: FontWeight.w800, height: 1.2, letterSpacing: 4);
}
