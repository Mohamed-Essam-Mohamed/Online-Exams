import 'package:injectable/injectable.dart';
import 'package:online_exams/core/api_helper/api_result/api_result.dart';
import 'package:online_exams/features/auth/data/models/request/login_request.dart';
import 'package:online_exams/features/auth/data/models/response/login_response.dart';
import 'package:online_exams/features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:online_exams/features/auth/domain/repositories/auth_repository.dart';

@injectable
class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<ApiResult<RegisterResponse>> call(RegisterRequest request) async =>
      await repository.register(request);
}
