import 'package:equatable/equatable.dart';

sealed class ApiResult<T> extends Equatable {
  const ApiResult();

  @override
  List<Object?> get props => [];
}

class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
  @override
  List<Object?> get props => [data];
}

class Error<T> extends ApiResult<T> {
  final String message;
  const Error(this.message);
  @override
  List<Object?> get props => [message];
}
