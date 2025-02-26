part of 'login_cubit.dart';

extension RegisterStatusX on LoginState {
  bool get isInitial => status == Status.initial;
  bool get isLoading => status == Status.loading;
  bool get isSuccess => status == Status.success;
  bool get isError => status == Status.error;
}

class LoginState extends Equatable {
  final Status status;
  final String errorMessage;
  const LoginState({
    this.status = Status.initial,
    this.errorMessage = '',
  });
  LoginState copyWith({
    Status? status,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, errorMessage];
}
