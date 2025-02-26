import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:online_exams/core/app/function_validator.dart';
import 'package:online_exams/core/common/widgets/material_button_widget.dart';
import 'package:online_exams/core/common/widgets/text_form_feild_widget.dart';
import 'package:online_exams/core/extensions/navigator_extention.dart';
import 'package:online_exams/core/utils/app_dailog.dart';
import 'package:online_exams/core/utils/app_toast.dart';
import 'package:online_exams/features/auth/data/models/request/register_request.dart';
import 'package:online_exams/features/auth/presentation/blocs/register/register_cubit.dart';
import 'package:online_exams/features/auth/presentation/widgets/rich_text_widget.dart';
import 'package:online_exams/navigation_bar/navigation_bar_screen.dart';
import 'package:toastification/toastification.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign Up",
        ),
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
          child: BlocListener<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state.isLoading) {
                AppDialog.showLoading(context: context, message: "Loading...");
              }
              if (state.isSuccess) {
                context.pop();
                context.pushNamedAndRemoveUntil(NavigationBarScreen.routeName);
              }
              if (state.isError) {
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
              children: [
                Gap(24.h),
                TextFormFieldWidget(
                  label: "User name",
                  hintText: "Enter user name",
                  controller: userNameController,
                  validator: validateUserName,
                ),
                Gap(24.h),
                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        label: "First name",
                        hintText: "Enter first name",
                        controller: firstNameController,
                        validator: validateName,
                      ),
                    ),
                    Gap(16.w),
                    Expanded(
                      child: TextFormFieldWidget(
                        label: "Last name",
                        hintText: "Enter last name",
                        controller: lastNameController,
                        validator: validateName,
                      ),
                    ),
                  ],
                ),
                Gap(24.h),
                TextFormFieldWidget(
                  label: "Email",
                  hintText: "Enter email",
                  controller: emailController,
                  validator: validateEmail,
                ),
                Gap(24.h),
                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        label: "Password",
                        hintText: "Enter password",
                        controller: passwordController,
                        validator: validatePassword,
                        isPassword: true,
                        obscureText: true,
                      ),
                    ),
                    Gap(16.w),
                    Expanded(
                      child: TextFormFieldWidget(
                        label: "Confirm password",
                        hintText: "Enter confirm password",
                        controller: confirmPasswordController,
                        validator: (value) =>
                            validateRePassword(value, passwordController.text),
                        isPassword: true,
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
                Gap(24.h),
                TextFormFieldWidget(
                  label: "Phone number",
                  hintText: "Enter phone number",
                  controller: phoneController,
                  validator: validatePhone,
                ),
                Gap(48.h),
                MaterialButtonWidget(
                  title: "SignUp",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<RegisterCubit>().register(
                            RegisterRequest(
                              username: userNameController.text,
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              rePassword: confirmPasswordController.text,
                              phone: phoneController.text,
                            ),
                          );
                    }
                  },
                ),
                Gap(16.h),
                RichTextWidget(
                  text: "Already have an account?  ",
                  subText: "Login",
                  onTap: () {
                    context.pop();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // controllers
  late final TextEditingController userNameController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController phoneController;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
