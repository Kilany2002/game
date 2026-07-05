import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

// ─── Enums ───────────────────────────────────────────────────────────────────

enum AppButtonVariant { primary, secondary, outlined, ghost, danger }

enum AppButtonSize { sm, md, lg }

// ─── AppButton ───────────────────────────────────────────────────────────────

/// The primary button component for the Bluff design system.
///
/// Supports 5 visual variants and 3 sizes.
/// Handles loading state, disabled state, and optional leading icon.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.md,
    this.isLoading = false,
    this.isFullWidth = true,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? icon;

  // ── Computed sizes ──────────────────────────────────────────────────────────

  double get _height => switch (size) {
        AppButtonSize.sm => AppSpacing.buttonHeightSm,
        AppButtonSize.md => AppSpacing.buttonHeightMd,
        AppButtonSize.lg => AppSpacing.buttonHeightLg,
      };

  double get _fontSize => switch (size) {
        AppButtonSize.sm => 14.0,
        AppButtonSize.md => 16.0,
        AppButtonSize.lg => 18.0,
      };

  bool get _isDisabled => onPressed == null || isLoading;

  // ── Build ───────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isDisabled ? 0.55 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: SizedBox(
        height: _height,
        width: isFullWidth ? double.infinity : null,
        child: _buildVariant(),
      ),
    );
  }

  Widget _buildVariant() => switch (variant) {
        AppButtonVariant.primary => _PrimaryButton(
            label: label,
            onPressed: _isDisabled ? null : onPressed,
            isLoading: isLoading,
            icon: icon,
            fontSize: _fontSize,
          ),
        AppButtonVariant.secondary => _SecondaryButton(
            label: label,
            onPressed: _isDisabled ? null : onPressed,
            isLoading: isLoading,
            icon: icon,
            fontSize: _fontSize,
          ),
        AppButtonVariant.outlined => _OutlinedButton(
            label: label,
            onPressed: _isDisabled ? null : onPressed,
            isLoading: isLoading,
            icon: icon,
            fontSize: _fontSize,
          ),
        AppButtonVariant.ghost => _GhostButton(
            label: label,
            onPressed: _isDisabled ? null : onPressed,
            isLoading: isLoading,
            icon: icon,
            fontSize: _fontSize,
          ),
        AppButtonVariant.danger => _DangerButton(
            label: label,
            onPressed: _isDisabled ? null : onPressed,
            isLoading: isLoading,
            icon: icon,
            fontSize: _fontSize,
          ),
      };
}

// ─── Private variant widgets ──────────────────────────────────────────────────

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({
    required this.label,
    required this.onPressed,
    required this.isLoading,
    required this.fontSize,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double fontSize;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E9AFF), AppColors.primary, Color(0xFF0047B3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppRadius.buttonRadius,
        boxShadow: onPressed != null
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: _InkButton(
        onPressed: onPressed,
        borderRadius: AppRadius.buttonRadius,
        child: _ButtonContent(
          label: label,
          isLoading: isLoading,
          icon: icon,
          fontSize: fontSize,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  const _SecondaryButton({
    required this.label,
    required this.onPressed,
    required this.isLoading,
    required this.fontSize,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double fontSize;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: AppRadius.buttonRadius,
        boxShadow: onPressed != null
            ? [
                BoxShadow(
                  color: AppColors.secondary.withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: _InkButton(
        onPressed: onPressed,
        borderRadius: AppRadius.buttonRadius,
        child: _ButtonContent(
          label: label,
          isLoading: isLoading,
          icon: icon,
          fontSize: fontSize,
          color: AppColors.textOnSecondary,
        ),
      ),
    );
  }
}

class _OutlinedButton extends StatelessWidget {
  const _OutlinedButton({
    required this.label,
    required this.onPressed,
    required this.isLoading,
    required this.fontSize,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double fontSize;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 2),
        borderRadius: AppRadius.buttonRadius,
      ),
      child: _InkButton(
        onPressed: onPressed,
        borderRadius: AppRadius.buttonRadius,
        child: _ButtonContent(
          label: label,
          isLoading: isLoading,
          icon: icon,
          fontSize: fontSize,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class _GhostButton extends StatelessWidget {
  const _GhostButton({
    required this.label,
    required this.onPressed,
    required this.isLoading,
    required this.fontSize,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double fontSize;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return _InkButton(
      onPressed: onPressed,
      borderRadius: AppRadius.buttonRadius,
      child: _ButtonContent(
        label: label,
        isLoading: isLoading,
        icon: icon,
        fontSize: fontSize,
        color: AppColors.primary,
      ),
    );
  }
}

class _DangerButton extends StatelessWidget {
  const _DangerButton({
    required this.label,
    required this.onPressed,
    required this.isLoading,
    required this.fontSize,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double fontSize;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.error,
        borderRadius: AppRadius.buttonRadius,
        boxShadow: onPressed != null
            ? [
                BoxShadow(
                  color: AppColors.error.withOpacity(0.35),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: _InkButton(
        onPressed: onPressed,
        borderRadius: AppRadius.buttonRadius,
        child: _ButtonContent(
          label: label,
          isLoading: isLoading,
          icon: icon,
          fontSize: fontSize,
          color: Colors.white,
        ),
      ),
    );
  }
}

// ─── Shared sub-widgets ───────────────────────────────────────────────────────

class _InkButton extends StatelessWidget {
  const _InkButton({
    required this.child,
    required this.onPressed,
    required this.borderRadius,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius,
        child: Center(child: child),
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.label,
    required this.isLoading,
    required this.fontSize,
    required this.color,
    this.icon,
  });

  final String label;
  final bool isLoading;
  final double fontSize;
  final Color color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, size: fontSize + 4, color: color),
          const SizedBox(width: AppSpacing.sm),
        ],
        Text(
          label,
          style: AppTypography.button.copyWith(
            fontSize: fontSize,
            color: color,
          ),
        ),
      ],
    );
  }
}
