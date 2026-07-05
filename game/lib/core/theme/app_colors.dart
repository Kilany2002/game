import 'package:flutter/material.dart';

/// All color constants for the Bluff game design system.
/// Organized by semantic role, not by visual appearance.
abstract final class AppColors {
  // ─── Primary ───────────────────────────────────────────────────────────────
  static const Color primary = Color(0xFF006EE9);
  static const Color primaryDark = Color(0xFF0047B3);
  static const Color primaryLight = Color(0xFF4D9EFF);
  static const Color primarySurface = Color(0xFFE8F1FD);

  // ─── Secondary ─────────────────────────────────────────────────────────────
  static const Color secondary = Color(0xFFFFC801);
  static const Color secondaryDark = Color(0xFFCC9F00);
  static const Color secondaryLight = Color(0xFFFFD84D);
  static const Color secondarySurface = Color(0xFFFFF8E1);

  // ─── Background & Surface ──────────────────────────────────────────────────
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF8F9FA);
  static const Color surfaceVariant = Color(0xFFF1F3F5);
  static const Color surfaceContainer = Color(0xFFE9ECEF);

  // ─── Text ──────────────────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFF9CA3AF);
  static const Color textDisabled = Color(0xFFD1D5DB);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnSecondary = Color(0xFF1A1A2E);

  // ─── Status ────────────────────────────────────────────────────────────────
  static const Color error = Color(0xFFD32F2F);
  static const Color errorLight = Color(0xFFFFEBEE);
  static const Color errorDark = Color(0xFFB71C1C);

  static const Color success = Color(0xFF2E7D32);
  static const Color successLight = Color(0xFFE8F5E9);
  static const Color successDark = Color(0xFF1B5E20);

  static const Color warning = Color(0xFFF57C00);
  static const Color warningLight = Color(0xFFFFF3E0);

  static const Color info = Color(0xFF0288D1);
  static const Color infoLight = Color(0xFFE1F5FE);

  // ─── Border & Divider ──────────────────────────────────────────────────────
  static const Color divider = Color(0xFFE5E7EB);
  static const Color border = Color(0xFFD1D5DB);
  static const Color borderFocused = primary;

  // ─── Splash / Game Dark Theme ──────────────────────────────────────────────
  static const Color splashStart = Color(0xFF0A0E27);
  static const Color splashMid = Color(0xFF16213E);
  static const Color splashEnd = Color(0xFF0F3460);

  // ─── Overlay ───────────────────────────────────────────────────────────────
  static const Color overlay = Color(0x80000000);
  static const Color overlayLight = Color(0x33000000);
}
