// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_range_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeRangeModelImpl _$$TimeRangeModelImplFromJson(Map<String, dynamic> json) =>
    _$TimeRangeModelImpl(
      startTime: const TimeOfDayConverter()
          .fromJson(json['startTime'] as Map<String, int>),
      endTime: const TimeOfDayConverter()
          .fromJson(json['endTime'] as Map<String, int>),
    );

Map<String, dynamic> _$$TimeRangeModelImplToJson(
        _$TimeRangeModelImpl instance) =>
    <String, dynamic>{
      'startTime': const TimeOfDayConverter().toJson(instance.startTime),
      'endTime': const TimeOfDayConverter().toJson(instance.endTime),
    };
