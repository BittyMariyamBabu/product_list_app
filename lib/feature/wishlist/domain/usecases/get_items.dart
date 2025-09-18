import 'package:product_listing_app/feature/wishlist/domain/entities/wishlist_entity.dart';
import 'package:product_listing_app/feature/wishlist/domain/repositories/wishlist_repository.dart';

class GetItemUseCase {
  final WishListRepository repository;
  GetItemUseCase(this.repository);

  Future<WishListEntity> call() async {
    return repository.getWishList();
  }
}