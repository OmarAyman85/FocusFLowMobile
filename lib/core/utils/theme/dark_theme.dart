import 'package:flutter/material.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF388E3C), // Darker Green
    scaffoldBackgroundColor: const Color(0xFF121212), // Dark Charcoal
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF388E3C), // Darker Green
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18,
        color: Color(0xFFE0E0E0),
      ), // Light Gray
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Color(0xFFBDBDBD),
      ), // Muted Gray
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF388E3C), // Darker Green
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF388E3C), // Darker Green
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF388E3C),
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.dark,
      secondary: const Color(0xFFFBC02D), // Golden Yellow
      surface: const Color(0xFF1E1E1E), // Soft Black
      primary: const Color(0xFF388E3C), // Darker Green
      onPrimary: Colors.white,
      error: const Color(0xFFCF6679),
      onSurface: const Color(0xFFE0E0E0), // Light Gray
    ),
  );
}
