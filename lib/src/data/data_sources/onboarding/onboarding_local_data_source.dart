import 'package:local_storage/local_storage.dart';

final class OnboardingLocalDataSource {
  const OnboardingLocalDataSource(this._localStorage);

  final LocalStorage _localStorage;

  Future<void> completeOnboarding() {
    return _localStorage.store(CacheKeys.isOnboardingComplete, true);
  }

  Future<bool> isOnboardingComplete() async {
    return (await _localStorage.get<bool>(CacheKeys.isOnboardingComplete)) ??
        false;
  }

  Future<void> deleteOnboardingComplete() {
    return _localStorage.delete(CacheKeys.isOnboardingComplete);
  }
}
