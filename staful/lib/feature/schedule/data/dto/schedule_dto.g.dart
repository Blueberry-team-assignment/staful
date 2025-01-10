// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleDtoImpl _$$ScheduleDtoImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleDtoImpl(
      staffId: json['staffId'] as String,
      date: DateTime.parse(json['date'] as String),
      workHours:
          TimeRangeModel.fromJson(json['workHours'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ScheduleDtoImplToJson(_$ScheduleDtoImpl instance) =>
    <String, dynamic>{
      'staffId': instance.staffId,
      'date': instance.date.toIso8601String(),
      'workHours': instance.workHours,
    };
