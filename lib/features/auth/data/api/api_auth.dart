import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:online_exams/core/api_helper/api_consumer/api_consumer.dart';
import 'package:online_exams/core/api_helper/api_consumer/dio_consumer.dart';
import 'package:online_exams/core/api_helper/api_result/api_result.dart';
import 'package:online_exams/core/constant/api_const.dart';
import 'package:online_exams/core/utils/app_shared_preference.dart';
import 'package:online_exams/features/auth/data/models/request/login_request.dart';
import 'package:online_exams/features/auth/data/models/request/register_request.dart';
import 'package:online_exams/features/auth/data/models/response/auth_response.dart';
import 'package:online_exams/features/auth/data/models/response/forgot_password_response.dart';

@lazySingleton
class ApiAuth {
  ApiConsumer apiConsumer;

  ApiAuth(this.apiConsumer);
  //? login function
  Future<ApiResult<AuthResponse>> register(RegisterRequest request) async {
    try {
      final response = await apiConsumer.post(
        ApiConst.register,
        data: request.toJson(),
      );
      await SharedPreferencesUtils.saveDataUserPref(
          AuthResponse.fromJson(response));

      return Success(AuthResponse.fromJson(response));
    } on ServerException catch (e) {
      return Error(e.errorMessage.toString());
    } on SocketException catch (e) {
      return const Error("No Internet Connection");
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<ApiResult<AuthResponse>> login(LoginRequest request) async {
    try {
      final response = await apiConsumer.post(
        ApiConst.login,
        data: request.toJson(),
      );
      await SharedPreferencesUtils.saveDataUserPref(
          AuthResponse.fromJson(response));
      return Success(AuthResponse.fromJson(response));
    } on ServerException catch (e) {
      return Error(e.errorMessage.toString());
    } on SocketException catch (e) {
      return const Error("No Internet Connection");
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<ApiResult<ForgotPasswordResponse>> forgotPassword(String email) async {
    try {
      final response = await apiConsumer.post(
        ApiConst.forgetPassword,
        data: {"email": email},
      );

      return Success(ForgotPasswordResponse.fromJson(response));
    } on ServerException catch (e) {
      return Error(e.errorMessage.toString());
    } on SocketException catch (e) {
      return const Error("No Internet Connection");
    } catch (e) {
      return Error(e.toString());
    }
  }
}
