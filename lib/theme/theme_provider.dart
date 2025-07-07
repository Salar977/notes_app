import 'package:flutter/material.dart';
import 'package:notes_app/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  // initial theme mode is light
  ThemeData _themeData = lightMode;

  // font size
  double _fontSize = 18.0;

  // getter method to access to themedata
  ThemeData get themeData => _themeData;

  // getter method to access to font size
  double get fontSize => _fontSize;

  // bool method to see if theme is in darkmode or not
  bool get isDarkMode => _themeData == darkMode;

  // setter method to set themeData
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // setter method to set font size
  set fontSize(double fontSize) {
    _fontSize = fontSize;
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
