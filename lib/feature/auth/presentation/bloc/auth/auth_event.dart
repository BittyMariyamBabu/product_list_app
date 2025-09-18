import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class VerifyPhoneEvent extends AuthEvent {
  final String phone;

  VerifyPhoneEvent(this.phone);

  @override
  List<Object> get props => [phone];
}

class SignUpEvent extends AuthEvent {
  final String name;
  final String phone;

  SignUpEvent(this.name, this.phone);

  @override
  List<Object> get props => [name, phone];
}

