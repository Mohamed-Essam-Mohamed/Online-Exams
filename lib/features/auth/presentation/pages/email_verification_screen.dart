import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:online_exams/core/extensions/navigator_extention.dart';
import 'package:online_exams/core/utils/app_colors.dart';
import 'package:online_exams/core/utils/app_text_style.dart';

class EmailVerificationScreen extends StatelessWidget {
  static const String routeName = 'email-verification';
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          children: [
            Gap(40.h),
            Text(
              "Email Verification",
              style:
                  AppTextStyles.size16CP.copyWith(fontWeight: FontWeight.w500),
            ),
            Gap(10.h),
            Text(
              "Please enter your code that send to your email address ",
              style: AppTextStyles.size14CP.copyWith(
                color: AppColors.borderColor,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
