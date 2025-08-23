import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_text_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    primaryColor: AppColors.whiteColor,
    indicatorColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(color: AppColors.blackColor, size: 30),
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: TextTheme(
      titleMedium: AppTextStyle.medium20Black,
      titleLarge: AppTextStyle.medium24Black,
      headlineMedium: AppTextStyle.bold28White,
      headlineSmall: AppTextStyle.medium24White,
      bodyMedium: AppTextStyle.medium20White,
      labelMedium: AppTextStyle.bold16Black,
      labelSmall: AppTextStyle.bold14Black,
      labelLarge: AppTextStyle.medium12Gray,

    ),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.blackColor,
    indicatorColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.blackColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.whiteColor, size: 30),
    ),
    textTheme: TextTheme(
      titleMedium: AppTextStyle.medium20White,
      titleLarge: AppTextStyle.medium24White,
      bodyMedium: AppTextStyle.medium24Black,
      headlineMedium: AppTextStyle.bold28Black,
      headlineSmall: AppTextStyle.medium20Black,
      labelMedium: AppTextStyle.bold16White,

      labelSmall: AppTextStyle.bold14White,
      labelLarge: AppTextStyle.medium12Gray,


    ),
  );
}
