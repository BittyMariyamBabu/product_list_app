import 'package:equatable/equatable.dart';

abstract class WishlistEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadWishlist extends WishlistEvent {}

class ToggleWishlist extends WishlistEvent {
  final String productId;
  ToggleWishlist(this.productId);

  @override
  List<Object> get props => [productId];
}

class SyncWishlist extends WishlistEvent {}