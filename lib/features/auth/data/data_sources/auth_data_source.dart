import 'package:injectable/injectable.dart';

import '../../../../core/api_helper/api_result/api_result.dart';
import '../api/api_auth.dart';
import '../models/request/login_request.dart';
import '../models/request/register_request.dart';
import '../models/response/auth_response.dart';
import '../models/response/forgot_password_response.dart';
import '../models/response/rest_password_response.dart';
import '../models/response/verify_response.dart';

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
