import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  final String phone;

  LoginRequested(this.phone);

  @override
  List<Object> get props => [phone];
}

class SignupRequested extends AuthEvent {
  final String name;
  final String phone;

  SignupRequested(this.name, this.phone);

  @override
  List<Object> get props => [name, phone];
}

