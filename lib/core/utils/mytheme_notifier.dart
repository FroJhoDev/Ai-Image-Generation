import 'package:flutter/material.dart';

import '../usecases/local_storage_service.dart';

class MyTheme with ChangeNotifier {
  static bool _isDark = false;
  final String _key = 'currenttheme';

  MyTheme() {
    readThemeOnLocalStorage(_key).then((value) {
      _isDark = value;
      notifyListeners();
    });
  }

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    _isDark = !_isDark;
    saveThemeOnLocalStorage(_isDark, _key);
    notifyListeners();
  }

  bool get() {
    return _isDark;
  }
}
