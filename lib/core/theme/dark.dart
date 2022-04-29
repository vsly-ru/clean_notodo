import 'package:flutter/material.dart';

class DarkTheme {
  static final ThemeData _themeData = ThemeData(
    primaryColor: Color(0xFF116644),
    cardColor: Color(0xFF1C1C1C),
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF116644),
        onPrimary: Colors.white,
        secondary: Color(0xFF0C462F),
        onSecondary: Colors.white,
        error: Colors.redAccent,
        onError: Colors.white,
        background: Colors.black,
        onBackground: Color.fromARGB(255, 200, 200, 200),
        surface: Color(0xFF1c1c1c),
        onSurface: Colors.white),
  );

  static ThemeData get themeData => _themeData;
}
