import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fegno_assignment/domain/entity/signup_entity.dart';
import 'package:fegno_assignment/domain/repository/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  AuthBloc(this.authRepo) : super(AuthState()) {
    on<SignupEvent>((event, emit) async {
      emit(AuthState.started());

      try {
        final response = await authRepo.signUp(
            phoneNumber: event.phoneNumber, name: event.fullName);
        emit(AuthState.success(response));
      } catch (e) {
        emit(AuthState.hasError(e.toString()));
      }
    });

    on<ResendOtp>((event, emit) {
      Timer.periodic(const Duration(seconds: 1), (_) {
        if (state.countDown != 0) {
          log(state.countDown.toString());
          // emit(AuthState.countDown(30));
          
        } else {
          log('else');
        }
      });
    });
  }
}
