import 'package:flutter/material.dart';

/// Border radius constants for the Bluff game design system.
abstract final class AppRadius {
  // ─── Raw Values ────────────────────────────────────────────────────────────
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;
  static const double full = 100.0;

  // ─── BorderRadius Shortcuts ────────────────────────────────────────────────
  static BorderRadius get cardRadius => BorderRadius.circular(lg);
  static BorderRadius get buttonRadius => BorderRadius.circular(lg);
  static BorderRadius get inputRadius => BorderRadius.circular(md);
  static BorderRadius get chipRadius => BorderRadius.circular(full);
  static BorderRadius get dialogRadius => BorderRadius.circular(xl);
  static BorderRadius get bottomSheetRadius => const BorderRadius.vertical(
        top: Radius.circular(xl),
      );
}
