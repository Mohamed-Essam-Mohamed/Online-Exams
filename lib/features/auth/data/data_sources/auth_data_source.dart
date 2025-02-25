import 'package:injectable/injectable.dart';
import 'package:online_exams/core/api_helper/api_result/api_result.dart';
import 'package:online_exams/features/auth/data/api/api_auth.dart';
import 'package:online_exams/features/auth/data/models/request/login_request.dart';
import 'package:online_exams/features/auth/data/models/response/login_response.dart';

@injectable
class AuthDataSource {
  ApiAuth api;
  AuthDataSource(this.api);

  Future<ApiResult<RegisterResponse>> register(RegisterRequest request) async =>
      await api.register(request);
}
