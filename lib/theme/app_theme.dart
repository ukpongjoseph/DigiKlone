import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: const Color(0xFFFFFFFF),
    primary: const Color(0xFF667EEA),
    secondary: const Color(0xFF764BA2),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: const Color(0xFF1E1E1E),
    primary: const Color(0xFF8B9EF5),
    secondary: const Color(0xFF9A7BB8),
  ),
);
