// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WishListModel _$WishListModelFromJson(Map<String, dynamic> json) =>
    _WishListModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      salePrice: (json['sale_price'] as num?)?.toInt() ?? 0,
      mrp: (json['mrp'] as num?)?.toInt() ?? 0,
      imageUrl: json['featured_image'] as String? ?? '',
      name: json['name'] as String? ?? '',
      review: (json['avg_rating'] as num?)?.toInt() ?? 0,
      wishlist: json['in_wishlist'] as bool? ?? false,
    );

Map<String, dynamic> _$WishListModelToJson(_WishListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sale_price': instance.salePrice,
      'mrp': instance.mrp,
      'featured_image': instance.imageUrl,
      'name': instance.name,
      'avg_rating': instance.review,
      'in_wishlist': instance.wishlist,
    };
