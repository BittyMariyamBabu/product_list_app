// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WishListModel _$WishListModelFromJson(Map<String, dynamic> json) =>
    _WishListModel(
      id: (json['id'] as num).toInt(),
      salePrice: (json['salePrice'] as num).toInt(),
      actualPrice: (json['actualPrice'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      productName: json['productName'] as String,
      review: (json['review'] as num).toInt(),
    );

Map<String, dynamic> _$WishListModelToJson(_WishListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'salePrice': instance.salePrice,
      'actualPrice': instance.actualPrice,
      'imageUrl': instance.imageUrl,
      'productName': instance.productName,
      'review': instance.review,
    };
