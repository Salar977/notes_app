import 'package:flutter/material.dart';
import 'package:notes_app/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  // initial theme mode is light
  ThemeData _themeData = lightMode;

  // getter method to access to themedata
  ThemeData get themeData => _themeData;

  // bool method to see if theme is in darkmode or not
  bool get isDarkMode => _themeData == darkMode;

  // setter method to set themeData
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // toggle method to switch to darkMode or lightMode
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
