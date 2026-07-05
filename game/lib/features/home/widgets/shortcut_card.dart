import 'package:flutter/material.dart';
import 'package:game/core/theme/app_colors.dart';
import 'package:game/core/theme/app_spacing.dart';
import 'package:game/core/theme/app_typography.dart';
import 'package:game/core/widgets/app_card.dart';

class ShortcutCard extends StatelessWidget {
    const ShortcutCard({
      required this.icon,
      required this.title,
      required this.color,
      required this.onTap,
    });

    final IconData icon;
    final String title;
    final Color color;
    final VoidCallback onTap;

    @override
    Widget build(BuildContext context) {
      return AppCard(
        onTap: onTap,
        child: Column(
          children: [
            Icon(icon, size: 36, color: color),
            const SizedBox(height: AppSpacing.sm),
            Text(
              title,
              style: AppTypography.titleSmall.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
  }
