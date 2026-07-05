import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game/features/auth/models/auth_state.dart';
import 'package:game/features/auth/providers/auth_provider.dart';
import 'package:game/features/auth/repositories/auth_repository.dart';

void main() {
  group('AuthNotifier Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(FakeAuthRepository()),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('Initial state is unauthenticated', () {
      expect(
        container.read(authNotifierProvider),
        const AuthState.unauthenticated(),
      );
    });

    test('Successful login updates state to authenticated', () async {
      container.listen(authNotifierProvider, (_, __) {});
      final notifier = container.read(authNotifierProvider.notifier);

      // Perform login
      final future = notifier.login('أحمد', '1234');

      // State should change to loading
      expect(
        container.read(authNotifierProvider),
        const AuthState.loading(),
      );

      await future;

      // State should change to authenticated
      final state = container.read(authNotifierProvider);
      state.maybeWhen(
        authenticated: (user) {
          expect(user.username, 'أحمد');
        },
        orElse: () => fail('Should be authenticated'),
      );
    });

    test('Invalid credentials updates state to error', () async {
      container.listen(authNotifierProvider, (_, __) {});
      final notifier = container.read(authNotifierProvider.notifier);

      // Empty username
      await notifier.login('', '1234');

      // State should change to error
      final state = container.read(authNotifierProvider);
      state.maybeWhen(
        error: (message) {
          expect(message.contains('اسم المستخدم'), true);
        },
        orElse: () => fail('Should be error'),
      );
    });
  });
}
