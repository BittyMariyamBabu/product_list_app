import 'package:equatable/equatable.dart';
import 'package:product_listing_app/feature/auth/domain/entities/user_entity.dart';
import 'package:product_listing_app/feature/auth/domain/entities/verify_user_entity.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserEntity user;
  AuthSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class VerifyOtpSuccess extends AuthState {
  final VerifyUserEntity otp;
  VerifyOtpSuccess(this.otp);

  @override
  List<Object> get props => [otp];
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}
