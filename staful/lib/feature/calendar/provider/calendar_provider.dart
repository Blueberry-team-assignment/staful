import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/staff/domain/usecases/filter_by_date_usecase.dart';

final calendarNotifierProvider =
    StateNotifierProvider<CalendarNotifier, CalendarState>((ref) {
  final filterByDateUsecase = ref.watch(filterByDateUsecaseProvider);
  return CalendarNotifier(filterByDateUsecase);
});

class CalendarNotifier extends StateNotifier<CalendarState> {
  final FilterByDateUsecase filterByDateUsecase;

  CalendarNotifier(this.filterByDateUsecase)
      : super(CalendarState(
          selectedDay: DateTime.now(),
          focusedDay: DateTime.now(),
        )) {
    selectDay(DateTime.now());
  }

  void selectDay(DateTime selectedDay) async {
    await filterByDateUsecase.execute(selectedDay: selectedDay);

    state = state.copyWith(
      selectedDay: selectedDay,
      focusedDay: selectedDay,
    );
  }

  void resetDay() {
    selectDay(DateTime.now());
  }
}

class CalendarState {
  final DateTime selectedDay;
  final DateTime focusedDay;

  CalendarState({
    required this.selectedDay,
    required this.focusedDay,
  });

  CalendarState copyWith({
    DateTime? selectedDay,
    DateTime? focusedDay,
  }) {
    return CalendarState(
      selectedDay: selectedDay ?? this.selectedDay,
      focusedDay: focusedDay ?? this.focusedDay,
    );
  }
}
