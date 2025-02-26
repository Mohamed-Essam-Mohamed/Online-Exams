part of 'forget_password_cubit.dart';

extension RegisterStatusX on ForgetPasswordState {
  bool get isInitial => status == Status.initial;
  bool get isLoading => status == Status.loading;
  bool get isSuccess => status == Status.success;
  bool get isError => status == Status.error;
}

class ForgetPasswordState extends Equatable {
  final Status status;
  final String errorMessage;
  const ForgetPasswordState({
    this.status = Status.initial,
    this.errorMessage = '',
  });
  ForgetPasswordState copyWith({
    Status? status,
    String? errorMessage,
  }) {
    return ForgetPasswordState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, errorMessage];
}
