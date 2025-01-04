import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_range_model.freezed.dart';
part 'time_range_model.g.dart';

class TimeOfDayConverter implements JsonConverter<TimeOfDay, Map<String, int>> {
  const TimeOfDayConverter();

  @override
  TimeOfDay fromJson(Map<String, int> json) {
    return TimeOfDay(hour: json['hour']!, minute: json['minute']!);
  }

  @override
  Map<String, int> toJson(TimeOfDay time) {
    return {'hour': time.hour, 'minute': time.minute};
  }
}

@freezed
class TimeRangeModel with _$TimeRangeModel {
  const factory TimeRangeModel({
    @TimeOfDayConverter() required TimeOfDay startTime,
    @TimeOfDayConverter() required TimeOfDay endTime,
  }) = _TimeRangeModel;

  factory TimeRangeModel.fromJson(Map<String, dynamic> json) =>
      _$TimeRangeModelFromJson(json);
}
