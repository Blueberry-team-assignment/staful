import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/work_schedule/data/repositories/schedule_repository.dart';
import 'package:staful/feature/work_schedule/domain/interfaces/schedule_interface.dart';
import 'package:staful/feature/staff_info/domain/model/staff_model.dart';
import 'package:staful/provider/uid_provider.dart';
import 'package:staful/utils/constants.dart';

final filterByDateUsecaseProvider = Provider((ref) {
  final uid = ref.watch(uidProvider);
  final scheduleInterface = ref.watch(scheduleRepositoryProvider);
  return FilterByDateUsecase(uid, scheduleInterface);
});

class FilterByDateUsecase {
  final String? uid;
  final ScheduleInterface _scheduleInterface;

  FilterByDateUsecase(this.uid, this._scheduleInterface);

  Future<List<StaffModel>> execute({
    required DateTime selectedDay,
    required List<StaffModel> staffList,
  }) async {
    final weekDay = weekDays[selectedDay.weekday - 1];
    final filteredStaffList = <StaffModel>[];

    for (final staff in staffList) {
      // 해당 날짜의 조정스케쥴
      final modifiedSchedule = await _scheduleInterface.fetchModifiedSchedule(
          staffId: staff.id!, selectedDay: selectedDay, uid: uid!);

      // [1]. 해당 일에 조정스케쥴이 없다면, 기본 근무요일 적용
      if (modifiedSchedule == null) {
        if (staff.workDays.contains(weekDay)) {
          filteredStaffList.add(staff);
        }
        // [2-1]. 조정스케쥴 있는데 삭제된 스케쥴이라면 제외.
      } else if (modifiedSchedule.isDeleted == true) {
        filteredStaffList.remove(staff);
        continue;
        // [2-2]. 조정스케쥴 저장.
      } else {
        final updatedStaff =
            staff.copyWith(modifiedWorkSchedule: modifiedSchedule);
        filteredStaffList.add(updatedStaff);
      }
    }

    return filteredStaffList;
  }
}
