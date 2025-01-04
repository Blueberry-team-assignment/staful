// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_range_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeRangeModelImpl _$$TimeRangeModelImplFromJson(Map<String, dynamic> json) =>
    _$TimeRangeModelImpl(
      start: const TimeOfDayConverter()
          .fromJson(json['start'] as Map<String, int>),
      end: const TimeOfDayConverter().fromJson(json['end'] as Map<String, int>),
    );

Map<String, dynamic> _$$TimeRangeModelImplToJson(
        _$TimeRangeModelImpl instance) =>
    <String, dynamic>{
      'start': const TimeOfDayConverter().toJson(instance.start),
      'end': const TimeOfDayConverter().toJson(instance.end),
    };
