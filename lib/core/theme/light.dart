import 'package:flutter/material.dart';

class LightTheme {
  static final ThemeData _themeData = ThemeData(
      primarySwatch: Colors.blueGrey,
      cardColor: Colors.white,
      backgroundColor: Color(0xFFE8EAED),
      scaffoldBackgroundColor: Color(0xFFE8EAED),
      colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: Colors.blueGrey,
          onBackground: Color(0xFF1C1C1C),
          onSurface: Color(0xFF3D3D3D)));

  static ThemeData get themeData => _themeData;
}
