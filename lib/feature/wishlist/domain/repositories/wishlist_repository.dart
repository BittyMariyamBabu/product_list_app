import 'package:product_listing_app/feature/wishlist/domain/entities/wishlist_entity.dart';

abstract class WishListRepository {
  
  Future<List<WishListEntity>> getWishList();
  Future<void> toggleProduct({required String productId});
  Future<void> syncWishlist(); // batch sync to API
  // Future<void> addProduct({required WishListEntity item});
  // Future<void> removeProduct({required String id});
}