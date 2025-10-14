import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  static const String selectTheme = 'ThemeSharePreferences';
  ThemeMode? _themeMode;

  ThemeMode? getThemeMode() => _themeMode;

  Future<void> setThemeMode(ThemeMode theme) async {
    final SharedPreferences instance = await SharedPreferences.getInstance();
    await instance.setString(selectTheme, describeEnum(theme));
    _themeMode = theme;
    notifyListeners();
  }

  Future<void> getSystemPreferences() async {
    final SharedPreferences instance = await SharedPreferences.getInstance();
    final String? theme = instance.getString(selectTheme);
    _themeMode = _refreshSystemTheme(theme);
  }

  ThemeMode _refreshSystemTheme(String? theme) {
    ThemeMode themeMode;
    if (theme == '' || theme == null) {
      themeMode = ThemeMode.system;
    } else {
      themeMode = getEnum(ThemeMode.values, theme);
    }
    return themeMode;
  }

  static bool _getEnum(type, String style) => type
      .toString()
      .replaceAll(RegExp(r'^[a-z]+\.', caseSensitive: false), '')
      .contains(style);

  static T getEnum<T>(List<T> values, String style) =>
      values.firstWhere((e) => _getEnum(e, style));
}
