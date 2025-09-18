// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: (json['id'] as num).toInt(),
      salePrices: (json['sale_price'] as num).toInt(),
      mrp: (json['mrp'] as num).toInt(),
      productImageUrl: json['featured_image'] as String,
      name: json['name'] as String,
      rating: (json['avg_rating'] as num).toInt(),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sale_price': instance.salePrices,
      'mrp': instance.mrp,
      'featured_image': instance.productImageUrl,
      'name': instance.name,
      'avg_rating': instance.rating,
    };
