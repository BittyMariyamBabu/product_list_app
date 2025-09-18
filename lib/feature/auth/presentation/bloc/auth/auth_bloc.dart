import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/core/secure_storage/secure_storage.dart';
import 'package:product_listing_app/feature/auth/domain/usecases/register_usecase.dart';
import 'package:product_listing_app/feature/auth/domain/usecases/send_otp.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SendOtpUseCase loginUseCase;
  final RegisterUseCase signupUseCase;
  final SecureStorage secureStorage;
  String? apiOtp;  

  AuthBloc({required this.loginUseCase, required this.signupUseCase,required this.secureStorage})
      : super(AuthInitial()) {

    /// Send OTP to the phone
    on<VerifyPhoneEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await loginUseCase(phone: event.phone);
        apiOtp = user.otp; // Save backend OTP
        debugPrint('[AuthBloc] OTP sent: ${user.otp}, isUser: ${user.isUser}, phone : ${event.phone}');
        emit(VerifyPhoneSuccess(user)); // Ready for OTP input
      } catch (e) {
        emit(AuthFailure(e.toString()));
        debugPrint('[AuthBloc] OTP send error: ${e.toString()}');
      }
    });

    on<VerifyOtpEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        // Read isUser safely from secure storage
        final isUser = await secureStorage.getTokenAndUser().then((data) => data['isUser'] as bool);

        if (event.enteredOtp == apiOtp) {
          emit(VerifyOtpSuccess(isUser));
          debugPrint('[AuthBloc] OTP verified: $apiOtp');
        } else {
          emit(AuthFailure("Invalid OTP"));
        }
      } catch (e) {
        emit(AuthFailure("Something went wrong: ${e.toString()}"));
      }
  });


    /// SignUp flow
    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signupUseCase(name: event.name, phone: event.phone);
        emit(AuthSuccess(user));
        debugPrint('[AuthBloc] SignUp success: ${user.token}');
      } catch (e) {
        emit(AuthFailure(e.toString()));
        debugPrint('[AuthBloc] SignUp error: ${e.toString()}');
      }
    });
  }
}

