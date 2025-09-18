import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

// Event: request OTP
class VerifyPhoneEvent extends AuthEvent {
  final String phone;
  const VerifyPhoneEvent(this.phone);

  @override
  List<Object?> get props => [phone];
}

// Event: verify entered OTP
class VerifyOtpEvent extends AuthEvent {
  final String enteredOtp;

  const VerifyOtpEvent(this.enteredOtp);

  @override
  List<Object> get props => [enteredOtp];
}

// Event: sign up after verification
class SignUpEvent extends AuthEvent {
  final String name;
  final String phone;
  const SignUpEvent(this.name, this.phone);

  @override
  List<Object?> get props => [name, phone];
}

// abstract class AuthEvent extends Equatable {
//   @override
//   List<Object> get props => [];
// }

// // Event to request OTP - sends new OTP
// class VerifyPhoneEvent extends AuthEvent {
//   final String phone;

//   VerifyPhoneEvent(this.phone);

//   @override
//   List<Object> get props => [phone];
// }

// class VerifyOtpEvent extends AuthEvent {
//   final String enteredOtp;
//   VerifyOtpEvent(this.enteredOtp);

//   @override
//   List<Object> get props => [enteredOtp];
// }

// class SignUpEvent extends AuthEvent {
//   final String name;
//   final String phone;

//   SignUpEvent(this.name, this.phone);

//   @override
//   List<Object> get props => [name, phone];
// }

