import 'package:product_listing_app/feature/home/domain/entities/product_entity.dart';

abstract class WishlistRepository {
  Future<ProductEntity> getWishList();
  Future<void> addProduct(ProductEntity item);
  Future<void> removeProduct(String id);
}