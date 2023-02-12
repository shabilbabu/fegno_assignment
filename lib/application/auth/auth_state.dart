part of 'auth_bloc.dart';

@immutable
class AuthState {

  final int  countDown ;


  final bool? isLoading;
  final SignupEntity? signupEntity;
  final String? errorMessage;
  AuthState({this.isLoading, this.signupEntity, this.errorMessage, this.countDown = 30});
  factory AuthState.initial() => AuthState();
  factory AuthState.started() =>
      AuthState(isLoading: true, errorMessage: null, signupEntity: null);
  factory AuthState.hasError(String message) =>
      AuthState(isLoading: null, errorMessage: message, signupEntity: null);
  factory AuthState.success(SignupEntity signupEntity) => AuthState(
      isLoading: null, errorMessage: null, signupEntity: signupEntity);
      factory AuthState.countDown(int count) => AuthState(
      isLoading: null, errorMessage: null, signupEntity: null, countDown: count);

      
}
