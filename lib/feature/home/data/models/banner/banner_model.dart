import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_listing_app/feature/home/domain/entities/banner_entity.dart';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

@freezed
abstract class BannerModel with _$BannerModel {
  const factory BannerModel({
    @Default(0) int id,
    @Default('') String image,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}


// Mapper: Model → Entity
extension BannerMapper on BannerModel {
  BannerEntity toEntity() {
    return BannerEntity(
      id: id,
      bannerImageUrl: image
    );
  }
}
// /// A data model representing a banner, extending [BannerEntity]
// class BannerModel extends BannerEntity {
//   /// All fields are required and passed to the [BannerEntity] constructor.
//   BannerModel({
//     required super.id,
//     required super.bannerImageUrl, 
//     // required super.bannerName, 
//     // required super.price, 
//   });

//   factory BannerModel.fromJson(Map<String, dynamic> json) {
//     return BannerModel(
//       id: json['id'], 
//       bannerImageUrl: json['image'],
//       // bannerName: json['mrp'],
//       // price: json['']
//     );
//   }
// }
