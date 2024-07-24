import 'package:flutter/material.dart';
import 'package:instagram_clone/constant/app_colors.dart';

class AppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.primaryDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      surfaceTintColor: AppColors.primaryDark,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.blackColor,
      selectedItemColor: AppColors.whiteColor,
    ),
  );
  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      selectedItemColor: AppColors.primaryDark,
    ),
  );
}
