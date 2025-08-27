import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryGreen = Color (0xFF10B981); //Modern emerald color
  static const Color emerald900 = Color(0xFF064E3B);
  static const Color emerald800 = Color(0xFF065F46);
  static const Color emerald700 = Color(0xFF047857);
  static const Color emerald600 = Color(0xFF059669);


  static ThemeData lightTheme = ThemeData (
    colorScheme: ColorScheme.fromSeed(
        seedColor: primaryGreen,
        brightness: Brightness.light,

    ),
      useMaterial3: true,
      fontFamily: 'Inter',
  );

  // Dark theme configuration (for future use)
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryGreen,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    fontFamily: 'Inter',
  );

  // Gradient for branding
  static const LinearGradient brandGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [emerald900, emerald800, emerald700, emerald600],
    stops: [0.0, 0.3, 0.7, 1.0],
  );
}


