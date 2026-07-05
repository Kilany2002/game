import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../auth/providers/auth_provider.dart';
import '../models/profile_model.dart';
import '../repositories/profile_repository.dart';

part 'profile_provider.g.dart';

/// Provider exposing the [ProfileRepository] instance.
@riverpod
ProfileRepository profileRepository(Ref ref) {
  return FakeProfileRepository();
}

/// Dynamic future provider that watches the authenticated user state
/// and fetches their corresponding stats profile.
@riverpod
Future<ProfileModel> userProfile(Ref ref) async {
  final authState = ref.watch(authNotifierProvider);
  final user = authState.maybeWhen(
    authenticated: (user) => user,
    orElse: () => null,
  );

  if (user == null) {
    throw Exception('المستخدم غير مسجل الدخول');
  }

  final repository = ref.watch(profileRepositoryProvider);
  final profile = await repository.getProfile(user.id);

  // Sync profile username with the currently authenticated username
  return profile.copyWith(username: user.username);
}
