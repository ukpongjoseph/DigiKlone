import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    // Backgrounds
    surface: const Color(0xFFFFFFFF),
    surfaceContainerHigh: const Color(0xFFF8FAFC), // surfaceElevated
    surfaceContainerHighest: const Color(0xFFFFFFFF), // cardBackground
    surfaceContainerLow: Colors.black,
    // Primary Brand Colors
    primary: const Color(0xFF667EEA),
    onPrimary: const Color(0xFFFFFFFF),
    primaryContainer: const Color(0xFF8B9EF5), // primaryLight
    // Secondary Brand Colors
    secondary: const Color(0xFF764BA2),
    secondaryFixedDim: const Color.fromARGB(255, 187, 140, 234),
    onSecondary: const Color(0xFFFFFFFF),

    // Tertiary (using input background)
    tertiary: const Color(0xFFF8FAFC),
    onTertiary: const Color(0xFF0F172A),
    onTertiaryFixed: Colors.grey.shade200,

    // Status Colors
    error: const Color(0xFFEF4444),
    onError: const Color(0xFFFFFFFF),

    // Text Colors (mapped to onSurface variants)
    onSurface: const Color(0xFF0F172A), // textPrimary
    onSurfaceVariant: const Color(0xFF64748B), // textSecondary
    // Borders
    outline: const Color(0xFFE2E8F0), // border
    outlineVariant: const Color(0xFFF1F5F9), // borderLight
    // Shadow
    shadow: const Color(0xFF000000),
    scrim: const Color(0x1A000000), // cardShadow
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    // Backgrounds
    surface: const Color.fromARGB(255, 0, 0, 0),
    surfaceContainerHigh: const Color.fromARGB(
      255,
      19,
      19,
      19,
    ), // surfaceElevated
    surfaceContainerHighest: const Color.fromARGB(
      255,
      46,
      45,
      45,
    ), // cardBackground
    surfaceContainerLow: Colors.white, // cardBackground
    // Primary Brand Colors
    primary: const Color(0xFF8B9EF5),
    onPrimary: const Color(0xFFFFFFFF),
    primaryContainer: const Color.fromARGB(255, 51, 87, 246), // primaryLight
    // Secondary Brand Colors
    secondary: const Color(0xFF9A7BB8),
    onSecondary: const Color(0xFFFFFFFF),

    // Tertiary (using input background)
    tertiary: const Color(0xFF262626),
    onTertiary: const Color(0xDEFFFFFF),
    onTertiaryFixed: Colors.grey.shade700,

    // Status Colors
    error: const Color(0xFFF87171),
    onError: const Color(0xFFFFFFFF),

    // Text Colors (mapped to onSurface variants)
    onSurface: const Color(0xDEFFFFFF), // textPrimary - 87% opacity
    onSurfaceVariant: const Color(0x99FFFFFF), // textSecondary - 60% opacity
    // Borders
    outline: const Color(0xFF374151), // border
    outlineVariant: const Color(0xFF2D3748), // borderLight
    // Shadow
    shadow: const Color(0xFF000000),
    scrim: const Color(0x4D000000), // cardShadow
  ),
);
