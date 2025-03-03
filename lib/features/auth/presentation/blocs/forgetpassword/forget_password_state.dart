part of 'forget_password_cubit.dart';

extension RegisterStatusX on ForgetPasswordState {
  // send email
  bool get isSendEmailInitial => sendEmailStatus == Status.initial;
  bool get isSendEmailLoading => sendEmailStatus == Status.loading;
  bool get isSendEmailSuccess => sendEmailStatus == Status.success;
  bool get isSendEmailError => sendEmailStatus == Status.error;
  // send code
  bool get isSendCodeInitial => sendCodeStatus == Status.initial;
  bool get isSendCodeLoading => sendCodeStatus == Status.loading;
  bool get isSendCodeSuccess => sendCodeStatus == Status.success;
  bool get isSendCodeError => sendCodeStatus == Status.error;
  // reset password status
  bool get isResetPasswordInitial => resPasswordStatus == Status.initial;
  bool get isResetPasswordLoading => resPasswordStatus == Status.loading;
  bool get isResetPasswordSuccess => resPasswordStatus == Status.success;
  bool get isResetPasswordError => resPasswordStatus == Status.error;
}

class ForgetPasswordState extends Equatable {
  final Status sendEmailStatus;
  final Status sendCodeStatus;
  final Status resPasswordStatus;
  final String errorMessage;
  final String email;
  const ForgetPasswordState({
    this.sendEmailStatus = Status.initial,
    this.sendCodeStatus = Status.initial,
    this.resPasswordStatus = Status.initial,
    this.errorMessage = '',
    this.email = '',
  });
  ForgetPasswordState copyWith({
    Status? sendEmailStatus,
    Status? sendCodeStatus,
    Status? resPasswordStatus,
    String? errorMessage,
    String? email,
  }) {
    return ForgetPasswordState(
      sendEmailStatus: sendEmailStatus ?? this.sendEmailStatus,
      sendCodeStatus: sendCodeStatus ?? this.sendCodeStatus,
      resPasswordStatus: resPasswordStatus ?? this.resPasswordStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
    );
  }

  @override
  List<Object> get props =>
      [sendEmailStatus, errorMessage, email, sendCodeStatus, resPasswordStatus];
}
