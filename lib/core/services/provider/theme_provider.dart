import 'package:flutter/material.dart';
import 'package:news_app/core/services/shared_prefs.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = true;
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    loadThemeMode();
  }

  Future<void> init({required ThemeMode themeMode}) async {
    _themeMode = themeMode;
    isDark = themeMode == ThemeMode.dark;
    notifyListeners();
  }

  void setThemeMode(bool value) {
    isDark = value;
    _themeMode = value ? ThemeMode.dark : ThemeMode.light;
    saveThemeMode(_themeMode);
    notifyListeners();
  }

  Future<void> loadThemeMode() async {
    final savedTheme = await getThemeMode();
    _themeMode = savedTheme;
    isDark = _themeMode == ThemeMode.dark;
    notifyListeners();
  }


  void toggleThemeMode() {
    setThemeMode(!isDark);
  }
}
