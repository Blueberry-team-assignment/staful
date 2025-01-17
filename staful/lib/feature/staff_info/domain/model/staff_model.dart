import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:staful/feature/work_schedule/domain/model/schedule_model.dart';
import 'package:staful/feature/work_schedule/domain/model/time_range_model.dart';

part 'staff_model.freezed.dart';
part 'staff_model.g.dart';

@freezed
class StaffModel with _$StaffModel {
  const factory StaffModel({
    String? id,
    String? templateId,
    required String name,
    String? image,
    @Default([]) List<String> workDays,
    required TimeRangeModel workHours,
    ScheduleModel? modifiedWorkSchedule,
    String? desc,
    @Default(false) bool isSelected,
    @Default(true) bool isVisible,
    @Default(false) bool isDeleted,
  }) = _StaffModel;

  factory StaffModel.fromJson(Map<String, dynamic> json) =>
      _$StaffModelFromJson(json);
}

extension StaffModelExtensions on StaffModel {
  Map<String, int> calculateWeeklyWorkingHours() {
    final workDayCount = workDays.length;

    final dailyWorkDuration = Duration(
      hours: workHours.end.hour - workHours.start.hour,
      minutes: workHours.end.minute - workHours.start.minute,
    );

    // Weekly work duration
    final totalDuration = dailyWorkDuration * workDayCount;

    return {
      "hour": totalDuration.inHours,
      "minute": totalDuration.inMinutes % 60,
    };
  }
}
