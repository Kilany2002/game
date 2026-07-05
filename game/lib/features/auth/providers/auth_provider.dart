import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/auth_state.dart';
import '../repositories/auth_repository.dart';

part 'auth_provider.g.dart';

/// Provider exposing the [AuthRepository] instance.
///
/// Easily mockable in tests by overriding this provider.
@riverpod
AuthRepository authRepository(Ref ref) {
  // Returns the fake implementation for now.
  // Can be swapped for SupabaseAuthRepository later.
  return FakeAuthRepository();
}

/// State notifier managing the user's authentication state.
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    return const AuthState.unauthenticated();
  }

  /// Attempts to log in with username and password.
  Future<void> login(String username, String password) async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      final user = await repository.login(
        username: username,
        password: password,
      );
      state = AuthState.authenticated(user);
    } catch (error) {
      final cleanMessage = error.toString().replaceAll('Exception: ', '');
      state = AuthState.error(cleanMessage);
    }
  }

  /// Logs out the current user session.
  Future<void> logout() async {
    state = const AuthState.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      await repository.logout();
      state = const AuthState.unauthenticated();
    } catch (error) {
      final cleanMessage = error.toString().replaceAll('Exception: ', '');
      state = AuthState.error(cleanMessage);
    }
  }
}
