import 'package:product_listing_app/feature/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.salePrice, 
    required super.actualPrice, 
    required super.imageUrl, 
    required super.productName, 
    required super.review,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'], 
      salePrice: json['price'],
      actualPrice: json['price'],
      imageUrl: json['image_url'] as String,
      productName: '', 
      review: '');
  }
}
