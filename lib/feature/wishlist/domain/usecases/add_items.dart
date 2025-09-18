import 'package:product_listing_app/feature/wishlist/domain/entities/wishlist_entity.dart';
import 'package:product_listing_app/feature/wishlist/domain/repositories/wishlist_repository.dart';

class AddItem {
  final WishListRepository repository;
  AddItem(this.repository);

  Future<void> call(WishListEntity item) => repository.addProduct(item:item);
}