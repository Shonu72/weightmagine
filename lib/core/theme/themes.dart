import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weightmagine/core/theme/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: AppColors.black),
    fontFamily: 'Satoshi',
    appBarTheme: AppBarTheme(
      elevation: 0.5,
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.black, size: 3.5.h),
      titleTextStyle: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.black,
      selectionColor: AppColors.primaryColor,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 11.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.black,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 9.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 8.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Satoshi',
        color: AppColors.white,
        fontSize: 12.sp,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColors.blueDark,
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(color: AppColors.white),
    fontFamily: 'Satoshi',
    appBarTheme: AppBarTheme(
      elevation: 0.5,
      backgroundColor: AppColors.black,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.white, size: 3.5.h),
      titleTextStyle: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.white,
      selectionColor: AppColors.blueDark,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 12.5.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 10.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 9.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 8.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Satoshi',
        color: AppColors.white,
        fontSize: 12.sp,
      ),
    ),
  );
}
