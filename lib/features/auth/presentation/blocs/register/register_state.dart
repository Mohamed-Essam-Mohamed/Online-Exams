// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_cubit.dart';

enum RegisterStatus { initial, loading, success, error }

extension RegisterStatusX on RegisterState {
  bool get isInitial => status == RegisterStatus.initial;
  bool get isLoading => status == RegisterStatus.loading;
  bool get isSuccess => status == RegisterStatus.success;
  bool get isError => status == RegisterStatus.error;
}

class RegisterState extends Equatable {
  final RegisterStatus status;
  final String errorMessage;
  const RegisterState({
    this.status = RegisterStatus.initial,
    this.errorMessage = '',
  });

  RegisterState copyWith({
    RegisterStatus? status,
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
