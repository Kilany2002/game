import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// Centered loading indicator with an optional message.
///
/// Set [isFullScreen] to true to wrap the indicator in a [Scaffold].
class AppLoading extends StatelessWidget {
  const AppLoading({
    super.key,
    this.message,
    this.isFullScreen = false,
    this.color,
  });

  final String? message;
  final bool isFullScreen;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final indicator = _LoadingContent(message: message, color: color);

    if (isFullScreen) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(child: indicator),
      );
    }

    return Center(child: indicator);
  }
}

class _LoadingContent extends StatelessWidget {
  const _LoadingContent({this.message, this.color});

  final String? message;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(
              color ?? AppColors.primary,
            ),
          ),
        ),
        if (message != null) ...[
          const SizedBox(height: AppSpacing.md),
          Text(
            message!,
            style: AppTypography.bodyMedium
                .copyWith(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
