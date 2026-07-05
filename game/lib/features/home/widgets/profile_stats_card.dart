import 'package:flutter/material.dart';
import 'package:game/core/constants/app_strings.dart';
import 'package:game/core/theme/app_colors.dart';
import 'package:game/core/theme/app_spacing.dart';
import 'package:game/core/theme/app_typography.dart';
import 'package:game/core/widgets/app_card.dart';
import 'package:game/features/profile/models/profile_model.dart';

class ProfileStatsCard extends StatelessWidget {
    const ProfileStatsCard({required this.profile});

    final ProfileModel profile;

    @override
    Widget build(BuildContext context) {
      return AppCard(
        backgroundColor: AppColors.primary,
        borderColor: Colors.transparent,
        showBorder: false,
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Avatar Circle
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Text(
                      profile.username.isNotEmpty ? profile.username[0] : '؟',
                      style: AppTypography.headlineSmall.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.username,
                        style: AppTypography.titleLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'رتبة لاعب محترف',
                        style: AppTypography.bodySmall.copyWith(
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            const Divider(color: Colors.white24),
            const SizedBox(height: AppSpacing.md),

            // Stat Figures row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatItem(
                  label: AppStrings.gamesPlayed,
                  value: '${profile.gamesPlayed}',
                ),
                _StatItem(
                  label: AppStrings.totalWins,
                  value: '${profile.wins}',
                ),
                _StatItem(
                  label: AppStrings.totalPoints,
                  value: '${profile.totalPoints}',
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
 class _StatItem extends StatelessWidget {
    const _StatItem({required this.label, required this.value});

    final String label;
    final String value;

    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          Text(
            value,
            style: AppTypography.headlineMedium.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            label,
            style: AppTypography.bodySmall.copyWith(
              color: Colors.white.withOpacity(0.75),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }
  }

 