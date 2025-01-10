import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/presentation/provider/log_in_provider.dart';
import 'package:staful/feature/calendar/provider/state/calendar_state.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';
import 'package:staful/feature/staff/domain/usecases/filter_by_date_usecase.dart';

final calendarNotifierProvider =
    StateNotifierProvider<CalendarNotifier, CalendarState>((ref) {
  final filterByDateUsecase = ref.watch(filterByDateUsecaseProvider);
  final staffList = ref.watch(logInProvider).staffList;
  return CalendarNotifier(filterByDateUsecase, staffList);
});

class CalendarNotifier extends StateNotifier<CalendarState> {
  final FilterByDateUsecase filterByDateUsecase;
  final List<StaffModel> staffList;

  CalendarNotifier(this.filterByDateUsecase, this.staffList)
      : super(CalendarState(
          selectedDay: DateTime.now(),
          focusedDay: DateTime.now(),
          filteredStaffList: [],
        )) {
    selectDay(DateTime.now());
  }

  void selectDay(DateTime selectedDay) async {
    final filteredStaffList = await filterByDateUsecase.execute(
        selectedDay: selectedDay, staffList: staffList);

    if (!mounted) return;
    state = state.copyWith(
      filteredStaffList: filteredStaffList,
      selectedDay: selectedDay,
      focusedDay: selectedDay,
    );
  }

  void resetDay() {
    selectDay(DateTime.now());
  }
}
