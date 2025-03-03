import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:gap/gap.dart';
import 'package:online_exams/core/utils/app_light_theme.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/extensions/navigator_extention.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dailog.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/app_toast.dart';
import '../blocs/forgetpassword/forget_password_cubit.dart';
import '../widgets/resend_button_widget.dart';
import 'reset_pass_screen.dart';

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
    final colorTheme = Theme.of(context).extension<AppThemeExtension>()!;

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
          listener: listenerEmailVerification,
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
                  color: colorTheme.border,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              Gap(32.h),
              VerificationCode(
                textStyle: AppTextStyles.size16CP,
                fillColor: colorTheme.fillVerification,
                // fullBorder: true,
                margin: REdgeInsets.symmetric(horizontal: 3.w),
                underlineColor: colorTheme.primary,
                underlineUnfocusedColor: colorTheme.transparent,
                autofocus: true,
                length: 6,
                cursorColor: colorTheme.primary,
                onCompleted: (String value) async {
                  context
                      .read<ForgetPasswordCubit>()
                      .verifyCode(resetCode: value);
                },
                onEditing: (bool value) {},
              ),
              Gap(24.h),
              ResendButtonWidget(
                resendFunction: () async {
                  // context
                  //     .read<ForgetPasswordCubit>()
                  //     .forgetPassword(email: state.email);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //? listener
  void listenerEmailVerification(
      BuildContext context, ForgetPasswordState state) {
    if (state.isSendCodeLoading) {
      AppDialog.showLoading(context: context, message: "Loading...");
    }
    if (state.isSendCodeSuccess) {
      context.pop();
      context.pushNamed(
        ResetPassScreen.routeName,
        arguments: context.read<ForgetPasswordCubit>(),
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
  }
}
