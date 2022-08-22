import 'package:flutter/material.dart';

class Colorizer extends ChangeNotifier {
  ThemeData _mainTheme = ThemeData.dark();

  ThemeData get mainThemeGetter => _mainTheme;

  void toggleTheme() {
    _mainTheme == ThemeData.dark()
        ? _mainTheme =
            ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.blueGrey)
        : _mainTheme = ThemeData.dark();
    notifyListeners();
  }
}
