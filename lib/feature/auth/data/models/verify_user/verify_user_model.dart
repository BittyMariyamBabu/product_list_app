import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_listing_app/feature/auth/domain/entities/verify_user_entity.dart';
part 'verify_user_model.freezed.dart';
part 'verify_user_model.g.dart';

@freezed
abstract class VerifyUserModel with _$VerifyUserModel {
  const factory VerifyUserModel({
    @Default('') String otp,
    @Default(false) bool user,
  }) = _VerifyUserModel;

  factory VerifyUserModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyUserModelFromJson(json);
}


// Mapper: Model → Entity
extension VerifyUserMapper on VerifyUserModel {
  VerifyUserEntity toEntity() => 
  VerifyUserEntity(
    otp: otp, 
    isUser: user
    );
}