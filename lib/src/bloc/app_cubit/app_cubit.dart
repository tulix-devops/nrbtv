import 'dart:async';
import 'dart:io';

import 'package:commons/commons.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:nrbtv/src/data/models/profile/customer_info_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nrbtv/src/data/data.dart';
import 'package:ui_kit/ui_kit.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required OnboardingRepository onboardingRepository,
    required AuthStatusUseCase authStatusUseCase,
    required LogoutUseCase logoutUseCase,
    required ProfileRepository profileRepository,
    required GetAuthTokenUseCase getAuthTokenUseCase,
  })  : _authStatusUseCase = authStatusUseCase,
        _logoutUseCase = logoutUseCase,
        _onboardingRepository = onboardingRepository,
        _profileRepository = profileRepository,
        _getAuthTokenUseCase = getAuthTokenUseCase,
        super(const AppState());

// ignore: unused_field
  final AuthStatusUseCase _authStatusUseCase;

  final LogoutUseCase _logoutUseCase;

  final OnboardingRepository _onboardingRepository;

  final GetAuthTokenUseCase _getAuthTokenUseCase;

  final ProfileRepository _profileRepository;
  // ignore: unused_field
  late final StreamSubscription<AuthStatus> _authStatusSubscription;

  @override
  Future<void> close() {
    _authStatusSubscription.cancel();
    return super.close();
  }

  Future<void> init() async {
    emit(
      state.copyWith(initializationStatus: InitializationStatus.loading),
    );

    _authStatusSubscription = _authStatusUseCase().listen((AuthStatus status) {
      emit(
        state.copyWith(
          authStatus: status,
        ),
      );
    });

    await getIsOnboardingComplete();

    if (Platform.isAndroid) {
      await isDeviceTv();
    }
    // await initUser();
    await getCustomerInfo();

    emit(
      state.copyWith(
        initializationStatus: InitializationStatus.initialized,
      ),
    );
  }

  Future<String?> getToken() async {
    return await _getAuthTokenUseCase();
  }

  Future<void> getCustomerInfo() async {
    emit(state.copyWith(userInitStatus: Status.loading));

    final result = await _profileRepository.getCustomerInfo();

    (switch (result) {
      SuccessModel<CustomerInfoModel>() => emit(
          state.copyWith(
            customerInfo: result.data,
            userInitStatus: Status.success,
          ),
        ),
      FailureModel<CustomerInfoModel>() => emit(state.copyWith(
          userInitStatus: Status.serverFailure,
          userInfoError: result.message,
        )),
      ValidationFailureModel<CustomerInfoModel>() => emit(state.copyWith(
          userInitStatus: Status.failure,
        )),
      ModelNotFoundFailureModel<CustomerInfoModel>() => emit(
          state.copyWith(
            userInitStatus: Status.failure,
            userInfoError: result.message,
          ),
        ),
      AuthenticationFailureModel<ProfileModel>() =>
        emit(state.copyWith(userInitStatus: Status.authenticationFailure)),
      _ => null,
    });
  }

  Future<void> initUser() async {
    emit(state.copyWith(userInitStatus: Status.loading));

    final result = await _profileRepository.getProfileInfo();

    print(result);

    (switch (result) {
      SuccessModel<ProfileModel>() => emit(
          state.copyWith(
            userInfo: result.data,
            userInitStatus: Status.success,
          ),
        ),
      FailureModel<ProfileModel>() => emit(state.copyWith(
          userInitStatus: Status.serverFailure,
          userInfoError: result.message,
        )),
      ValidationFailureModel<ProfileModel>() => emit(state.copyWith(
          userInitStatus: Status.failure,
        )),
      ModelNotFoundFailureModel<ProfileModel>() => emit(
          state.copyWith(
            userInitStatus: Status.failure,
            userInfoError: result.message,
          ),
        ),
      AuthenticationFailureModel<ProfileModel>() =>
        emit(state.copyWith(userInitStatus: Status.authenticationFailure)),
      _ => null,
    });

    _setIsSubscribed();
  }

  void _setIsSubscribed() {
    emit(state.copyWith(isSubscribed: true));
  }

  ///TODO check for samsung and  ios
  Future<void> isDeviceTv() async {
    final DeviceInfoPlugin plugin = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await plugin.androidInfo;
    bool isTV =
        androidInfo.systemFeatures.contains('android.software.leanback');
    emit(state.copyWith(isDeviceTv: isTV));
  }

  void changeTab(BottomBarTab tab, {bool canPop = false}) {
    emit(
      state.copyWith(
        currentTab: tab,
        canPop: canPop,
      ),
    );
  }

  /// Execute logout usecase
  void onLogout() async {
    _logoutUseCase();

    await Future.delayed(const Duration(milliseconds: 500));

    emit(
      state.copyWith(
        currentTab: BottomBarTab.account,
      ),
    );
  }

  Future<void> getIsOnboardingComplete() async {
    emit(
      state.copyWith(
        isOnboardingComplete:
            await _onboardingRepository.isOnboardingComplete(),
      ),
    );
  }

  void showOverlay() {
    emit(
      state.copyWith(
        hasOverlay: true,
      ),
    );
  }

  void hideOverlay() {
    emit(
      state.copyWith(
        hasOverlay: false,
      ),
    );
  }

  void isNavigationFocused(bool isVisible) {
    emit(state.copyWith(isNavigationFocused: isVisible));
  }

  void showAuthDialog() {
    hideDialog();
    emit(state.copyWith(appDialogType: AppDialogType.auth));
  }

  void showSubscribeDialog() {
    hideDialog();

    emit(state.copyWith(appDialogType: AppDialogType.subscribe));
  }

  void hideDialog() {
    emit(state.copyWith(appDialogType: AppDialogType.none));
  }
}
