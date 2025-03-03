import 'package:injectable/injectable.dart';
import '../../../../core/api_helper/api_result/api_result.dart';
import '../../data/models/request/register_request.dart';
import '../../data/models/response/auth_response.dart';
import '../repositories/auth_repository.dart';

@injectable
class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<ApiResult<AuthResponse>> call(RegisterRequest request) async =>
      await repository.register(request);
}
