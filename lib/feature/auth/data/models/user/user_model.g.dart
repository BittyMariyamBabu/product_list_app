// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  token: json['token'] == null
      ? const TokenModel(access: '')
      : TokenModel.fromJson(json['token'] as Map<String, dynamic>),
  userId: json['user_id'] as String? ?? '',
  message: json['message'] as String? ?? '',
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user_id': instance.userId,
      'message': instance.message,
    };

_TokenModel _$TokenModelFromJson(Map<String, dynamic> json) =>
    _TokenModel(access: json['access'] as String? ?? '');

Map<String, dynamic> _$TokenModelToJson(_TokenModel instance) =>
    <String, dynamic>{'access': instance.access};
