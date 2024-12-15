import 'package:equatable/equatable.dart';
import 'package:sweetsstore/core/utils/app_strings.dart';

abstract class Failure extends Equatable {
  final String _errorMessage;

  String get errorMessage => _errorMessage;

  const Failure(this._errorMessage);
}

const String messageConnectionFailure = AppStrings.errorNoInternetConnection;

class ServerFailure extends Failure {
  final String error;

  const ServerFailure(this.error) : super(error);

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'ServerFailure{errorMessage: $error}';
  }
}

class ConnectionFailure extends Failure {
  const ConnectionFailure() : super(messageConnectionFailure);

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'ConnectionFailure{errorMessage: $messageConnectionFailure}';
  }
}
