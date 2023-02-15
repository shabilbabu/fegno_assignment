part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignupEvent extends AuthEvent {
  final String phoneNumber;
  final String fullName;

  SignupEvent({required this.phoneNumber, required this.fullName});
}

class OtpCountdownEvent extends AuthEvent {}

class VerifyOtpEvent extends AuthEvent {
  final String otp;
  VerifyOtpEvent({required this.otp});
}