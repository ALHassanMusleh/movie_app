import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData dark = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: Color(0xff121312),
    canvasColor: AppColors.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.black,
      onPrimary: AppColors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.black,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(
        color: AppColors.primary,
        size: 28,
      ),
      unselectedIconTheme: IconThemeData(
        size: 28,
        color: Colors.white,
      ),
    ),
  );
}
