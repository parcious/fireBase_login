import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}


class AuthRegisterSuccessState extends AuthState {}

class AuthResetPasswordState extends AuthState {
  
}

class AuthResetPasswordSentState extends AuthState {}

class AuthResetPasswordSuccessState extends AuthState {
 
}




class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState({required this.error});

  @override
  List<Object> get props => [error];
}