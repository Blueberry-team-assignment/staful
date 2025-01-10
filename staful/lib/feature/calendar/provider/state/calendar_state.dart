import 'package:staful/feature/staff/domain/model/staff_model.dart';

class CalendarState {
  final DateTime selectedDay;
  final DateTime focusedDay;
  final List<StaffModel> filteredStaffList;

  CalendarState({
    required this.selectedDay,
    required this.focusedDay,
    required this.filteredStaffList,
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
