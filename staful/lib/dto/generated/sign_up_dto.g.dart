// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../sign_up_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpDtoImpl _$$SignUpDtoImplFromJson(Map<String, dynamic> json) =>
    _$SignUpDtoImpl(
      id: json['id'] as String,
      password: json['password'] as String,
      businessName: json['businessName'] as String,
      name: json['name'] as String,
      openingDate: DateTime.parse(json['openingDate'] as String),
    );

Map<String, dynamic> _$$SignUpDtoImplToJson(_$SignUpDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'password': instance.password,
      'businessName': instance.businessName,
      'name': instance.name,
      'openingDate': instance.openingDate.toIso8601String(),
    };
