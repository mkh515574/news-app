import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    primaryColor: AppColors.whiteColor,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.blackColor,
  );
}
