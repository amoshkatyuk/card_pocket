import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.deepPurple,
      scaffoldBackgroundColor: Colors.grey,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontSize: 18),
        bodyMedium: TextStyle(fontSize: 14),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      cardTheme: CardTheme(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}