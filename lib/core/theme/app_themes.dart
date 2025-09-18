import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  /// Light Theme
  static ThemeData lightTheme = ThemeData(
     fontFamily: 'Oxygen',
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.background,
      elevation: 0,
      // titleTextStyle: AppTextStyles.appBarTitle,
    ),
    // textTheme: AppTextStyles.textTheme,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.background,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.background,
        // textStyle: AppTextStyles.button,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Oxygen',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: AppColors.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: AppColors.primary,
      elevation: 0,
      // titleTextStyle: AppTextStyles.appBarTitle.copyWith(color: AppColors.primary),
    ),
    // textTheme: AppTextStyles.textTheme.apply(
    //   bodyColor: AppColors.background,
    //   displayColor: AppColors.background,
    // ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
        // textStyle: AppTextStyles.button,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
