import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  static TextStyle size22CP = GoogleFonts.inter(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );
  static TextStyle size16CP = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );
  static TextStyle size14CP = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );
}
