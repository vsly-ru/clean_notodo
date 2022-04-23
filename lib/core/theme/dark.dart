import 'package:flutter/material.dart';

class DarkTheme {
  static final ThemeData _themeData = ThemeData(
    primarySwatch: Colors.blueGrey,
    cardColor: Color(0xFF1C1C1C),
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: Colors.blueGrey,
        // primary: Color(0xFF568E18),
        onBackground: Color.fromARGB(255, 200, 200, 200),
        onSurface: Colors.white),
  );

  static ThemeData get themeData => _themeData;
}
