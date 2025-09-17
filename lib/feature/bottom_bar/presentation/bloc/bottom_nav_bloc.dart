// Bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/feature/bottom_bar/presentation/bloc/bottom_nav_event.dart';
import 'package:product_listing_app/feature/bottom_bar/presentation/bloc/bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState(currentIndex: 0)) {
    on<TabChanged>((event, emit) {
      emit(BottomNavState(currentIndex: event.index));
    });
  }
}