import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSetting {
  SharedPreferencesSetting._();
  factory SharedPreferencesSetting() => instance;
  static final SharedPreferencesSetting instance = SharedPreferencesSetting._();

  static const String _keytheme = 'themeMode';
  static const String systemTheme = 'System';
  static const String lightTheme = 'Light';
  static const String dartTheme = 'Dark';

  static const ThemeMode defaultTheme = ThemeMode.system;

  Future<void> setTheme(ThemeMode themeMode) async {
    final pre = await SharedPreferences.getInstance();
    await pre.setString(_keytheme, themeMode.name);
  }

  Future<String?> getTheme() async {
    final pre = await SharedPreferences.getInstance();
    if (pre.getString(_keytheme) == null) {
      await setTheme(defaultTheme);
    }
    return pre.getString(_keytheme);
  }

  Future<ThemeMode> getThemeMode() async {
    String? theme;
    await getTheme().then(
      (value) {
        theme = value ?? '';
      },
    );
    return ThemeMode.values.firstWhere(
        (themeMode) => themeMode.name.toUpperCase() == theme?.toUpperCase());
  }
}
