import 'package:injectable/injectable.dart';
import 'package:online_exams/core/api_helper/api_result/api_result.dart';
import 'package:online_exams/features/auth/domain/repositories/auth_repository.dart';

import '../../data/models/response/verify_response.dart';

@injectable
class VerifyCodeUseCase {
  AuthRepository authRepository;
  VerifyCodeUseCase(this.authRepository);
  Future<ApiResult<VerifyResponse>> call(String resetCode) async =>
      authRepository.verify(resetCode);
}
