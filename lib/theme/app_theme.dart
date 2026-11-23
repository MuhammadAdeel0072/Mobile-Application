import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xFF4338CA);
  static const secondary = Color(0xFF7C3AED);
  static const accent = Color(0xFF3B82F6);
  static const background = Color(0xFFF5F7FF);
  static const surface = Color(0xFFFFFFFF);
  static const primaryText = Color(0xFF172554);
  static const secondaryText = Color(0xFF64748B);

  static ThemeData get theme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      secondary: secondary,
      surface: surface,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: primaryText,
          fontSize: 32,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
        ),
        headlineMedium: TextStyle(
          color: primaryText,
          fontSize: 24,
          fontWeight: FontWeight.w800,
        ),
        titleLarge: TextStyle(
          color: primaryText,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(
          color: secondaryText,
          fontSize: 14,
          height: 1.45,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        hintStyle: const TextStyle(color: Color(0xFF94A3B8)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFDC2626)),
        ),
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        foregroundColor: primaryText,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
