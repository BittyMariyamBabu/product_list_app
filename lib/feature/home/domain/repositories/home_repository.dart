import 'package:product_listing_app/feature/home/domain/entities/banner_entity.dart';
import 'package:product_listing_app/feature/home/domain/entities/product_entity.dart';

abstract class HomeRepository {
  // Get Banner List
  Future<List<BannerEntity>> getBanners();
  // Get Product list
  Future<List<ProductEntity>> getProduct();
  // search product with product name
  Future<List<ProductEntity>> searchProduct({required String query});
}