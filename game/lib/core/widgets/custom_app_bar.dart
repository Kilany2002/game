import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// A pre-styled AppBar that integrates with GoRouter for back navigation.
///
/// Automatically handles RTL — the back arrow points to the right in Arabic.
/// Implements [PreferredSizeWidget] so it can be used as [Scaffold.appBar].
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.actions = const [],
    this.backgroundColor,
    this.foregroundColor,
    this.onBack,
    this.bottom,
    this.centerTitle = true,
  });

  final String title;
  final bool showBackButton;
  final List<Widget> actions;
  final Color? backgroundColor;
  final Color? foregroundColor;

  /// Custom back handler. If null, defaults to [context.pop()].
  final VoidCallback? onBack;

  final PreferredSizeWidget? bottom;
  final bool centerTitle;

  @override
  Size get preferredSize => Size.fromHeight(
        AppSpacing.appBarHeight + (bottom?.preferredSize.height ?? 0),
      );

  @override
  Widget build(BuildContext context) {
    final fgColor = foregroundColor ?? AppColors.textPrimary;

    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.background,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: centerTitle,
      title: Text(
        title,
        style: AppTypography.titleLarge.copyWith(color: fgColor),
      ),
      // Flutter automatically mirrors this icon in RTL
      leading: showBackButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: fgColor,
              ),
              onPressed: onBack ?? () => context.pop(),
              tooltip: 'رجوع',
            )
          : null,
      automaticallyImplyLeading: showBackButton,
      actions: actions,
      bottom: bottom,
    );
  }
}
