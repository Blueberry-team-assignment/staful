import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:staful/feature/schedule/domain/model/schedule_model.dart';
import 'package:staful/feature/schedule/domain/model/time_range_model.dart';

part 'staff_dto.freezed.dart';
part 'staff_dto.g.dart';

@freezed
class StaffDto with _$StaffDto {
  const factory StaffDto({
    String? name,
    String? templateId,
    String? image,
    List<String>? workDays,
    TimeRangeModel? workHours,
    List<ScheduleModel>? workSchedules,
    String? desc,
    bool? isDeleted,
  }) = _StaffDto;

  factory StaffDto.fromJson(Map<String, dynamic> json) =>
      _$StaffDtoFromJson(json);
}

