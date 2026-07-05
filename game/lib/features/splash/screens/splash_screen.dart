import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

/// The first screen users see when opening the app.
///
/// Responsibilities:
/// - Plays a 3-stage entrance animation (logo → name → tagline).
/// - Shows animated loading dots at the bottom.
/// - Auto-navigates to Login after 2.8 seconds.
///
/// In Milestone 2, this screen will check auth state and redirect
/// to Home if a session already exists.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  // ── Animation Controllers ──────────────────────────────────────────────────

  late final AnimationController _logoCtrl;
  late final AnimationController _textCtrl;
  late final AnimationController _dotsCtrl;

  // ── Animations ────────────────────────────────────────────────────────────

  late final Animation<double> _logoScale;
  late final Animation<double> _logoFade;
  late final Animation<Offset> _textSlide;
  late final Animation<double> _textFade;
  late final Animation<double> _taglineFade;

  // ── Lifecycle ─────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _scheduleNavigation();
  }

  void _initAnimations() {
    // Logo: elastic scale-in + fade-in
    _logoCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    // App name + tagline: slide-up + fade-in
    _textCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    // Dots: continuous loop
    _dotsCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();

    _logoScale = Tween<double>(begin: 0.25, end: 1.0).animate(
      CurvedAnimation(parent: _logoCtrl, curve: Curves.elasticOut),
    );
    _logoFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoCtrl,
        curve: const Interval(0.0, 0.35, curve: Curves.easeIn),
      ),
    );
    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.6),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _textCtrl, curve: Curves.easeOutCubic),
    );
    _textFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textCtrl, curve: Curves.easeIn),
    );
    _taglineFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textCtrl,
        curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
      ),
    );

    // Chain: logo finishes → then text slides in
    _logoCtrl.forward().then((_) {
      if (mounted) _textCtrl.forward();
    });
  }

  void _scheduleNavigation() {
    Future.delayed(const Duration(milliseconds: 2800), () {
      if (mounted) context.go(AppRoutes.login);
    });
  }

  @override
  void dispose() {
    _logoCtrl.dispose();
    _textCtrl.dispose();
    _dotsCtrl.dispose();
    super.dispose();
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.splashStart,
              AppColors.splashMid,
              AppColors.splashEnd,
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Layer 1: Decorative background blobs
            _BackgroundDecoration(),
            // Layer 2: Main content
            SafeArea(
              child: Column(
                children: [
                  const Spacer(flex: 3),
                  _buildLogo(),
                  const SizedBox(height: 40),
                  _buildText(),
                  const Spacer(flex: 4),
                  _buildDots(),
                  const SizedBox(height: 56),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Logo ──────────────────────────────────────────────────────────────────

  Widget _buildLogo() {
    return ScaleTransition(
      scale: _logoScale,
      child: FadeTransition(
        opacity: _logoFade,
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1E9AFF),
                AppColors.primary,
                Color(0xFF0047B3),
              ],
            ),
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.65),
                blurRadius: 35,
                spreadRadius: 4,
              ),
              BoxShadow(
                color: AppColors.primary.withOpacity(0.2),
                blurRadius: 70,
                spreadRadius: 20,
              ),
            ],
          ),
          child: Center(
            child: Text(
              '؟', // Arabic question mark — on-brand for a trivia game
              style: AppTypography.displayLarge.copyWith(
                fontSize: 64,
                color: Colors.white,
                height: 1.1,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── App name & tagline ────────────────────────────────────────────────────

  Widget _buildText() {
    return Column(
      children: [
        // App name with slide + fade
        SlideTransition(
          position: _textSlide,
          child: FadeTransition(
            opacity: _textFade,
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Colors.white, Color(0xFFCCDDFF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds),
              child: Text(
                AppStrings.appName,
                style: AppTypography.displayLarge.copyWith(
                  color: Colors.white,
                  letterSpacing: 6,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),
        // Tagline with delayed fade
        FadeTransition(
          opacity: _taglineFade,
          child: Text(
            AppStrings.appTagline,
            style: AppTypography.bodyMedium.copyWith(
              color: Colors.white.withOpacity(0.5),
              letterSpacing: 2.5,
            ),
          ),
        ),
      ],
    );
  }

  // ── Animated dots ─────────────────────────────────────────────────────────

  Widget _buildDots() {
    return AnimatedBuilder(
      animation: _dotsCtrl,
      builder: (context, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (i) {
            // Offset each dot's animation phase by 1/3
            final phase = (i / 3);
            final t = (_dotsCtrl.value - phase + 1) % 1;
            final normalized = t < 0.5 ? t * 2 : (1 - t) * 2;
            final scale = Curves.easeInOut.transform(normalized);

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.secondary.withOpacity(0.35 + scale * 0.65),
                boxShadow: scale > 0.6
                    ? [
                        BoxShadow(
                          color: AppColors.secondary.withOpacity(0.6),
                          blurRadius: 8,
                        ),
                      ]
                    : null,
              ),
              transform: Matrix4.identity()
                ..scale(0.55 + scale * 0.65, 0.55 + scale * 0.65),
              transformAlignment: Alignment.center,
            );
          }),
        );
      },
    );
  }
}

// ─── Background Decoration ───────────────────────────────────────────────────

/// Static decorative circles that add depth to the splash background.
class _BackgroundDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top-right large glow
        Positioned(
          top: -70,
          right: -70,
          child: _Blob(
            size: 260,
            color: AppColors.primary.withOpacity(0.09),
          ),
        ),
        // Bottom-left large glow
        Positioned(
          bottom: 60,
          left: -90,
          child: _Blob(
            size: 300,
            color: AppColors.secondary.withOpacity(0.06),
          ),
        ),
        // Middle-left small accent
        Positioned(
          top: 220,
          left: 28,
          child: _Blob(
            size: 70,
            color: AppColors.primaryLight.withOpacity(0.12),
          ),
        ),
        // Bottom-right small accent
        Positioned(
          bottom: 180,
          right: 24,
          child: _Blob(
            size: 50,
            color: AppColors.secondary.withOpacity(0.15),
          ),
        ),
      ],
    );
  }
}

class _Blob extends StatelessWidget {
  const _Blob({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
