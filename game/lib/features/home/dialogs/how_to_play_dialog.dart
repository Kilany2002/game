

import 'package:flutter/material.dart';
import 'package:game/core/constants/app_strings.dart';
import 'package:game/core/theme/app_colors.dart';
import 'package:game/core/theme/app_spacing.dart';
import 'package:game/core/theme/app_typography.dart';

void showHowToPlayDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text(
            AppStrings.howToPlay,
            textAlign: TextAlign.center,
          ),
          content: const SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _RuleStep(
                  number: '١',
                  text: 'اجمع الأصدقاء في غرفة (٢ إلى ٥ لاعبين).',
                ),
                _RuleStep(
                  number: '٢',
                  text: 'يقوم صاحب الدور باختيار فئة الأسئلة المفضلة.',
                ),
                _RuleStep(
                  number: '٣',
                  text: 'اكتب إجابة وهمية تبدو صحيحة لتخدع اللاعبين الآخرين.',
                ),
                _RuleStep(
                  number: '٤',
                  text: 'صوّت على الإجابة التي تعتقد أنها صحيحة.',
                ),
                _RuleStep(
                  number: '٥',
                  text: 'تكسب نقاطاً عند معرفة الصح وعندما يختار الآخرون إجابتك!',
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text(AppStrings.ok),
              ),
            ),
          ],
        ),
      );
    }
  
class _RuleStep extends StatelessWidget {
    const _RuleStep({required this.number, required this.text});

    final String number;
    final String text;

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primarySurface,
              ),
              child: Center(
                child: Text(
                  number,
                  style: AppTypography.titleSmall.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                text,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
