import 'package:flutter/material.dart';
import 'package:second_flutter/theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _appTheme = lightTheme;
  ThemeData getTheme() => _appTheme;
  void changeTheme() {
    if (_appTheme == lightTheme) {
      _appTheme = darkTheme;
      notifyListeners();
    } else {
      _appTheme = lightTheme;
      notifyListeners();
    }
  }
}
