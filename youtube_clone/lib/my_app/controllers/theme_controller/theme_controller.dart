import 'package:flutter/material.dart';
import 'package:youtube_clone/main.dart';

class ThemeController with ChangeNotifier {
  late ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  Future<void> changeThemeData(ThemeMode? mode) async {
    if (themeMode != mode) {
      await MyApp.setting.setTheme(mode ?? ThemeMode.system);
      _themeMode = mode ?? ThemeMode.system;
      notifyListeners();
    }
  }

  Future<void> getTheme() async {
    _themeMode = await MyApp.setting.getThemeMode();
  }
}
