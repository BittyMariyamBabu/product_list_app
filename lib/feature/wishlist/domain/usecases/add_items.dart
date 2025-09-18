import 'package:product_listing_app/feature/wishlist/domain/repositories/wishlist_repository.dart';

// class AddItem {
//   final WishListRepository repository;
//   AddItem(this.repository);

//   Future<void> call(WishListEntity item) => repository.addProduct(item:item);
// }

class ToggleProductUseCase {
  final WishListRepository repository;
  ToggleProductUseCase(this.repository);

  Future<void> call(String productId) async {
    await repository.toggleProduct(productId: productId);
  }
}