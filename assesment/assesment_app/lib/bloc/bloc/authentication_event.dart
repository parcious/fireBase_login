import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}


class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;
  AuthLoginEvent({required this.email, required this.password});
}
class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String password;
  AuthRegisterEvent({required this.email, required this.password});
}
class AuthResetPasswordEvent extends AuthEvent {
  final String email;

  AuthResetPasswordEvent({required this.email});
  @override
  List<Object> get props => [email];
  
}