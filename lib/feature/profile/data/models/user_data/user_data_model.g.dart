// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    _UserDataModel(
      name: json['name'] as String? ?? '',
      phone: json['phone_number'] as String? ?? '',
    );

Map<String, dynamic> _$UserDataModelToJson(_UserDataModel instance) =>
    <String, dynamic>{'name': instance.name, 'phone_number': instance.phone};
