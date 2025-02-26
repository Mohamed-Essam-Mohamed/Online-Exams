import 'package:injectable/injectable.dart';
import 'package:online_exams/core/api_helper/api_result/api_result.dart';
import 'package:online_exams/features/auth/data/models/response/forgot_password_response.dart';
import 'package:online_exams/features/auth/domain/repositories/auth_repository.dart';

@injectable
class ForgetPasswordUseCase {
  final AuthRepository repository;

  ForgetPasswordUseCase(this.repository);

  Future<ApiResult<ForgotPasswordResponse>> call(
          {required String email}) async =>
      await repository.forgotPassword(email);
}
