import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exams/core/app/bloc_observer.dart';
import 'package:online_exams/core/app/di/service_locator.dart';
import 'package:online_exams/core/utils/app_shared_preference.dart';
import 'package:online_exams/features/auth/data/models/response/auth_response.dart';
import 'package:online_exams/features/auth/presentation/pages/login_screen.dart';
import 'package:online_exams/navigation_bar/navigation_bar_screen.dart';
import 'package:online_exams/online_exams.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferencesUtils.init();
  final String routeName;
  AuthResponse? user = await SharedPreferencesUtils.getDataUserPref();
  if (user != null) {
    routeName = NavigationBarScreen.routeName;
  } else {
    routeName = LoginScreen.routeName;
  }

  Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(OnlineExams(routeName: routeName)));
}
