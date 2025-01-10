import 'package:staful/feature/staff/domain/model/staff_model.dart';

class CalendarState {
  final DateTime? selectedDay;
  final DateTime? focusedDay;
  final List<StaffModel> filteredStaffList;

  CalendarState({
    this.selectedDay,
    this.focusedDay,
    this.filteredStaffList = const [],
  });

  CalendarState copyWith({
    DateTime? selectedDay,
    DateTime? focusedDay,
    List<StaffModel>? filteredStaffList,
  }) {
    return CalendarState(
      selectedDay: selectedDay ?? this.selectedDay,
      focusedDay: focusedDay ?? this.focusedDay,
      filteredStaffList: filteredStaffList ?? this.filteredStaffList,
    );
  }
}
