import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF4CAF50), // Medium Green
    scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Light Gray
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF4CAF50), // Medium Green
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, color: Color(0xFF333333)), // Dark Gray
      bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF333333)),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF4CAF50), // Medium Green
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4CAF50), // Medium Green
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFFF7043), // Soft Orange
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xFF4CAF50), // Medium Green
      secondary: const Color(0xFFFFEB3B), // Soft Yellow
      surface: const Color(0xFFF5F5F5), // Light Gray
      // surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: const Color(0xFF333333), // Dark Gray
    ),
  );
}
