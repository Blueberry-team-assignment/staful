import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:staful/feature/schedule/domain/model/time_range_model.dart';

part 'schedule_model.freezed.dart';

@freezed
class ScheduleModel with _$ScheduleModel {
  const factory ScheduleModel({
    String? id,
    required DateTime date, // y,m,d,wd
    required String staffId,
    required TimeRangeModel workHours,
    @Default(false) bool isSelected,
    @Default(true) bool isVisible,
    @Default(false) bool isDeleted,
  }) = _ScheduleModel;
}

