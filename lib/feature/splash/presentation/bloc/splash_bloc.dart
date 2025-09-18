import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/core/secure_storage/secure_storage.dart';
import 'splash_event.dart';
import 'splash_state.dart';
import 'dart:async';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SecureStorage storage;
  SplashBloc({required this.storage}) : super(const SplashState()) {
    on<SplashStarted>((event, emit) async {
      // Simulate some delay for animation
      await Future.delayed(const Duration(seconds: 2));

      /// Check if user is logged in
      // Check login status
       final loggedIn = await storage.isLoggedIn();
      emit(state.copyWith(status: SplashStatus.completed, isLoggedIn: loggedIn));
    });
  }

}
