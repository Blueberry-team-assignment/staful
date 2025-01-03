import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/data/staff_repository.dart';
import 'package:staful/feature/calendar/domain/get_filtered_stafflist_usecase.dart';

final calendarNotifierProvider =
    StateNotifierProvider<CalendarNotifier, CalendarState>((ref) {
  final getFilteredStaffUseCase =
      GetFilteredStaffUseCase(ref.watch(staffRepositoryProvider));
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
  final List<Staff> filteredStaff;

  CalendarState({
    required this.selectedDay,
    required this.focusedDay,
    this.filteredStaff = const [],
  });

  CalendarState copyWith({
    DateTime? selectedDay,
    DateTime? focusedDay,
    List<Staff>? filteredStaff,
  }) {
    return CalendarState(
      selectedDay: selectedDay ?? this.selectedDay,
      focusedDay: focusedDay ?? this.focusedDay,
      filteredStaff: filteredStaff ?? this.filteredStaff,
    );
  }
}
