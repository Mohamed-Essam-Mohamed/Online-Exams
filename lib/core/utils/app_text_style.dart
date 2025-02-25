import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exams/core/utils/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle size22CP = GoogleFonts.inter(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );
  static TextStyle size16CP = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );
}
