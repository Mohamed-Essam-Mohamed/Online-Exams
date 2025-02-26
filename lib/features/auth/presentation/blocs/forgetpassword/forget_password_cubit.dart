import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exams/core/api_helper/api_result/api_result.dart';
import 'package:online_exams/core/enums/status.dart';
import 'package:online_exams/features/auth/data/models/response/forgot_password_response.dart';
import 'package:online_exams/features/auth/domain/use_cases/forget_password_use_case.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordUseCase)
      : super(const ForgetPasswordState());
  ForgetPasswordUseCase forgetPasswordUseCase;

  Future<void> forgetPassword({required String email}) async {
    emit(state.copyWith(status: Status.loading));
    final result = await forgetPasswordUseCase.call(email: email);
    switch (result) {
      case Success<ForgotPasswordResponse>():
        emit(state.copyWith(status: Status.success));
      case Error<ForgotPasswordResponse>():
        emit(state.copyWith(
          status: Status.error,
          errorMessage: result.message,
        ));
    }
  }
}
