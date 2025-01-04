import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:staful/feature/pay_detail/domain/model/pay_detail_model.dart';
import 'package:staful/feature/schedule/domain/model/schedule_model.dart';
import 'package:staful/feature/schedule/domain/model/time_range_model.dart';

part 'staff_model.freezed.dart';

@freezed
class StaffModel with _$StaffModel {
  const factory StaffModel({
    String? id,
    String? templateId,
    required String name,
    String? image,
    @Default([]) List<String> workDays,
    required TimeRangeModel workHours,
    @Default([]) List<ScheduleModel> workSchedules,
    String? desc,
    @Default(false) bool isSelected,
    @Default(true) bool isVisible,
    @Default(false) bool isDeleted,
  }) = _StaffModel;
}
