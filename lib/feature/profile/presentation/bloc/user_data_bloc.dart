import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/feature/profile/domain/usecases/get_user_data.dart';
import 'package:product_listing_app/feature/profile/presentation/bloc/user_data_event.dart';
import 'package:product_listing_app/feature/profile/presentation/bloc/user_data_state.dart';


class UserDataBloc extends Bloc<UserEvent, UserState> {
  final GetUserDataUseCase userUseCase;

  UserDataBloc({required this.userUseCase}) : super(UserInitial()) {
    on<UserDataEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await userUseCase();
        emit(UserSuccess(user));
        debugPrint('[UserBloc] success: $user');
      } catch (e) {
        emit(UserFailure(e.toString()));
        debugPrint('[UserBloc]  error: ${e.toString()}');
      }
    });
  }
}