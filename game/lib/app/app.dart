import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/router/app_router.dart';
import '../core/theme/app_theme.dart';

/// Root widget of the application.
///
/// Responsibilities:
/// - Configures MaterialApp with theme and routing.
/// - Sets locale to Arabic (ar) for RTL layout.
/// - Reads the router from Riverpod (allows auth-based redirects later).
class BluffApp extends ConsumerWidget {
  const BluffApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'بلف',
      debugShowCheckedModeBanner: false,

      // ── Theme ──────────────────────────────────────────────────────────────
      theme: AppTheme.light,
      themeMode: ThemeMode.light,

      // ── Localization & RTL ─────────────────────────────────────────────────
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // ── Routing ────────────────────────────────────────────────────────────
      routerConfig: router,
    );
  }
}
