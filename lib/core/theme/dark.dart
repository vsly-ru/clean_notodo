import 'package:flutter/material.dart';

class DarkTheme {
  static final ThemeData _themeData = ThemeData(
    cardColor: Color(0xFF1C1C1C),
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: Color(0xFF116644),
        // primary: Color(0xFF29853A),
        // primary: Color(0xFF568E18),
        onBackground: Color.fromARGB(255, 200, 200, 200),
        onSurface: Colors.white),
  );

  static ThemeData get themeData => _themeData;
}
