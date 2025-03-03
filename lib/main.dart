import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app/bloc_observer.dart';
import 'core/app/di/service_locator.dart';
import 'core/constant/preferences_const.dart';
import 'core/utils/app_shared_preference.dart';
import 'features/auth/presentation/pages/login_screen.dart';
import 'navigation_bar/navigation_bar_screen.dart';
import 'online_exams.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferencesUtils.init();
  final String routeName;
  var token = SharedPreferencesUtils.getData(key: PreferencesConst.token);
  // if (token != null) {
  //   routeName = NavigationBarScreen.routeName;
  // } else {
  //   routeName = LoginScreen.routeName;
  // }
  routeName = LoginScreen.routeName;

  Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(OnlineExams(routeName: routeName)));
}
