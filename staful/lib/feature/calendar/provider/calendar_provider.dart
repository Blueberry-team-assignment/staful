import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/data/staff_repository.dart';
import 'package:staful/feature/calendar/domain/usecases/get_filtered_stafflist_usecase.dart';

final calendarViewModelProvider =
    StateNotifierProvider<CalendarViewModel, CalendarState>((ref) {
  final getFilteredStaffUseCase =
      GetFilteredStaffUseCase(ref.watch(staffRepositoryProvider));
  return CalendarViewModel(getFilteredStaffUseCase);
});

class CalendarViewModel extends StateNotifier<CalendarState> {
  final GetFilteredStaffUseCase getFilteredStaffUseCase;

  CalendarViewModel(this.getFilteredStaffUseCase)
      : super(CalendarState(selectedDay: DateTime.now()));

  void selectDay(DateTime selectedDay) async {
    final filteredStaff =
        getFilteredStaffUseCase.execute(selectedDay: selectedDay);
    state = state.copyWith(
      selectedDay: selectedDay,
      filteredStaff: await filteredStaff,
    );
  }

  void resetDay() {
    selectDay(DateTime.now());
  }
}

class CalendarState {
  final DateTime selectedDay;
  final List<Staff> filteredStaff;

  CalendarState({
    required this.selectedDay,
    this.filteredStaff = const [],
  });

  CalendarState copyWith({
    DateTime? selectedDay,
    List<Staff>? filteredStaff,
  }) {
    return CalendarState(
      selectedDay: selectedDay ?? this.selectedDay,
      filteredStaff: filteredStaff ?? this.filteredStaff,
    );
  }
}
