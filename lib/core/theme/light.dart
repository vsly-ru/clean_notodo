import 'package:flutter/material.dart';

class LightTheme {
  static final ThemeData _themeData = ThemeData(
    primaryColor: Color(0xFF116644),
    cardColor: Colors.white,
    backgroundColor: Color(0xFFE8EAED),
    scaffoldBackgroundColor: Color(0xFFE8EAED),
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF116644),
        onPrimary: Colors.white,
        secondary: Color(0xFF0C462F),
        onSecondary: Colors.white,
        error: Colors.redAccent,
        onError: Colors.white,
        background: Color(0xFFE8EAED),
        onBackground: Color(0xFF555555),
        surface: Color(0xFFFFFFFF),
        onSurface: Color(0xFF1c1c1c)),
  );

  static ThemeData get themeData => _themeData;
}
