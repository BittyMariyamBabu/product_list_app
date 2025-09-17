import 'package:product_listing_app/feature/home/domain/entities/banner_entity.dart';

// Banner repository
abstract class BannerRepository {
  Future<List<BannerEntity>> getBanners();
}