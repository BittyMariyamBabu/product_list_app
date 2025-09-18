// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyUserModel _$VerifyUserModelFromJson(Map<String, dynamic> json) =>
    _VerifyUserModel(
      otp: json['otp'] as String? ?? '',
      token: json['token'] == null
          ? const TokenModel(access: '')
          : TokenModel.fromJson(json['token'] as Map<String, dynamic>),
      user: json['user'] as bool? ?? false,
    );

Map<String, dynamic> _$VerifyUserModelToJson(_VerifyUserModel instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'token': instance.token,
      'user': instance.user,
    };

_TokenModel _$TokenModelFromJson(Map<String, dynamic> json) =>
    _TokenModel(access: json['access'] as String? ?? '');

Map<String, dynamic> _$TokenModelToJson(_TokenModel instance) =>
    <String, dynamic>{'access': instance.access};
