// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppTheme {
  static final Color netflixRed = Colors.red[900] ?? Colors.red;

  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    primaryColor: netflixRed,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: netflixRed,
        padding: const EdgeInsets.symmetric(vertical: 10),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      side: BorderSide(color: Colors.grey),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return netflixRed;
        }
        return Colors.transparent;
      }),
    ),
  );

  //! Inputs decorations

  static InputDecoration inputDecoration(String label) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey[800],
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      errorStyle: TextStyle(height: 0.8),
    );
  }
}
