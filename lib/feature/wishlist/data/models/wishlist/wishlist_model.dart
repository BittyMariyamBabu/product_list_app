import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_listing_app/feature/wishlist/domain/entities/wishlist_entity.dart';
part 'wishlist_model.freezed.dart';
part 'wishlist_model.g.dart';

@freezed
abstract class WishListModel with _$WishListModel {
  factory WishListModel({
    required int id,
    required int salePrice,
    required int actualPrice,
    required String imageUrl,
    required String productName,
    required int review
  }) = _WishListModel;

  factory WishListModel.fromJson(Map<String, dynamic> json) => _$WishListModelFromJson(json);
}

extension WishListMapper on WishListModel {
  WishListEntity toEntity() => WishListEntity(
    id: id, 
    salePrice: salePrice, 
    actualPrice: actualPrice, 
    imageUrl: imageUrl, 
    productName: productName,
    review: review);
}

