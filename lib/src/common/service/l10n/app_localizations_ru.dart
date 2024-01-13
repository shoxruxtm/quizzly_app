import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get welcome => 'Добро пожаловать в Quizzly!';

  @override
  String get description => 'С Quizzly вы можете улучшить свое мышление, интеллект и логические навыки.';

  @override
  String get appropriateLevel => 'Выберите подходящий уровень';

  @override
  String levelNumber(Object number) {
    return 'Уровень $number';
  }

  @override
  String get question => 'Вопрос';

  @override
  String get score => 'Ваш счет';

  @override
  String get correct => 'Правильный';

  @override
  String get wrong => 'Неправильный';

  @override
  String get playAgain => 'Заново';

  @override
  String get home => 'Главная';
}
