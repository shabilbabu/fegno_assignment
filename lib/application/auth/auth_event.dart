part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignupEvent extends AuthEvent {
  final String phoneNumber;
  final String fullName;

  SignupEvent({required this.phoneNumber, required this.fullName});
}

class OtpCountdown extends AuthEvent {}

class VerifyOtp extends AuthEvent {
  final String otp;

  VerifyOtp({required this.otp});
}
