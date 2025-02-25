import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exams/core/utils/app_colors.dart';

class AppLightTheme {
  static ThemeData theme = ThemeData(
    primaryColor: AppColors.primaryColor,
    canvasColor: AppColors.scaffoldColor,
    disabledColor: AppColors.greyColor,
    hintColor: AppColors.hintTextColor,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffoldColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.blackColor,
        size: 30.sp,
      ),
      titleTextStyle: GoogleFonts.inter(
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.blackColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.primaryColor,
      enableFeedback: true,
      // showSelectedLabels: true,
      elevation: 0,

      selectedIconTheme: IconThemeData(
        size: 25.sp,
      ),
      unselectedIconTheme: IconThemeData(
        size: 21.sp,
      ),
      unselectedItemColor: AppColors.greyColor,
    ),
  );
}
