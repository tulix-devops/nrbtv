import 'package:commons/http/data/models/api_response_model.dart';
import 'package:nrbtv/src/data/data.dart';

abstract class OnboardingRepository {
  /// Get OnboardingTabModel list
  Future<ResponseModel<OnboardingListModel>> getList();
  Future<void> completeOnboarding();
  Future<bool> isOnboardingComplete();
  Future<void> deleteOnboardingComplete();
}

final class OnboardingRepositoryImpl implements OnboardingRepository {
  OnboardingRepositoryImpl({
    required OnboardingRemoteDataSource onboardingRemoteDataSource,
    required OnboardingLocalDataSource onboardingLocalDataSource,
  })  : _onboardingRemoteDataSource = onboardingRemoteDataSource,
        _onboardingLocalDataSource = onboardingLocalDataSource;

  final OnboardingRemoteDataSource _onboardingRemoteDataSource;
  final OnboardingLocalDataSource _onboardingLocalDataSource;

  @override
  Future<ResponseModel<OnboardingListModel>> getList() {
    return _onboardingRemoteDataSource.getList();
  }

  @override
  Future<void> completeOnboarding() {
    return _onboardingLocalDataSource.completeOnboarding();
  }

  @override
  Future<bool> isOnboardingComplete() async {
    return _onboardingLocalDataSource.isOnboardingComplete();
  }

  @override
  Future<void> deleteOnboardingComplete() {
    return _onboardingLocalDataSource.deleteOnboardingComplete();
  }
}
