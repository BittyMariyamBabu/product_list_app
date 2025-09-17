import 'package:product_listing_app/feature/home/domain/entities/banner_entity.dart';
import 'package:product_listing_app/feature/home/domain/entities/product_entity.dart';

abstract class HomeRepository {
  // Banner repository
  Future<List<BannerEntity>> getBanners();
  // Product repository
  Future<List<ProductEntity>> getProduct();
}