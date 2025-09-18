import 'package:equatable/equatable.dart';
import 'package:product_listing_app/feature/wishlist/domain/entities/wishlist_entity.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();
  @override
  List<Object> get props => [];
}

// Load wishlist from API
class LoadWishlist extends WishlistEvent {}

// Toggle wishlist for a product
class ToggleWishlist extends WishlistEvent {
  final WishListEntity product;
  const ToggleWishlist(this.product);

  @override
  List<Object> get props => [product];
}

class SyncWishlist extends WishlistEvent {}