// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyUserModel _$VerifyUserModelFromJson(Map<String, dynamic> json) =>
    _VerifyUserModel(
      otp: json['otp'] as String? ?? '',
      user: json['user'] as bool? ?? false,
    );

Map<String, dynamic> _$VerifyUserModelToJson(_VerifyUserModel instance) =>
    <String, dynamic>{'otp': instance.otp, 'user': instance.user};
