import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/presentation/provider/log_in_provider.dart';
import 'package:staful/feature/work_schedule/presentation/provider/state/calendar_state.dart';
import 'package:staful/feature/work_schedule/data/dto/schedule_dto.dart';
import 'package:staful/feature/work_schedule/data/repositories/schedule_repository.dart';
import 'package:staful/feature/work_schedule/domain/interfaces/schedule_interface.dart';
import 'package:staful/feature/work_schedule/domain/model/schedule_model.dart';
import 'package:staful/feature/staff_info/domain/model/staff_model.dart';
import 'package:staful/feature/staff_info/domain/usecases/filter_by_date_usecase.dart';
import 'package:staful/feature/staff_info/presentation/provider/staff_provider.dart';
import 'package:staful/provider/uid_provider.dart';

final calendarNotifierProvider =
    StateNotifierProvider.autoDispose<CalendarNotifier, CalendarState>((ref) {
  final filterByDateUsecase = ref.watch(filterByDateUsecaseProvider);
  final staffList = ref.watch(staffNotifierProvider).list;
  final scheduleInterface = ref.watch(scheduleRepositoryProvider);
  final uid = ref.watch(uidProvider);
  return CalendarNotifier(
      filterByDateUsecase, staffList, scheduleInterface, uid!);
});

class CalendarNotifier extends StateNotifier<CalendarState> {
  final FilterByDateUsecase filterByDateUsecase;
  final List<StaffModel> staffList;
  final ScheduleInterface _scheduleInterface;
  final String uid;

  CalendarNotifier(
    this.filterByDateUsecase,
    this.staffList,
    this._scheduleInterface,
    this.uid,
  ) : super(CalendarState()) {
    selectDay(state.selectedDay ?? DateTime.now());
  }

  void updateWorkSchedule({required ScheduleDto dto}) async {
    await _scheduleInterface.updateSchedules(
      dto: dto,
      uid: uid,
    );

    final updatedList = state.filteredStaffList.map((staff) {
      if (staff.id != dto.staffId) return staff;
      return staff.copyWith(
          modifiedWorkSchedule:
              ScheduleModel(date: dto.date, workHours: dto.workHours));
    }).toList();
    state = state.copyWith(filteredStaffList: updatedList);
  }

  void deleteWorkSchedule({
    required String staffId,
  }) async {
    await _scheduleInterface.deleteSchedules(
      staffId: staffId,
      date: state.selectedDay!,
      uid: uid,
    );

    final updatedList = state.filteredStaffList.where((staff) {
      if (staff.id != staffId) return true;
      return false;
    }).toList();
    state = state.copyWith(filteredStaffList: updatedList);
  }

  void refreshList() {
    state = state.copyWith(filteredStaffList: state.filteredStaffList);
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
