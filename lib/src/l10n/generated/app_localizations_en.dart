import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Project Bootstrap';

  @override
  String counterLabel(int count) {
    return 'You have tapped $count times.';
  }

  @override
  String get loadingMessage => 'Loading counter history…';

  @override
  String get genericErrorMessage => 'Something went wrong. Please try again.';

  @override
  String get incrementButton => 'Increment';

  @override
  String get resetButton => 'Reset';
}
