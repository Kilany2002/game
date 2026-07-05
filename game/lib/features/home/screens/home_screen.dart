import 'package:flutter/material.dart';
import 'package:game/core/theme/app_spacing.dart';
import 'package:game/features/home/widgets/home_app_bar.dart';
import 'package:game/features/home/widgets/play_section.dart';
import 'package:game/features/home/widgets/profile_section.dart';
import 'package:game/features/home/widgets/shortcut_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenPadding,
            vertical: AppSpacing.md,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileSection(),

              SizedBox(height: AppSpacing.xl),

              PlaySection(),

              SizedBox(height: AppSpacing.xl),

              ShortcutSection(),
            ],
          ),
        ),
      ),
    );
  }
}