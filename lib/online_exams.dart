import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exams/core/routes/app_routes.dart';
import 'package:online_exams/core/utils/app_light_theme.dart';
import 'package:online_exams/features/auth/presentation/pages/login_screen.dart';

class OnlineExams extends StatelessWidget {
  const OnlineExams({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppLightTheme.theme,
        themeMode: ThemeMode.light,
        initialRoute: LoginScreen.routeName,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
// - create file 