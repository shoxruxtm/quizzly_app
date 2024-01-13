import 'app_localizations.dart';

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get welcome => 'Quizzly ga xush kelibsiz!';

  @override
  String get description => 'Quizzly yordamida siz o\'zingizning fikrlashingiz va mantiqiy mahoratlaringizni oshira olasiz.';

  @override
  String get appropriateLevel => 'O\'zingizga mos keladigan bosqichni tanlang';

  @override
  String levelNumber(Object number) {
    return '$number - bosqich';
  }

  @override
  String get question => 'Savol';

  @override
  String get score => 'To\'plagan balingiz';

  @override
  String get correct => 'To\'g\'ri';

  @override
  String get wrong => 'Xato';

  @override
  String get playAgain => 'Qayta o\'ynash';

  @override
  String get home => 'Bosh sahifa';
}
