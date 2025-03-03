import '../../../../core/api_helper/api_result/api_result.dart';
import '../../data/models/request/login_request.dart';
import '../../data/models/request/register_request.dart';
import '../../data/models/response/auth_response.dart';
import '../../data/models/response/forgot_password_response.dart';
import '../../data/models/response/rest_password_response.dart';
import '../../data/models/response/verify_response.dart';

abstract class AuthRepository {
  Future<ApiResult<AuthResponse>> register(RegisterRequest request);
  Future<ApiResult<AuthResponse>> login(LoginRequest request);
  Future<ApiResult<ForgotPasswordResponse>> forgotPassword(String email);
  Future<ApiResult<VerifyResponse>> verify(String resetCode);
  Future<ApiResult<RestPasswordResponse>> restPassword(
      {required String email, required String newPassword});
}
