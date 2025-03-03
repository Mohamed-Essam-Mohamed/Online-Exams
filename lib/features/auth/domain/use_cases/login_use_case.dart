import 'package:injectable/injectable.dart';

import '../../../../core/api_helper/api_result/api_result.dart';
import '../../data/models/request/login_request.dart';
import '../../data/models/response/auth_response.dart';
import '../repositories/auth_repository.dart';

@injectable
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<ApiResult<AuthResponse>> call(LoginRequest request) async =>
      await repository.login(request);
}
