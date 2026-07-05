import '../models/profile_model.dart';

/// Contract defining profile management operations.
abstract interface class ProfileRepository {
  /// Fetches the profile data for a specific user ID.
  Future<ProfileModel> getProfile(String userId);

  /// Updates the profile data.
  Future<void> updateProfile(ProfileModel profile);
}

/// Fake implementation of [ProfileRepository] using mockup stats.
class FakeProfileRepository implements ProfileRepository {
  final Map<String, ProfileModel> _cache = {};

  @override
  Future<ProfileModel> getProfile(String userId) async {
    // Simulate network latency
    await Future.delayed(const Duration(milliseconds: 600));

    // If username is empty/null in cache, seed some realistic dummy stats
    return _cache.putIfAbsent(
      userId,
      () => ProfileModel(
        id: userId,
        username: 'لاعب بلف',
        wins: 14,
        gamesPlayed: 32,
        totalPoints: 1280,
      ),
    );
  }

  @override
  Future<void> updateProfile(ProfileModel profile) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _cache[profile.id] = profile;
  }
}
