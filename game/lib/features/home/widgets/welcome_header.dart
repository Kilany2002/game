import 'package:flutter/material.dart';
import 'package:game/core/constants/app_strings.dart';
import 'package:game/core/theme/app_colors.dart';
import 'package:game/core/theme/app_radius.dart';
import 'package:game/core/theme/app_spacing.dart';
import 'package:game/core/theme/app_typography.dart';

class WelcomeHeader extends StatelessWidget {
  final String username;
  const WelcomeHeader({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
 Text(
  '${AppStrings.greeting}، $username! 👋',
  style: AppTypography.headlineSmall.copyWith(
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
  ),
),
                  const SizedBox(height: AppSpacing.md),
              ],
            ),
          );
  }
}
