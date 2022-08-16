import 'package:flutter/material.dart';

final lightColorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF2563EB), brightness: Brightness.light);
final darkColorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF2563EB), brightness: Brightness.dark);
const _textTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 57, fontFamily: "Inter", fontWeight: FontWeight.normal),
    displayMedium: TextStyle(
        fontSize: 45, fontFamily: "Inter", fontWeight: FontWeight.normal),
    displaySmall: TextStyle(
        fontSize: 36, fontFamily: "Inter", fontWeight: FontWeight.normal),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontFamily: "Inter",
      fontWeight: FontWeight.normal,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontFamily: "Inter",
      fontWeight: FontWeight.normal,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontFamily: "Inter",
      fontWeight: FontWeight.normal,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontFamily: "Inter",
      fontWeight: FontWeight.normal,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontFamily: "Inter",
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
        fontSize: 14, fontFamily: "Inter", fontWeight: FontWeight.w500),
    labelLarge: TextStyle(
        fontSize: 14, fontFamily: "Inter", fontWeight: FontWeight.w500),
    labelMedium: TextStyle(
        fontSize: 12, fontFamily: "Inter", fontWeight: FontWeight.w500),
    labelSmall: TextStyle(
        fontSize: 11, fontFamily: "Inter", fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(
        fontSize: 16, fontFamily: "Inter", fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(
        fontSize: 14, fontFamily: "Inter", fontWeight: FontWeight.w500),
    bodySmall: TextStyle(
        fontSize: 12, fontFamily: "Inter", fontWeight: FontWeight.w500));

final lightTheme = ThemeData(
    colorScheme: lightColorScheme,
        scaffoldBackgroundColor: lightColorScheme.background,
    useMaterial3: true,
    textTheme: _textTheme);

final darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    useMaterial3: true,
    scaffoldBackgroundColor: darkColorScheme.background,
    textTheme: _textTheme);
