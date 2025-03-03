// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_cubit.dart';

extension RegisterStatusX on RegisterState {
  bool get isInitial => status == Status.initial;
  bool get isLoading => status == Status.loading;
  bool get isSuccess => status == Status.success;
  bool get isError => status == Status.error;
}

class RegisterState extends Equatable {
  final Status status;
  final String errorMessage;
  const RegisterState({
    this.status = Status.initial,
    this.errorMessage = '',
  });

  RegisterState copyWith({
    Status? status,
    String? errorMessage,
  }) {
    return RegisterState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
