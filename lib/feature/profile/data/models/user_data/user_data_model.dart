import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_listing_app/feature/profile/domain/entity/user_data_entity.dart';
part 'user_data_model.freezed.dart';
part 'user_data_model.g.dart';

@freezed
abstract class UserDataModel with _$UserDataModel {
  const factory UserDataModel({
    @Default('') String name,
    @JsonKey(name: 'phone_number') @Default('') String phone,
  }) = _UserDataModel;

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);
}

// Mapper: Model → Entity
extension UserDataMapper on UserDataModel {
  UserDataEntity toEntity() => 
  UserDataEntity(
    name: name, 
    phone: phone
  );
}
