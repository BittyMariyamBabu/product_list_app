import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_listing_app/feature/home/domain/entities/product_entity.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';


@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,

    @JsonKey(name: 'sale_price')
    required int salePrices,

    required int mrp,

    @JsonKey(name: 'featured_image')
    required String productImageUrl,

    required String name,

    @JsonKey(name: 'avg_rating')
    required int rating,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}


// Mapper: Model → Entity
extension ProductMapper on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      salePrice: salePrices,
      actualPrice: mrp,
      imageUrl: productImageUrl,
      productName: name,
      review: rating,
    );
  }
}


/// A data model representing a product, extending [ProductEntity]
// class ProductModel extends ProductEntity {
//   /// All fields are required and passed to the [ProductEntity] constructor.
//   ProductModel({
//     required super.id,
//     required super.salePrice, 
//     required super.actualPrice, 
//     required super.imageUrl, 
//     required super.productName, 
//     required super.review,
//   });

//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       id: json['id'], 
//       salePrice: json['sale_price'],
//       actualPrice: json['mrp'],
//       imageUrl: json['featured_image'] as String,
//       productName: json['name'] as String, 
//       review: json['avg_rating']);
//   }
// }
