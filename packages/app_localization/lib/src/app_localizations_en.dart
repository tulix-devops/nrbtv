import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginPageTitle => 'Login page';

  @override
  String get loginPageSubtitle => 'Sign into the application';

  @override
  String get signUpPageTitle => 'Sign up page';

  @override
  String get signUpPageSubtitle => 'Create an account to use our application';

  @override
  String get error404 => 'The record was not found';

  @override
  String get error401 => 'Authorization error occurred';

  @override
  String get error500 => 'Unknown error try again later';

  @override
  String get loginSuccess => 'Signed in succesfully';

  @override
  String get loginError => 'Email or password is wrong';

  @override
  String get loginButtonLabel => 'Login';

  @override
  String get signUpButtonLabel => 'Sign up';

  @override
  String get signUpSuccess => 'Sign up was a success';

  @override
  String get signUpError => 'Try again later';
}
