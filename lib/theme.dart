import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Color(0xFFF2E5BC);
  static const Color black = Color(0xFF1D2021);
  static const Color grey = Color(0xFF282828);
  static const Color red = Color(0xFFCC241D);
  static const Color green = Color(0xFF98971A);
}

class AppTheme {
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.grey,
    primaryColor: AppColors.green,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.green,
      secondary: AppColors.red,
      background: AppColors.grey,
      error: AppColors.red,
      onPrimary: AppColors.black,
      onBackground: AppColors.white,
      onError: AppColors.black,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.grey,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    popupMenuTheme: const PopupMenuThemeData(
      color: AppColors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      textStyle: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),

    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.grey,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      contentTextStyle: TextStyle(color: AppColors.white),
      actionTextColor: AppColors.green,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.green,
      foregroundColor: AppColors.black,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green,
        foregroundColor: AppColors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.green,
    ),
  );
}
