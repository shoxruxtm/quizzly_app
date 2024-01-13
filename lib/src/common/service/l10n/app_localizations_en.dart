import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome to Quizzly!';

  @override
  String get description => 'With Quizzly, you can improve your thinking, intelligence and logical skills.';

  @override
  String get appropriateLevel => 'Choose the appropriate level';

  @override
  String levelNumber(Object number) {
    return 'Level $number';
  }

  @override
  String get question => 'Question';

  @override
  String get score => 'Your Score';

  @override
  String get correct => 'Correct';

  @override
  String get wrong => 'Wrong';

  @override
  String get playAgain => 'Play again';

  @override
  String get home => 'Home';
}
