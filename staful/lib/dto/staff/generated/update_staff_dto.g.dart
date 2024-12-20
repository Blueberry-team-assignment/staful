// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../update_staff_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateStaffDtoImpl _$$UpdateStaffDtoImplFromJson(Map<String, dynamic> json) =>
    _$UpdateStaffDtoImpl(
      name: json['name'] as String?,
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
      staffId: json['staffId'] as String,
    );

Map<String, dynamic> _$$UpdateStaffDtoImplToJson(
        _$UpdateStaffDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'workDays': instance.workDays,
      'workHours': instance.workHours,
      'workDate': instance.workDate,
      'templateId': instance.templateId,
      'desc': instance.desc,
      'staffId': instance.staffId,
    };
