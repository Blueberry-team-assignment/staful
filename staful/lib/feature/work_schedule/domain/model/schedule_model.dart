import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:staful/feature/work_schedule/domain/model/time_range_model.dart';

part 'schedule_model.freezed.dart';
part 'schedule_model.g.dart';

@freezed
class ScheduleModel with _$ScheduleModel {
  const factory ScheduleModel({
    String? id,
    required DateTime date, // [y-m-d].toIsoString
    required TimeRangeModel workHours,
    @Default(false) bool isSelected,
    @Default(true) bool isVisible,
    @Default(false) bool isDeleted,
  }) = _ScheduleModel;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);
}
