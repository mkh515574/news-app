import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/app_colors.dart';

class AppTextStyle {
  static final TextStyle medium24Black = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
  static final TextStyle medium24White = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static final TextStyle medium20White = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static final TextStyle medium20Black = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
  static final TextStyle bold28Black = GoogleFonts.inter(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );
  static final TextStyle bold28White = GoogleFonts.inter(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
}
