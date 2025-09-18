import 'package:equatable/equatable.dart';
import 'package:product_listing_app/feature/auth/domain/entities/user_entity.dart';
import 'package:product_listing_app/feature/auth/domain/entities/verify_user_entity.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

// Initial state
class AuthInitial extends AuthState {}

// While waiting for API
class AuthLoading extends AuthState {}

// After successful login/signup
class AuthSuccess extends AuthState {
  final UserEntity user;
  const AuthSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

// After successful OTP verification
class VerifyPhoneSuccess extends AuthState {
  final VerifyUserEntity otp;
  const VerifyPhoneSuccess(this.otp);

  @override
  List<Object?> get props => [otp];
}

// After OTP verified
class VerifyOtpSuccess extends AuthState {
   final bool isUser;
  const VerifyOtpSuccess(this.isUser);

  @override
  List<Object?> get props => [isUser];
}

// On error
class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}


// abstract class AuthState extends Equatable {
//   const AuthState()
//   @override
//   List<Object> get props => [];
// }

// class AuthInitial extends AuthState {}
// class AuthLoading extends AuthState {}

// class AuthSuccess extends AuthState {
//   final UserEntity user;
//   AuthSuccess(this.user);

//   @override
//   List<Object> get props => [user];
// }

// class VerifyOtpSuccess extends AuthState {
//   final VerifyUserEntity otp;
//   VerifyOtpSuccess(this.otp);

//   @override
//   List<Object> get props => [otp];
// }


// class AuthFailure extends AuthState {
//   final String message;
//   AuthFailure(this.message);

//   @override
//   List<Object> get props => [message];
// }
