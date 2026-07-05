/// Spacing constants for the Bluff game design system.
/// Based on a 4px base unit grid for consistent layout.
abstract final class AppSpacing {
  // ─── Base Grid ─────────────────────────────────────────────────────────────
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;

  // ─── Semantic Sizes ────────────────────────────────────────────────────────
  /// Standard horizontal padding applied to all screens.
  static const double screenPadding = 20.0;

  /// Default inner padding for cards and containers.
  static const double cardPadding = 16.0;

  // ─── Component Heights ─────────────────────────────────────────────────────
  static const double buttonHeightSm = 40.0;
  static const double buttonHeightMd = 52.0;
  static const double buttonHeightLg = 60.0;

  static const double inputHeight = 52.0;
  static const double appBarHeight = 60.0;
  static const double bottomNavHeight = 72.0;

  /// Standard icon size.
  static const double iconSm = 18.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
}
