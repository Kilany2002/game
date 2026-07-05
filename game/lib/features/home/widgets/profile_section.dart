import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game/core/constants/app_strings.dart';
import 'package:game/core/theme/app_colors.dart';
import 'package:game/core/theme/app_spacing.dart';
import 'package:game/core/widgets/app_loading.dart';
import 'package:game/features/home/widgets/profile_stats_card.dart';
import 'package:game/features/home/widgets/welcome_header.dart';
import 'package:game/features/profile/providers/profile_provider.dart';

class ProfileSection extends ConsumerWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(userProfileProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        profileAsync.maybeWhen(
          data: (profile) => WelcomeHeader(
            username: profile.username,
          ),
          orElse: () => const SizedBox(),
        ),

        const SizedBox(height: AppSpacing.md),

        profileAsync.when(
          data: (profile) => ProfileStatsCard(
            profile: profile,
          ),
          loading: () => const SizedBox(
            height: 160,
            child: AppLoading(
              message: AppStrings.loading,
            ),
          ),
          error: (err, stack) => const SizedBox(
            height: 160,
            child: Center(
              child: Text(
                'فشل تحميل الملف الشخصي',
                style: TextStyle(
                  color: AppColors.error,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}