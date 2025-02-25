import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exams/core/utils/app_colors.dart';
import 'package:online_exams/core/utils/app_text_style.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColors.primaryColor,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 14.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Text(
        "SignUp",
        style: AppTextStyles.size16CP.copyWith(
          color: AppColors.scaffoldColor,
        ),
      ),
    );
  }
}
