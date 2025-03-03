import 'package:injectable/injectable.dart';
import 'package:online_exams/core/api_helper/api_result/api_result.dart';
import 'package:online_exams/features/auth/data/api/api_auth.dart';
import 'package:online_exams/features/auth/data/models/request/login_request.dart';
import 'package:online_exams/features/auth/data/models/request/register_request.dart';
import 'package:online_exams/features/auth/data/models/response/auth_response.dart';
import 'package:online_exams/features/auth/data/models/response/forgot_password_response.dart';
import 'package:online_exams/features/auth/data/models/response/rest_password_response.dart';
import 'package:online_exams/features/auth/data/models/response/verify_response.dart';

@injectable
class AuthDataSource {
  ApiAuth api;
  AuthDataSource(this.api);

  Future<ApiResult<AuthResponse>> register(RegisterRequest request) async =>
      await api.register(request);

  Future<ApiResult<AuthResponse>> login(LoginRequest request) async =>
      await api.login(request);

  Future<ApiResult<ForgotPasswordResponse>> forgotPassword(
          String email) async =>
      await api.forgotPassword(email);

  Future<ApiResult<VerifyResponse>> verify(String resetCode) async =>
      await api.verify(resetCode);

  Future<ApiResult<RestPasswordResponse>> restPassword(
          {required String email, required String newPassword}) async =>
      await api.restPassword(email: email, newPassword: newPassword);
}
