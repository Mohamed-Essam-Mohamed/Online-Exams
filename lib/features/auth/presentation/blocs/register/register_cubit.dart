import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exams/core/api_helper/api_result/api_result.dart';
import 'package:online_exams/features/auth/data/models/request/login_request.dart';
import 'package:online_exams/features/auth/data/models/response/login_response.dart';
import 'package:online_exams/features/auth/domain/use_cases/register_use_case.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(const RegisterState());
  RegisterUseCase registerUseCase;

  Future<void> register(RegisterRequest registerRequest) async {
    emit(state.copyWith(status: RegisterStatus.loading));
    final result = await registerUseCase.call(registerRequest);
    switch (result) {
      case Success<RegisterResponse>():
        emit(state.copyWith(status: RegisterStatus.success));
      case Error<RegisterResponse>():
        emit(state.copyWith(
          status: RegisterStatus.error,
          errorMessage: result.message,
        ));
    }
  }
}
