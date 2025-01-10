import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:staful/feature/schedule/domain/model/time_range_model.dart';

part 'schedule_dto.freezed.dart';
part 'schedule_dto.g.dart';

@freezed
class ScheduleDto with _$ScheduleDto {
  const factory ScheduleDto({
    required String staffId,
    required DateTime date,
    required TimeRangeModel workHours,
  }) = _ScheduleDto;

  factory ScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDtoFromJson(json);
}
