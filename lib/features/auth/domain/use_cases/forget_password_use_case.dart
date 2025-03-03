import 'package:injectable/injectable.dart';
import '../../../../core/api_helper/api_result/api_result.dart';
import '../../data/models/response/forgot_password_response.dart';
import '../repositories/auth_repository.dart';

@injectable
class ForgetPasswordUseCase {
  final AuthRepository repository;

  ForgetPasswordUseCase(this.repository);

  Future<ApiResult<ForgotPasswordResponse>> call(
          {required String email}) async =>
      await repository.forgotPassword(email);
}
