import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_event.dart';
import 'splash_state.dart';
import 'dart:async';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashStarted>(_onSplashStarted);
  }

  Future<void> _onSplashStarted(
      SplashStarted event, Emitter<SplashState> emit) async {
    emit(state.copyWith(status: SplashStatus.loading));
    // Simulate loading (e.g., config fetch, token check)
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(status: SplashStatus.completed));
  }
}
