// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StaffModelImpl _$$StaffModelImplFromJson(Map<String, dynamic> json) =>
    _$StaffModelImpl(
      id: json['id'] as String?,
      templateId: json['templateId'] as String?,
      name: json['name'] as String,
      image: json['image'] as String?,
      workDays: (json['workDays'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      workHours:
          TimeRangeModel.fromJson(json['workHours'] as Map<String, dynamic>),
      workSchedules: (json['workSchedules'] as List<dynamic>?)
              ?.map((e) => ScheduleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      desc: json['desc'] as String?,
      isSelected: json['isSelected'] as bool? ?? false,
      isVisible: json['isVisible'] as bool? ?? true,
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$StaffModelImplToJson(_$StaffModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'templateId': instance.templateId,
      'name': instance.name,
      'image': instance.image,
      'workDays': instance.workDays,
      'workHours': instance.workHours,
      'workSchedules': instance.workSchedules,
      'desc': instance.desc,
      'isSelected': instance.isSelected,
      'isVisible': instance.isVisible,
      'isDeleted': instance.isDeleted,
    };