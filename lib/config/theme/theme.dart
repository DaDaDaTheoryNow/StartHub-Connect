import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starthub_connect/config/theme/app_colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: kBlueColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.bold),
    ),
    /*scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.blue,
      foregroundColor: Colors.white,
    )),
    textTheme: const TextTheme(
        labelLarge: TextStyle(
      color: Colors.white,
    )),*/
  );
}
