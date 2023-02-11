part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}


class SignupEvent extends AuthEvent {
  final String phoneNumber;

  SignupEvent({required this.phoneNumber});
}