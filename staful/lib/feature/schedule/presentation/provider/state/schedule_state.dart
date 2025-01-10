import 'package:staful/feature/schedule/domain/model/time_range_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_state.freezed.dart';

@freezed
class ScheduleState with _$ScheduleState {
  const factory ScheduleState({
     String? staffId,
     DateTime? selectedDay,
     TimeRangeModel? workHours,
    @Default(false) bool isLoading,
    @Default(false) bool isDeleted
  }) = _ScheduleState;
}
