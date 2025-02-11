part of 'onboarding_cubit.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(Status.initial) Status status,
    @Default(0) int pageIndex,
    @Default(<OnboardingModel>[]) List<OnboardingModel> onboardingTabList,
  }) = _OnboardingState;
}
