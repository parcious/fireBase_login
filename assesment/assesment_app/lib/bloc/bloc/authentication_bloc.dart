import 'package:assesment_app/bloc/bloc/authentication_event.dart';
import 'package:assesment_app/bloc/bloc/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitialState()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await _auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(AuthSuccessState());
      } catch (e) {
        emit(AuthErrorState(error: e.toString()));
      }
    });

    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await _auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(AuthRegisterSuccessState());
      } catch (e) {
        emit(AuthErrorState(error: e.toString()));
      }
    });

    on<AuthResetPasswordEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await _auth.sendPasswordResetEmail(
          email: event.email,
        );
        emit(AuthResetPasswordSuccessState());
      } catch (e) {
        emit(AuthErrorState(error: e.toString()));
      }
    });
  }
}
