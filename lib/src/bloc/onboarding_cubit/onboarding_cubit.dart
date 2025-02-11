import 'package:commons/http/data/models/api_response_model.dart';
import 'package:commons/shared/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nrbtv/src/data/data.dart';

part 'onboarding_state.dart';
part 'onboarding_cubit.freezed.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit({
    required OnboardingRepository onboardingRepository,
  })  : _onboardingRepository = onboardingRepository,
        super(const OnboardingState()) {
    _init();
  }

  final OnboardingRepository _onboardingRepository;

  Future<void> _init() async {
    emit(state.copyWith(status: Status.loading));

    final ResponseModel<OnboardingListModel> response =
        await _onboardingRepository.getList();

    (switch (response) {
      SuccessModel<OnboardingListModel>() => emit(
          state.copyWith(
              onboardingTabList: response.data.tabs, status: Status.success),
        ),
      FailureModel<OnboardingListModel>() => emit(state.copyWith(
          status: Status.failure,
        )),
      AuthenticationFailureModel<OnboardingListModel>() => emit(state.copyWith(
          status: Status.authenticationFailure,
        )),
      _ => emit(state.copyWith(
          status: Status.serverFailure,
        )),
    });
  }

  /// Complete onboarding and store boolean
  Future<void> complete() async {
    await _onboardingRepository.completeOnboarding();
  }

  /// Function for Dot Indicator onPress
  void onIndicatorPressed(int index) {
    _emitClickedStatus();
    _changePage(index);
  }

  /// Function for PageView OnPageChanged
  void onPageChanged(int index) => _changePage(index);

  /// Function to navigate To Next page
  void nextPage() {
    // Prevent multiple click events;
    if (isNavigatingWithClick) return;

    final int index = state.pageIndex + 1;

    if (isLastPage(index - 1)) return;

    _emitClickedStatus();

    _changePage(index);
  }

  /// Function to navigate To Previous page
  void previousPage() {
    final int index = state.pageIndex - 1;

    if (isFirstPage(index)) return;

    _emitClickedStatus();

    _changePage(index);
  }

  /// Function to change pageIndex state
  void _changePage(int index) {
    emit(state.copyWith(pageIndex: index));
  }

  /// Function to emit [Status.navigatingWithClick]
  /// So the Pageview OnPageChanged() doesn't trigger
  void _emitClickedStatus() {
    emit(state.copyWith(status: Status.navigatingWithClick));
  }

  /// Function to emit [Status.success]
  /// After PageView navigates to destination
  void emitFinishedClickStatus() {
    emit(state.copyWith(status: Status.success));
  }

  bool get isNavigatingWithClick => state.status == Status.navigatingWithClick;
  bool isLastPage(int index) => index == state.onboardingTabList.length - 1;
  bool isFirstPage(int index) => index < 0;
}
