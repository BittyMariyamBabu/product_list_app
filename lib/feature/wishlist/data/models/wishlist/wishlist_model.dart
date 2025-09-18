import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_listing_app/feature/wishlist/domain/entities/wishlist_entity.dart';
part 'wishlist_model.freezed.dart';
part 'wishlist_model.g.dart';

@freezed
abstract class WishListModel with _$WishListModel {
  factory WishListModel({
    @Default(0) int id,
    @JsonKey(name: 'sale_price') @Default(0) int salePrice,
    @Default(0) int mrp,
    @JsonKey(name: 'featured_image') @Default('') String imageUrl,
    @Default('') String name,
    @JsonKey(name: 'avg_rating') @Default(0) int review,
    @JsonKey(name: 'in_wishlist') @Default(false) bool wishlist
  }) = _WishListModel;

  factory WishListModel.fromJson(Map<String, dynamic> json) => _$WishListModelFromJson(json);
}

extension WishListMapper on WishListModel {
  WishListEntity toEntity() => WishListEntity(
    id: id, 
    salePrice: salePrice, 
    actualPrice: mrp, 
    imageUrl: imageUrl, 
    productName: name,
    review: review);
}

