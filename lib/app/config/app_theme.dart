import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,

    // Color Scheme
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      secondary: Color(0xFFFF937B),
      onPrimary: Colors.black,
      onSecondary: Colors.white,
    ),

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),

    // Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF937B),
        foregroundColor: Colors.white,
      ),
    ),

    // Icon Theme
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),

    // Text Theme
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
    ),
  );
}

class AppColor {
  static const Color primaryColor = Color(0xFFFFFFFF);
  static const Color secondaryColor = Color(0xFFFF937B);
  static const Color primaryTextColor = Color(0xFF000000);
}
