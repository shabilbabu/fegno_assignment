import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fegno_assignment/domain/entity/signup_entity.dart';
import 'package:fegno_assignment/domain/entity/verify_otp_entity.dart';
import 'package:fegno_assignment/domain/repository/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  late final SignupEntity signupEntity;
  AuthBloc(this.authRepo) : super(AuthState()) {
    on<SignupEvent>((event, emit) async {
      if (event.phoneNumber.isEmpty) {
        emit(AuthState.hasError('Phone number is required'));
      } else if (event.fullName.isEmpty) {
        emit(AuthState.hasError('Fullname is required'));
      } else if (event.phoneNumber.length != 10) {
        emit(AuthState.hasError('Enter valid Phone number'));
      } else {
        emit(AuthState.started());
        try {
          signupEntity = await authRepo.signUp(phoneNumber: event.phoneNumber, name: event.fullName);
          emit(AuthState.successSignup(signupEntity));
        } catch (e) {
          emit(AuthState.hasError(e.toString()));
        }
      }
    });


    on<OtpCountdown>((event, emit) async {
      if (state.countDown == 30) {
        var s = await Stream.periodic(const Duration(seconds: 1), (c) => state.countDown == 1 ? 30 : state.countDown - 1).take(30);
        await emit.forEach(s, onData: (v) => AuthState.countDown(v));
      }
    });

    

    on<VerifyOtp>((event, emit) async {
      if (event.otp.length != 4) {
        emit(AuthState(errorMessage: 'Enter valid OTP', signupEntity: state.signupEntity));
      } else {
        emit(AuthState.started());
        try {
          final response = await authRepo.verifyOtp(phoneNumber: signupEntity.mobile!, otp: event.otp);
          emit(AuthState.successVerifyOtp(response));
        } catch (e) {
          emit(AuthState.hasError(e.toString()));
        }
      }
    });
  }
}