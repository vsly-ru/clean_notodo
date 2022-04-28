import 'package:flutter/material.dart';

class LightTheme {
  static final ThemeData _themeData = ThemeData(
      cardColor: Colors.white,
      backgroundColor: Color(0xFFE8EAED),
      scaffoldBackgroundColor: Color(0xFFE8EAED),
      colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: Color(0xFF116644),
          onBackground: Color(0xFF2E2E2E),
          onSurface: Color(0xFF3D3D3D)));

  static ThemeData get themeData => _themeData;
}
