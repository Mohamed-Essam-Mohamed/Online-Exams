import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:gap/gap.dart';
import 'package:online_exams/core/extensions/navigator_extention.dart';
import 'package:online_exams/core/utils/app_colors.dart';
import 'package:online_exams/core/utils/app_dailog.dart';
import 'package:online_exams/core/utils/app_text_style.dart';
import 'package:online_exams/core/utils/app_toast.dart';
import 'package:online_exams/features/auth/presentation/blocs/forgetpassword/forget_password_cubit.dart';
import 'package:online_exams/features/auth/presentation/pages/reset_pass_screen.dart';
import 'package:online_exams/features/auth/presentation/widgets/resend_button_widget.dart';
import 'package:toastification/toastification.dart';

class EmailVerificationScreen extends StatefulWidget {
  static const String routeName = 'email-verification';
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
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
        child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state.isSendCodeLoading) {
              AppDialog.showLoading(context: context, message: "Loading...");
            }
            if (state.isSendCodeSuccess) {
              context.pop();
              context.pushNamed(
                ResetPassScreen.routeName,
              );
            }
            if (state.isSendCodeError) {
              context.pop();
              AppToast.showToast(
                context: context,
                title: "Error",
                description: state.errorMessage,
                type: ToastificationType.error,
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(40.h),
              Text(
                "Email Verification",
                style: AppTextStyles.size16CP
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              Gap(10.h),
              Text(
                "Please enter your code that send to your email address ",
                style: AppTextStyles.size14CP.copyWith(
                  color: AppColors.border,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              Gap(32.h),
              VerificationCode(
                textStyle: AppTextStyles.size16CP,
                fillColor: AppColors.fillVerification,
                // fullBorder: true,
                margin: REdgeInsets.symmetric(horizontal: 3.w),
                underlineColor: AppColors.primary,
                underlineUnfocusedColor: AppColors.transparent,
                autofocus: true,
                length: 6,
                cursorColor: AppColors.primary,
                onCompleted: (String value) async {
                  context
                      .read<ForgetPasswordCubit>()
                      .verifyCode(resetCode: value);
                },
                onEditing: (bool value) {},
              ),
              Gap(24.h),
              // ResendButtonWidget(
              //   resendFunction: () async {
              //     // context
              //     //     .read<ForgetPasswordCubit>()
              //     //     .forgetPassword(email: state.email);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
