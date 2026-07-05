import '../models/user_model.dart';

/// Contract defining authentication operations.
///
/// Ensures the UI and business logic do not depend on Supabase directly,
/// allowing easy swapping later.
abstract interface class AuthRepository {
  /// Signs in the user with username and password.
  Future<UserModel> login({
    required String username,
    required String password,
  });

  /// Logs out the current user.
  Future<void> logout();

  /// Retrieves the currently authenticated user session if it exists.
  Future<UserModel?> getCurrentUser();
}

/// Fake implementation of [AuthRepository] using in-memory mock data.
class FakeAuthRepository implements AuthRepository {
  UserModel? _currentUser;

  @override
  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    // Simulate network latency
    await Future.delayed(const Duration(milliseconds: 1500));

    if (username.trim().isEmpty) {
      throw Exception('اسم المستخدم لا يمكن أن يكون فارغاً');
    }

    if (password.length < 4) {
      throw Exception('كلمة المرور يجب أن تكون ٤ أحرف أو أكثر');
    }

    // Mock successful login
    final user = UserModel(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      username: username.trim(),
    );
    _currentUser = user;
    return user;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 800));
    _currentUser = null;
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _currentUser;
  }
}
