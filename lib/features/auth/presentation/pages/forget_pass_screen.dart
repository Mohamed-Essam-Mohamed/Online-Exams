import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:online_exams/core/utils/app_light_theme.dart';
import '../../../../core/app/function_validator.dart';
import '../../../../core/common/widgets/material_button_widget.dart';
import '../../../../core/common/widgets/text_form_feild_widget.dart';
import '../../../../core/extensions/navigator_extention.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dailog.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/app_toast.dart';
import '../blocs/forgetpassword/forget_password_cubit.dart';
import 'email_verification_screen.dart';
import 'package:toastification/toastification.dart';

class ForgetPassScreen extends StatefulWidget {
  static const String routeName = 'forget-pass';
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
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
        child: Form(
          key: formKey,
          child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
            listenWhen: (previous, current) {
              return previous != current;
            },
            listener: listenerForgetPassword,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(40.h),
                Text(
                  "Forget Password",
                  style: AppTextStyles.size16CP
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Gap(10.h),
                Text(
                  "Please enter your email associated to your account",
                  style: AppTextStyles.size14CP.copyWith(
                    color: colorTheme.border,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(24.h),
                TextFormFieldWidget(
                  label: "Email",
                  hintText: "Enter your email",
                  controller: emailController,
                  validator: validateEmail,
                ),
                Gap(24.h),
                MaterialButtonWidget(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context
                          .read<ForgetPasswordCubit>()
                          .forgetPassword(email: emailController.text);
                    }
                  },
                  title: "Continue",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //? controller
  late final TextEditingController emailController;
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  //? listener forget password cubit
  void listenerForgetPassword(BuildContext context, ForgetPasswordState state) {
    if (state.isSendEmailLoading) {
      AppDialog.showLoading(context: context, message: "Loading...");
    }
    if (state.isSendEmailSuccess) {
      context.pop();
      context.pushNamed(
        EmailVerificationScreen.routeName,
        arguments: context.read<ForgetPasswordCubit>(),
      );
    }
    if (state.isSendEmailError) {
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
