import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/feature/auth/domain/usecases/register_usecase.dart';
import 'package:product_listing_app/feature/auth/domain/usecases/send_otp.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SendOtpUseCase loginUseCase;
  final RegisterUseCase signupUseCase;

  AuthBloc({required this.loginUseCase,required this.signupUseCase}) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await loginUseCase(phone: event.phone);
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<SignupRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signupUseCase(name: event.name,phone: event.phone);
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}

