import 'package:product_listing_app/feature/wishlist/domain/entities/wishlist_entity.dart';

abstract class WishListRepository {
  
  Future<WishListEntity> getWishList();
  Future<void> addProduct({required WishListEntity item});
  Future<void> removeProduct({required String id});
}