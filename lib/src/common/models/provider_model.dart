import 'package:flutter/material.dart';

class ProjectModel extends ChangeNotifier {
  Locale _locale = const Locale("uz");
  String _dropDownValue = "uz";
  int _correct = 0;

  Locale get locale => _locale;

  String get dropDownValue => _dropDownValue;

  int get correct => _correct;

  void setLocale(Locale locale, String dropDownValue) {
    _locale = locale;
    _dropDownValue = dropDownValue;
    notifyListeners();
  }

  void addCorrect(bool isCorrect) {
    if (isCorrect) _correct++;
  }

  void reset() => _correct = 0;
}
