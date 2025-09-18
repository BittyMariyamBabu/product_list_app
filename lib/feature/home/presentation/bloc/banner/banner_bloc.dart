import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/feature/home/domain/usecases/get_banner_usecases.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/banner/banner_event.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/banner/banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final GetBannersUseCase getBanners;

  BannerBloc({required this.getBanners}) : super(BannerInitial()) {
    on<LoadBanner>((event, emit) async {
      emit(BannerLoading());
      try {
        final banners = await getBanners();
        emit(BannerLoaded(banners));
      } catch (e) {
        emit(BannerError("Failed to load Banners"));
      }
    });
  }
}
