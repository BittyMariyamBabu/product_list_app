import 'package:product_listing_app/feature/home/domain/entities/banner_entity.dart';

/// A data model representing a banner, extending [BannerEntity]
class BannerModel extends BannerEntity {
  /// All fields are required and passed to the [BannerEntity] constructor.
  BannerModel({
    required super.id,
    required super.bannerImageUrl, 
    required super.bannerName, 
    required super.price, 
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'], 
      bannerImageUrl: json['sale_price'],
      bannerName: json['mrp'],
      price: json['']
    );
  }
}
