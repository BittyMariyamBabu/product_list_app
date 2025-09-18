import 'package:product_listing_app/feature/auth/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @Default(TokenModel(access: '')) TokenModel token,
    @JsonKey(name: 'user_id') @Default('') String userId,
    @Default('') String message,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
abstract class TokenModel with _$TokenModel {
  const factory TokenModel({
    @Default('') String access,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}

// Mapper: Model → Entity
extension UserMapper on UserModel {
  UserEntity toEntity() => 
  UserEntity(
    token: token.access,  // use empty string if null 
    id: userId, 
    message: message);
}


// @freezed
// abstract class UserModel with _$UserModel {
//   factory UserModel({
//     required String token,
//     required String id,
//   }) = _UserModel;

//   factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
// }

// extension UserMapper on UserModel {
//   UserEntity toEntity() => UserEntity(token: token, id: id);
// }
