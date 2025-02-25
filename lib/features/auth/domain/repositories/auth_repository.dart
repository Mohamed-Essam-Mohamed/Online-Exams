import 'package:online_exams/core/api_helper/api_result/api_result.dart';
import 'package:online_exams/features/auth/data/models/request/login_request.dart';
import 'package:online_exams/features/auth/data/models/response/login_response.dart';

abstract class AuthRepository {
  Future<ApiResult<RegisterResponse>> register(RegisterRequest request);
}
