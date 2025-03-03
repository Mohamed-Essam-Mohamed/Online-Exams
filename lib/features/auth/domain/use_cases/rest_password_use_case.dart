import 'package:injectable/injectable.dart';
import '../../../../core/api_helper/api_result/api_result.dart';
import '../../data/models/response/rest_password_response.dart';
import '../repositories/auth_repository.dart';

@injectable
class RestPasswordUseCase {
  final AuthRepository authRepository;
  RestPasswordUseCase(this.authRepository);

  Future<ApiResult<RestPasswordResponse>> call(
          {required String email, required String newPassword}) async =>
      authRepository.restPassword(email: email, newPassword: newPassword);
}
