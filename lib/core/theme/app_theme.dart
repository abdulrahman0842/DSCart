import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.price,
      background: AppColors.scaffoldBackground,
      surface: Colors.white,
      error: AppColors.error,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBar,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.bottomNav,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textSecondary,
        fontSize: 14,
      ),
      titleLarge: TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
