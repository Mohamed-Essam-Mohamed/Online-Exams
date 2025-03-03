import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/app/function_validator.dart';
import '../../../../core/common/widgets/material_button_widget.dart';
import '../../../../core/common/widgets/text_form_feild_widget.dart';
import '../../../../core/extensions/navigator_extention.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dailog.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/app_toast.dart';
import '../../../../navigation_bar/navigation_bar_screen.dart';
import '../blocs/forgetpassword/forget_password_cubit.dart';

class ResetPassScreen extends StatefulWidget {
  static const String routeName = 'resetPass';
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
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
          listener: listenerResetPassword,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Gap(40.h),
                Text(
                  "Reset password",
                  style: AppTextStyles.size16CP
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Gap(10.h),
                Text(
                  "Password must not be empty and must contain 6 characters with upper case letter and one number at least  ",
                  style: AppTextStyles.size14CP.copyWith(
                    color: AppColors.border,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(32.h),
                TextFormFieldWidget(
                  label: "Password",
                  hintText: "Enter password",
                  controller: passwordController,
                  validator: validatePassword,
                  isPassword: true,
                  obscureText: true,
                ),
                Gap(16.w),
                TextFormFieldWidget(
                  label: "Confirm password",
                  hintText: "Enter confirm password",
                  controller: confirmPasswordController,
                  validator: (value) =>
                      validateRePassword(value, passwordController.text),
                  isPassword: true,
                  obscureText: true,
                ),
                Gap(48.h),
                MaterialButtonWidget(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context
                          .read<ForgetPasswordCubit>()
                          .restPassword(newPassword: passwordController.text);
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
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  //? listener
  void listenerResetPassword(BuildContext context, ForgetPasswordState state) {
    if (state.isResetPasswordLoading) {
      AppDialog.showLoading(context: context, message: "Loading...");
    }
    if (state.isResetPasswordSuccess) {
      context.pop();
      context.pushNamedAndRemoveUntil(
        NavigationBarScreen.routeName,
      );
    }
    if (state.isResetPasswordError) {
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
