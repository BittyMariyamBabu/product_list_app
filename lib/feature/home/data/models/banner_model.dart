import 'package:product_listing_app/feature/home/domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  BannerModel({
    required super.id,
     required super.bannerImageUrl, 
     required super.bannerName, 
     required super.price,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'], 
      bannerImageUrl: json['image_url'] as String,
      bannerName: json['title'] as String,
      price: json['price']);
  }
}
