import 'package:product_listing_app/feature/auth/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  factory UserModel({
    required String token,
    required String id,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

extension UserMapper on UserModel {
  UserEntity toEntity() => UserEntity(token: token, id: id);
}
