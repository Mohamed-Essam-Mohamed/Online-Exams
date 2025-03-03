import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exams/core/api_helper/api_result/api_result.dart';
import 'package:online_exams/core/enums/status.dart';
import 'package:online_exams/features/auth/data/models/response/forgot_password_response.dart';
import 'package:online_exams/features/auth/data/models/response/rest_password_response.dart';
import 'package:online_exams/features/auth/data/models/response/verify_response.dart';
import 'package:online_exams/features/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:online_exams/features/auth/domain/use_cases/rest_password_use_case.dart';
import 'package:online_exams/features/auth/domain/use_cases/verify_code_use_case.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordUseCase, this.verifyCodeUseCase,
      this.restPasswordUseCase)
      : super(const ForgetPasswordState());
  ForgetPasswordUseCase forgetPasswordUseCase;
  VerifyCodeUseCase verifyCodeUseCase;
  RestPasswordUseCase restPasswordUseCase;

  Future<void> forgetPassword({required String email}) async {
    emit(state.copyWith(sendEmailStatus: Status.loading));
    final result = await forgetPasswordUseCase.call(email: email);
    switch (result) {
      case Success<ForgotPasswordResponse>():
        emit(state.copyWith(sendEmailStatus: Status.success, email: email));
      case Error<ForgotPasswordResponse>():
        emit(state.copyWith(
          sendEmailStatus: Status.error,
          errorMessage: result.message,
        ));
    }
  }

  Future<void> verifyCode({required String resetCode}) async {
    emit(state.copyWith(
        sendCodeStatus: Status.loading, sendEmailStatus: Status.initial));
    final result = await verifyCodeUseCase.call(resetCode);
    switch (result) {
      case Success<VerifyResponse>():
        emit(state.copyWith(sendCodeStatus: Status.success));
      case Error<VerifyResponse>():
        emit(state.copyWith(
          sendCodeStatus: Status.error,
          errorMessage: result.message,
        ));
    }
  }

  Future<void> restPassword({required String newPassword}) async {
    emit(state.copyWith(resPasswordStatus: Status.loading));
    final result = await restPasswordUseCase.call(
        email: state.email, newPassword: newPassword);
    switch (result) {
      case Success<RestPasswordResponse>():
        emit(state.copyWith(resPasswordStatus: Status.success));
      case Error<RestPasswordResponse>():
        log(state.errorMessage);
        emit(state.copyWith(
            resPasswordStatus: Status.error, errorMessage: result.message));
    }
  }
}
