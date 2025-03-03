import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/app/function_validator.dart';
import '../../../../core/common/widgets/material_button_widget.dart';
import '../../../../core/common/widgets/text_form_feild_widget.dart';
import '../../../../core/extensions/navigator_extention.dart';
import '../../../../core/utils/app_dailog.dart';
import '../../../../core/utils/app_toast.dart';
import '../../data/models/request/login_request.dart';
import '../blocs/login/login_cubit.dart';
import 'register_screen.dart';
import '../widgets/rich_text_widget.dart';
import '../widgets/section_remember_forget_wdiget.dart';
import '../../../../navigation_bar/navigation_bar_screen.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        leading: const IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: null,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Form(
          key: formKey,
          child: BlocListener<LoginCubit, LoginState>(
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
                  label: "Email",
                  hintText: "Enter your email",
                  controller: emailController,
                  validator: validateEmail,
                ),
                Gap(24.h),
                TextFormFieldWidget(
                  label: "Password",
                  hintText: "Enter your password",
                  controller: passwordController,
                  validator: validatePassword,
                  isPassword: true,
                  obscureText: true,
                ),
                Gap(14.h),
                const SectionRememberForget(),
                Gap(48.h),
                MaterialButtonWidget(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<LoginCubit>().login(
                            LoginRequest(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                    }
                  },
                  title: "Login",
                ),
                Gap(16.h),
                RichTextWidget(
                  text: "Don't have an account?  ",
                  subText: "Sign Up",
                  onTap: () {
                    context.pushNamed(RegisterScreen.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
