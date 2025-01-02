// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../create_staff_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateStaffDtoImpl _$$CreateStaffDtoImplFromJson(Map<String, dynamic> json) =>
    _$CreateStaffDtoImpl(
      name: json['name'] as String,
      image: json['image'] as String?,
      workDays: (json['workDays'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      workHours: (json['workHours'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Map<String, int>.from(e as Map)),
      ),
      workDate: (json['workDate'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      templateId: (json['templateId'] as num?)?.toInt(),
      desc: json['desc'] as String?,
    );

Map<String, dynamic> _$$CreateStaffDtoImplToJson(
        _$CreateStaffDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'workDays': instance.workDays,
      'workHours': instance.workHours,
      'workDate': instance.workDate,
      'templateId': instance.templateId,
      'desc': instance.desc,
    };
