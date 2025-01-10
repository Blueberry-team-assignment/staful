import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/calendar/provider/calendar_provider.dart';
import 'package:staful/feature/calendar/provider/state/calendar_state.dart';
import 'package:staful/feature/schedule/presentation/provider/state/schedule_state.dart';

final scheduleNotifierProvider = StateNotifierProvider.autoDispose
    .family<ScheduleNotifier, ScheduleState, String>((ref, staffId) {
  final calendarState = ref.watch(calendarNotifierProvider);
  return ScheduleNotifier(calendarState, staffId);
});

class ScheduleNotifier extends StateNotifier<ScheduleState> {
  final CalendarState _calendarState;
  final String staffId;

  ScheduleNotifier(
    this._calendarState,
    this.staffId,
  ) : super(const ScheduleState()) {
    initialize();
  }

  void initialize() {
    state = state.copyWith(
        selectedDay: _calendarState.selectedDay,
        staffId: staffId,
        workHours: _calendarState.filteredStaffList
            .firstWhere((staff) => staff.id == staffId)
            .workHours);
  }
}
