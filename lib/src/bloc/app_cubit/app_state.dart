part of 'app_cubit.dart';

enum InitializationStatus { initial, loading, initialized }

enum ThemeStatus { switching, switched }

enum AppDialogType {
  none,
  auth,
  subscribe,
}

@freezed
class AppState with _$AppState {
  const AppState._();

  const factory AppState({
    @Default(AuthStatus.unauthenticated) AuthStatus authStatus,
    @Default(BottomBarTab.archive) BottomBarTab currentTab,
    @Default(AppThemeColor.blue) AppThemeColor themeColor,
    @Default(false) bool isOnboardingComplete,
    @Default(false) bool hasOverlay,
    @Default(false) bool isDeviceTv,
    // For init function tracking
    @Default(InitializationStatus.initial)
    InitializationStatus initializationStatus,
    @Default(Status.initial) Status userInitStatus,
    @Default(null) String? userInfoError,
    @Default(null) CustomerInfoModel? customerInfo,
    @Default(null) ProfileModel? userInfo,
    @Default(ThemeStatus.switched) ThemeStatus themeStatus,
    @Default(false) bool isNavigationFocused,
    @Default(false) bool canPop,
    @Default(false) bool isLogoutVisible,
    @Default(AppDialogType.none) AppDialogType appDialogType,
    @Default(false) bool isSubscribed,
  }) = _AppState;

  bool get isInitialized =>
      initializationStatus == InitializationStatus.initialized;
  bool get isNotInitialized =>
      initializationStatus == InitializationStatus.initial ||
      initializationStatus == InitializationStatus.loading;

  bool get isAuthenticated => authStatus == AuthStatus.authenticated;
  bool get isNotAuthenticated => authStatus == AuthStatus.unauthenticated;

  bool get shouldNavigateToPaymentPage => appDialogType != AppDialogType.none;
}
