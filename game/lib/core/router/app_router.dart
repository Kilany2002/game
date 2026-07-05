import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/providers/auth_provider.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/splash/screens/splash_screen.dart';

// ─── Route Path Constants ───────────────────────────────────────────────────
/// Single source of truth for all named route paths.
/// Import this class wherever you need to navigate.
abstract final class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String createRoom = '/create-room';
  static const String joinRoom = '/join-room';
  static const String waitingRoom = '/waiting-room';
  static const String preferredCategories = '/preferred-categories';
  static const String categorySelection = '/category-selection';
  static const String writingAnswer = '/writing-answer';
  static const String voting = '/voting';
  static const String reveal = '/reveal';
  static const String roundSummary = '/round-summary';
  static const String finalResult = '/final-result';
  static const String profile = '/profile';
  static const String settings = '/settings';
}

// ─── Router Refresh Listener ────────────────────────────────────────────────
/// A [ChangeNotifier] that listens to Riverpod's auth notifier changes
/// to trigger GoRouter state re-evaluation automatically.
class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    // Listen to changes in auth state and notify GoRouter listeners
    _ref.listen(authNotifierProvider, (_, __) => notifyListeners());
  }
}

final routerNotifierProvider = Provider((ref) => RouterNotifier(ref));

// ─── Router Provider ────────────────────────────────────────────────────────
/// Exposed as a Riverpod Provider so the main app can read routing state
/// dynamically and re-evaluate routes when auth state changes.
final appRouterProvider = Provider<GoRouter>((ref) {
  final refreshListenable = ref.watch(routerNotifierProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: false,
    refreshListenable: refreshListenable,
    redirect: (context, state) {
      final authState = ref.read(authNotifierProvider);
      final isAuthenticated = authState.maybeWhen(
        authenticated: (_) => true,
        orElse: () => false,
      );

      final isLoggingIn = state.matchedLocation == AppRoutes.login;
      final isSplash = state.matchedLocation == AppRoutes.splash;

      if (!isAuthenticated) {
        // If not logged in and not on Splash or Login, redirect to Login
        if (!isLoggingIn && !isSplash) {
          return AppRoutes.login;
        }
      } else {
        // If logged in and on Splash or Login, redirect to Home
        if (isLoggingIn || isSplash) {
          return AppRoutes.home;
        }
      }
      return null;
    },
    routes: [
      // ── Implemented ──────────────────────────────────────────────────────
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),

      // ── Placeholders — replaced in upcoming milestones ───────────────────
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.createRoom,
        builder: (_, __) =>
            const _PlaceholderScreen(title: 'إنشاء غرفة'),
      ),
      GoRoute(
        path: AppRoutes.joinRoom,
        builder: (_, __) =>
            const _PlaceholderScreen(title: 'الانضمام لغرفة'),
      ),
      GoRoute(
        path: AppRoutes.waitingRoom,
        builder: (_, __) =>
            const _PlaceholderScreen(title: 'غرفة الانتظار'),
      ),
      GoRoute(
        path: AppRoutes.preferredCategories,
        builder: (_, __) =>
            const _PlaceholderScreen(title: 'الفئات المفضلة'),
      ),
      GoRoute(
        path: AppRoutes.categorySelection,
        builder: (_, __) =>
            const _PlaceholderScreen(title: 'اختيار الفئة'),
      ),
      GoRoute(
        path: AppRoutes.writingAnswer,
        builder: (_, __) =>
            const _PlaceholderScreen(title: 'كتابة الإجابة'),
      ),
      GoRoute(
        path: AppRoutes.voting,
        builder: (_, __) => const _PlaceholderScreen(title: 'التصويت'),
      ),
      GoRoute(
        path: AppRoutes.reveal,
        builder: (_, __) =>
            const _PlaceholderScreen(title: 'الكشف عن الإجابات'),
      ),
      GoRoute(
        path: AppRoutes.roundSummary,
        builder: (_, __) =>
            const _PlaceholderScreen(title: 'ملخص الجولة'),
      ),
      GoRoute(
        path: AppRoutes.finalResult,
        builder: (_, __) =>
            const _PlaceholderScreen(title: 'النتيجة النهائية'),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (_, __) =>
            const _PlaceholderScreen(title: 'الملف الشخصي'),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (_, __) =>
            const _PlaceholderScreen(title: 'الإعدادات'),
      ),
    ],
  );
});

// ─── Placeholder Screen ──────────────────────────────────────────────────────
/// Temporary screen used for routes not yet implemented.
/// Will be deleted route-by-route as milestones progress.
class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.construction_rounded,
              size: 72,
              color: Color(0xFFFFC801),
            ),
            const SizedBox(height: 20),
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              'قيد الإنشاء',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
