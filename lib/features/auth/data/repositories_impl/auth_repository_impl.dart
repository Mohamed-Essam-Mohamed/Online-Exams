import 'package:injectable/injectable.dart';
import 'package:online_exams/core/api_helper/api_result/api_result.dart';
import 'package:online_exams/features/auth/data/data_sources/auth_data_source.dart';
import 'package:online_exams/features/auth/data/models/request/login_request.dart';
import 'package:online_exams/features/auth/data/models/request/register_request.dart';
import 'package:online_exams/features/auth/data/models/response/auth_response.dart';
import 'package:online_exams/features/auth/data/models/response/forgot_password_response.dart';
import 'package:online_exams/features/auth/data/models/response/rest_password_response.dart';
import 'package:online_exams/features/auth/data/models/response/verify_response.dart';
import 'package:online_exams/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);
  @override
  Future<ApiResult<AuthResponse>> register(RegisterRequest request) async =>
      await dataSource.register(request);

  @override
  Future<ApiResult<AuthResponse>> login(LoginRequest request) async =>
      await dataSource.login(request);

  @override
  Future<ApiResult<ForgotPasswordResponse>> forgotPassword(
          String email) async =>
      await dataSource.forgotPassword(email);
  @override
  Future<ApiResult<VerifyResponse>> verify(String resetCode) async =>
      await dataSource.verify(resetCode);
  @override
  Future<ApiResult<RestPasswordResponse>> restPassword(
          {required String email, required String newPassword}) async =>
      await dataSource.restPassword(email: email, newPassword: newPassword);
}
