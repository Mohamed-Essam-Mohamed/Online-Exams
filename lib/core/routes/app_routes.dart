import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exams/core/app/di/service_locator.dart';
import 'package:online_exams/core/routes/animation_routes.dart';
import 'package:online_exams/features/auth/presentation/blocs/forgetpassword/forget_password_cubit.dart';
import 'package:online_exams/features/auth/presentation/blocs/login/login_cubit.dart';
import 'package:online_exams/features/auth/presentation/blocs/register/register_cubit.dart';
import 'package:online_exams/features/auth/presentation/pages/email_verification_screen.dart';
import 'package:online_exams/features/auth/presentation/pages/forget_pass_screen.dart';
import 'package:online_exams/features/auth/presentation/pages/login_screen.dart';
import 'package:online_exams/features/auth/presentation/pages/register_screen.dart';
import 'package:online_exams/features/auth/presentation/pages/reset_pass_screen.dart';
import 'package:online_exams/navigation_bar/navigation_bar_screen.dart';

class AppRoutes {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case LoginScreen.routeName:
        return AnimationRoute(
          page: BlocProvider(
            create: (context) => getIt.get<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case RegisterScreen.routeName:
        return AnimationRoute(
          page: BlocProvider<RegisterCubit>(
            create: (context) => getIt.get<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case ForgetPassScreen.routeName:
        return AnimationRoute(
            page: BlocProvider(
          create: (context) => getIt.get<ForgetPasswordCubit>(),
          child: const ForgetPassScreen(),
        ));
      case EmailVerificationScreen.routeName:
        return AnimationRoute(page: const EmailVerificationScreen());
      case ResetPassScreen.routeName:
        return AnimationRoute(page: const ResetPassScreen());
      case NavigationBarScreen.routeName:
        return AnimationRoute(page: const NavigationBarScreen());

      default:
        return AnimationRoute(page: const LoginScreen());
    }
  }
}
