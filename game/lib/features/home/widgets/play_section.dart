import 'package:flutter/material.dart';
import 'package:game/core/constants/app_strings.dart';
import 'package:game/core/router/app_router.dart';
import 'package:game/core/theme/app_colors.dart';
import 'package:game/core/theme/app_spacing.dart';
import 'package:game/core/theme/app_typography.dart';
import 'package:game/core/widgets/app_button.dart';
import 'package:go_router/go_router.dart';
class PlaySection extends StatelessWidget {
  const PlaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
Text(
  'ابدأ اللعب الآن',
  style: AppTypography.titleMedium.copyWith(
    color: AppColors.textSecondary,
    fontWeight: FontWeight.bold,
  ),
),
const SizedBox(height: AppSpacing.sm),

AppButton(
  label: AppStrings.createRoom,
  variant: AppButtonVariant.primary,
  size: AppButtonSize.lg,
  icon: Icons.add_circle_outline_rounded,
  onPressed: () => context.push(AppRoutes.createRoom),
),

const SizedBox(height: AppSpacing.md),

AppButton(
  label: AppStrings.joinRoom,
  variant: AppButtonVariant.secondary,
  size: AppButtonSize.lg,
  icon: Icons.group_add_outlined,
  onPressed: () => context.push(AppRoutes.joinRoom),
),      ],
    );
  }
}