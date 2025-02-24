import 'package:equatable/equatable.dart';

abstract class Failure implements Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  @override
  bool? get stringify => true;
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);

  @override
  bool? get stringify => true;
}
