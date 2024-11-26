import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: Colors.white,
        secondary: Colors.white,
        onSecondary: const Color(0xffA3A3A3),
        error: Colors.white,
        onError: Colors.white,
        surface: Colors.black,
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 24.sp,
              color: Colors.white,
              fontWeight: FontWeight.w700),
          titleSmall: TextStyle(
              fontSize: 22.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(
              fontSize: 20.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500),
          bodySmall: TextStyle(
              fontSize: 15.sp,
              color: const Color(0xffA3A3A3),
              fontWeight: FontWeight.w300)),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: AppColors.primary,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 22.sp),
          iconTheme: const IconThemeData(color: Colors.white),
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(50)))));

  static ThemeData darkTheme = ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primary,
        onPrimary: Colors.black,
        secondary: const Color(0xffA3A3A3),
        onSecondary: Colors.white,
        error: Colors.white,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: Color(0xffA3A3A3),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 24.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
          titleSmall: TextStyle(
              fontSize: 22.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500),
          bodySmall: TextStyle(
              fontSize: 15.sp,
              color: Color(0xffA3A3A3),
              fontWeight: FontWeight.w300)),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: AppColors.primary,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.sp),
          iconTheme: const IconThemeData(color: Colors.black),
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(50)))));
}
