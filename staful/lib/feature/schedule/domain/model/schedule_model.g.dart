// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleModelImpl _$$ScheduleModelImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleModelImpl(
      id: json['id'] as String?,
      date: DateTime.parse(json['date'] as String),
      workHours:
          TimeRangeModel.fromJson(json['workHours'] as Map<String, dynamic>),
      isSelected: json['isSelected'] as bool? ?? false,
      isVisible: json['isVisible'] as bool? ?? true,
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$ScheduleModelImplToJson(_$ScheduleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'workHours': instance.workHours,
      'isSelected': instance.isSelected,
      'isVisible': instance.isVisible,
      'isDeleted': instance.isDeleted,
    };
