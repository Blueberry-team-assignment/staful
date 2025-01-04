import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/staff/data/repositories/staff_repository.dart';
import 'package:staful/feature/calendar/domain/get_filtered_stafflist_usecase.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';

final calendarNotifierProvider =
    StateNotifierProvider<CalendarNotifier, CalendarState>((ref) {
  final getFilteredStaffUseCase = ref.watch(getFilteredStaffUseCaseProvider);
  return CalendarNotifier(getFilteredStaffUseCase);
});

class CalendarNotifier extends StateNotifier<CalendarState> {
  final GetFilteredStaffUseCase getFilteredStaffUseCase;

  CalendarNotifier(this.getFilteredStaffUseCase)
      : super(CalendarState(
          selectedDay: DateTime.now(),
          focusedDay: DateTime.now(),
        )) {
    selectDay(DateTime.now());
  }

  void selectDay(DateTime selectedDay) async {
    final filteredStaff =
        getFilteredStaffUseCase.execute(selectedDay: selectedDay);
    state = state.copyWith(
      selectedDay: selectedDay,
      focusedDay: selectedDay,
      filteredStaff: await filteredStaff,
    );
  }

  void resetDay() {
    selectDay(DateTime.now());
  }
}

class CalendarState {
  final DateTime selectedDay;
  final DateTime focusedDay;
  final List<StaffModel> filteredStaff;

  CalendarState({
    required this.selectedDay,
    required this.focusedDay,
    this.filteredStaff = const [],
  });

  CalendarState copyWith({
    DateTime? selectedDay,
    DateTime? focusedDay,
    List<StaffModel>? filteredStaff,
  }) {
    return CalendarState(
      selectedDay: selectedDay ?? this.selectedDay,
      focusedDay: focusedDay ?? this.focusedDay,
      filteredStaff: filteredStaff ?? this.filteredStaff,
    );
  }
}
