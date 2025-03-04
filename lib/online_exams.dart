import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes/app_routes.dart';
import 'core/utils/app_light_theme.dart';

class OnlineExams extends StatelessWidget {
  const OnlineExams({super.key, required this.routeName});
  final String routeName;

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
        initialRoute: routeName,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
// - create file 