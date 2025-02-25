import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exams/core/api_helper/api_result/api_result.dart';
import 'package:online_exams/core/enums/status.dart';
import 'package:online_exams/features/auth/data/models/request/register_request.dart';
import 'package:online_exams/features/auth/data/models/response/auth_response.dart';
import 'package:online_exams/features/auth/domain/use_cases/register_use_case.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(const RegisterState());
  RegisterUseCase registerUseCase;

  Future<void> register(RegisterRequest registerRequest) async {
    emit(state.copyWith(status: Status.loading));
    final result = await registerUseCase.call(registerRequest);
    switch (result) {
      case Success<AuthResponse>():
        emit(state.copyWith(status: Status.success));
      case Error<AuthResponse>():
        emit(state.copyWith(
          status: Status.error,
          errorMessage: result.message,
        ));
    }
  }
}
