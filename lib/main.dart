import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exams/core/api_helper/api_result/api_result.dart';
import 'package:online_exams/core/app/bloc_observer.dart';
import 'package:online_exams/core/app/di/service_locator.dart';
import 'package:online_exams/features/auth/data/api/api_auth.dart';
import 'package:online_exams/features/auth/data/models/request/login_request.dart';
import 'package:online_exams/features/auth/data/models/response/login_response.dart';
import 'package:online_exams/online_exams.dart';
import 'package:regexpattern/regexpattern.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  // ApiAuth apiAuth = getIt.get<ApiAuth>();
  // var result = await apiAuth.register(RegisterRequest(
  //   email: '2EasdfYdH@example.com',
  //   password: 'mohamed@123',
  //   firstName: 'ahmed',
  //   lastName: 'mohamed',
  //   phone: '0123456789',
  //   rePassword: 'mohamed@123',
  //   username: 'ahmed',
  // ));
  // switch (result) {
  //   case Success<RegisterResponse>():
  //     log(result.data.token.toString());
  //   case Error():
  //     log(result.message.toString());
  // }

  Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(const OnlineExams()));
}
