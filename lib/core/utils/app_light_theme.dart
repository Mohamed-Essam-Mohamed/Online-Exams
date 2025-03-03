import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exams/core/utils/app_text_style.dart';
import 'app_colors.dart';

class AppLightTheme {
  static ThemeData theme = ThemeData(
    //? scaffold theme
    scaffoldBackgroundColor: AppColors.scaffold,

    //? define colors scheme

    //? colors extensions
    extensions: const <ThemeExtension<dynamic>>[
      AppThemeExtension(
        black: AppColors.black,
        red: AppColors.red,
        primary: AppColors.primary,
        scaffold: AppColors.scaffold,
        grey: AppColors.grey,
        border: AppColors.border,
        hintText: AppColors.hintText,
        transparent: AppColors.transparent,
        fillVerification: AppColors.fillVerification,
        blackIcon: AppColors.blackIcon,
      ),
    ],

    //? app bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffold,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.black,
        size: 30.sp,
      ),
      titleTextStyle: AppTextStyles.size22CP,
    ),
    //? bottom navigation theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.primary,
      enableFeedback: true,
      // showSelectedLabels: true,
      elevation: 0,

      selectedIconTheme: IconThemeData(
        size: 25.sp,
      ),
      unselectedIconTheme: IconThemeData(
        size: 21.sp,
      ),
      unselectedItemColor: AppColors.grey,
    ),

    //? text form field theme
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder:
          outlineInputBorder(color: AppColors.black, radius: 8.r, width: 1),
      focusedBorder:
          outlineInputBorder(color: AppColors.black, radius: 10, width: 1),
      errorBorder:
          outlineInputBorder(color: AppColors.red, radius: 10, width: 1),
      focusedErrorBorder:
          outlineInputBorder(color: AppColors.red, radius: 10, width: 1),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
      hintStyle: GoogleFonts.inter(
        color: AppColors.grey,
        fontSize: 16,
      ),
      labelStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
  );
}

OutlineInputBorder outlineInputBorder(
    {required double radius, required Color color, required double width}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(color: color, width: width),
  );
}

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color black;
  final Color red;
  final Color primary;
  final Color scaffold;
  final Color grey;
  final Color border;
  final Color hintText;
  final Color transparent;
  final Color fillVerification;
  final Color blackIcon;

  const AppThemeExtension({
    required this.black,
    required this.red,
    required this.primary,
    required this.scaffold,
    required this.grey,
    required this.border,
    required this.hintText,
    required this.transparent,
    required this.fillVerification,
    required this.blackIcon,
  });

  @override
  AppThemeExtension copyWith({
    Color? black,
    Color? red,
    Color? primary,
    Color? scaffold,
    Color? grey,
    Color? border,
    Color? hintText,
    Color? transparent,
    Color? fillVerification,
    Color? blackIcon,
  }) {
    return AppThemeExtension(
      black: black ?? this.black,
      red: red ?? this.red,
      primary: primary ?? this.primary,
      scaffold: scaffold ?? this.scaffold,
      grey: grey ?? this.grey,
      border: border ?? this.border,
      hintText: hintText ?? this.hintText,
      transparent: transparent ?? this.transparent,
      fillVerification: fillVerification ?? this.fillVerification,
      blackIcon: blackIcon ?? this.blackIcon,
    );
  }

  @override
  AppThemeExtension lerp(AppThemeExtension? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      black: Color.lerp(black, other.black, t) ?? black,
      red: Color.lerp(red, other.red, t) ?? red,
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      scaffold: Color.lerp(scaffold, other.scaffold, t) ?? scaffold,
      grey: Color.lerp(grey, other.grey, t) ?? grey,
      border: Color.lerp(border, other.border, t) ?? border,
      hintText: Color.lerp(hintText, other.hintText, t) ?? hintText,
      transparent: Color.lerp(transparent, other.transparent, t) ?? transparent,
      fillVerification:
          Color.lerp(fillVerification, other.fillVerification, t) ??
              fillVerification,
      blackIcon: Color.lerp(blackIcon, other.blackIcon, t) ?? blackIcon,
    );
  }
}
