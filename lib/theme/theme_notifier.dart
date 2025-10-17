import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  static const String selectTheme = 'ThemeSharePreferences';

  ThemeMode? _themeMode;
  ThemeMode? get themeMode => _themeMode;

  Future<void> setThemeMode(ThemeMode theme) async {
    final SharedPreferences instance = await SharedPreferences.getInstance();
    await instance.setString(selectTheme, theme.name);
    _themeMode = theme;
    notifyListeners();
  }

  Future<void> getSystemPreferences() async {
    final SharedPreferences instance = await SharedPreferences.getInstance();
    final String? theme = instance.getString(selectTheme);
    _themeMode = _refreshSystemTheme(theme);
  }

  ThemeMode _refreshSystemTheme(String? theme) {
    if (theme == null || theme.isEmpty) {
      return ThemeMode.system;
    }

    return ThemeMode.values.firstWhere(
      (ThemeMode mode) => mode.name == theme,
      orElse: () => ThemeMode.system,
    );
  }
}
