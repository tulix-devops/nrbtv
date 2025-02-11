enum HttpMethod { get, post, put, delete, postFormData }

enum Status {
  initial,
  loading,
  loadingNextPage,
  success,
  failure,
  serverFailure,
  finished,
  navigatingWithClick,
  authenticationFailure
}

enum ContentType {
  movie(1),
  series(2),
  channel(3);

  const ContentType(this.value);
  final int value;
}

enum AdStatus {
  initial(1),
  view(2),
  finish(3);

  const AdStatus(this.value);
  final int value;
}

enum HelpCenterTab { faq, contactUs }

enum NotificationType {
  error,
  info,
  warning,
  success;

  static const Duration defaultDuration = Duration(seconds: 5);
}

enum FormStatus { initial, inProgress, success, failure }

enum BottomBarType {
  floatingBlack,
  white,
  black,
}

enum BottomBarTab { search, home, live, vod, series, account }

enum AuthStatus { authenticated, unauthenticated }

enum ButtonType {
  primary,
  primaryRounded,
  secondary,
  secondaryRounded,
  social,
  iconPrimary,
  iconPrimaryRounded,
  iconSecondary,
  iconSecondaryRounded,
  text,
  textRounded,
}

enum ChipType {
  smallPrimary,
  smallPrimaryRounded,
  mediumPrimary,
  mediumPrimaryRounded,
  largePrimary,
  largePrimaryRounded,
}

enum ModalType { white, dark }
