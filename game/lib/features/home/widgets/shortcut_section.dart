import 'package:flutter/material.dart';
import 'package:game/core/constants/app_strings.dart';
import 'package:game/core/router/app_router.dart';
import 'package:game/core/theme/app_spacing.dart';
import 'package:game/features/home/dialogs/how_to_play_dialog.dart';
import 'package:game/features/home/widgets/shortcut_card.dart';
import 'package:go_router/go_router.dart';

class ShortcutSection extends StatelessWidget {
  const ShortcutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ShortcutCard(
            icon: Icons.emoji_events_outlined,
            title: AppStrings.leaderboard,
            color: Colors.amber.shade700,
            onTap: () => context.push(AppRoutes.profile), 
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: ShortcutCard(
              icon: Icons.help_outline_rounded,
                          title: AppStrings.howToPlay,
                          color: Colors.blue.shade700,
                          onTap: () => showHowToPlayDialog(context),
                        ),
                      ),
                    ],
    );
  }
}