import 'package:product_listing_app/feature/home/domain/entities/banner_entity.dart';

abstract class BannerState {}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerLoaded extends BannerState {
  final List<BannerEntity> banner;

  BannerLoaded(this.banner);
}

class BannerError extends BannerState {
  final String message;

  BannerError(this.message);
}
