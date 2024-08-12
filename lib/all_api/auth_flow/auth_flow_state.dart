part of 'auth_flow_bloc.dart';


sealed class AuthFlowState {}

final class AuthFlowInitial extends AuthFlowState {}
//Login Api State
final class AuthFlowLoading extends AuthFlowState {}

final class LogSuccess extends AuthFlowState {
  final Map<String ,dynamic> logResponse;
  LogSuccess(this.logResponse);

}
final class LogFailure extends AuthFlowState {

  final String failureMessage;
  LogFailure(this.failureMessage);

}


final class AuthFlowServerFailure extends AuthFlowState {
  final String error;
  AuthFlowServerFailure(this.error);

}


class CheckNetworkConnection extends AuthFlowState {
  final String errorMessage;
  CheckNetworkConnection(this.errorMessage);
}