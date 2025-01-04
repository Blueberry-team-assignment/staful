import 'package:flutter/material.dart';
import 'package:staful/feature/schedule/domain/model/time_range_model.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_state.freezed.dart';

@freezed
class StaffState with _$StaffState {
  const factory StaffState({
    @Default([]) List<StaffModel> list,
    @Default([]) List<StaffModel> filteredList,
    @Default(StaffModel(
        name: "",
        workHours: TimeRangeModel(
            start: TimeOfDay(hour: 9, minute: 0),
            end: TimeOfDay(hour: 18, minute: 0))))
    StaffModel selectedStaff,
    @Default(false) bool isLoading,
  }) = _StaffState;
}
