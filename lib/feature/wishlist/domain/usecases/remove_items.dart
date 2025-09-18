import 'package:product_listing_app/feature/wishlist/domain/repositories/wishlist_repository.dart';

// class RemoveItemsUseCase {
//   final WishListRepository repository;
//   RemoveItemsUseCase(this.repository);

//   Future<void> call({required int id}) => repository.removeProduct(id: id.toString());
// }

class SyncWishlistUseCase {
  final WishListRepository repository;
  SyncWishlistUseCase(this.repository);

  Future<void> call() async {
    await repository.syncWishlist();
  }
}