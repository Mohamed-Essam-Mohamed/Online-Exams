import 'package:injectable/injectable.dart';
import 'package:online_exams/core/api_helper/api_result/api_result.dart';
import 'package:online_exams/features/auth/data/data_sources/auth_data_source.dart';
import 'package:online_exams/features/auth/data/models/request/login_request.dart';
import 'package:online_exams/features/auth/data/models/response/login_response.dart';
import 'package:online_exams/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);
  @override
  Future<ApiResult<RegisterResponse>> register(RegisterRequest request) async =>
      await dataSource.register(request);
}
