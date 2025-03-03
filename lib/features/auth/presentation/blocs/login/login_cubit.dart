import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/api_helper/api_result/api_result.dart';
import '../../../../../core/enums/status.dart';
import '../../../data/models/request/login_request.dart';
import '../../../data/models/response/auth_response.dart';
import '../../../domain/use_cases/login_use_case.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(const LoginState());
  LoginUseCase loginUseCase;
  Future<void> login(LoginRequest loginRequest) async {
    emit(state.copyWith(status: Status.loading));
    final result = await loginUseCase.call(loginRequest);
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
