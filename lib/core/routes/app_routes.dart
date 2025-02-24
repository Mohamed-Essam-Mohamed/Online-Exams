import 'package:flutter/material.dart';
import 'package:online_exams/core/routes/animation_routes.dart';
import 'package:online_exams/features/auth/presentation/pages/email_verification_screen.dart';
import 'package:online_exams/features/auth/presentation/pages/forget_pass_screen.dart';
import 'package:online_exams/features/auth/presentation/pages/login_screen.dart';
import 'package:online_exams/features/auth/presentation/pages/register_screen.dart';
import 'package:online_exams/features/auth/presentation/pages/reset_pass_screen.dart';

class AppRoutes {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case LoginScreen.routeName:
        return AnimationRoute(page: const LoginScreen());
      case RegisterScreen.routeName:
        return AnimationRoute(page: const RegisterScreen());
      case EmailVerificationScreen.routeName:
        return AnimationRoute(page: const EmailVerificationScreen());
      case ForgetPassScreen.routeName:
        return AnimationRoute(page: const ForgetPassScreen());
      case ResetPassScreen.routeName:
        return AnimationRoute(page: const ResetPassScreen());

      default:
        return AnimationRoute(page: const LoginScreen());
    }
  }
}
