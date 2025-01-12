// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StaffDtoImpl _$$StaffDtoImplFromJson(Map<String, dynamic> json) =>
    _$StaffDtoImpl(
      name: json['name'] as String?,
      templateId: json['templateId'] as String?,
      image: json['image'] as String?,
      workDays: (json['workDays'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      workHours: json['workHours'] == null
          ? null
          : TimeRangeModel.fromJson(json['workHours'] as Map<String, dynamic>),
      desc: json['desc'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$$StaffDtoImplToJson(_$StaffDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'templateId': instance.templateId,
      'image': instance.image,
      'workDays': instance.workDays,
      'workHours': instance.workHours?.toJson(),
      'desc': instance.desc,
      'isDeleted': instance.isDeleted,
    };
