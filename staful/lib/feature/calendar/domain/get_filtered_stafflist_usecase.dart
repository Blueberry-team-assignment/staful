import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/data/staff_repository.dart';
import 'package:staful/utils/constants.dart';

// final getFilteredStaffUsecaseProvider = Provider((ref) {
//   return GetFilteredStaffUseCase(ref.watch(staffRepositoryProvider));
// });

class GetFilteredStaffUseCase {
  final StaffInterface _staffRepository;

  GetFilteredStaffUseCase(this._staffRepository);

  Future<List<Staff>> execute({required DateTime selectedDay}) async {
    final staffList = await _staffRepository.fetchAllStaffs();
    final selectedWeekDay = weekDays[selectedDay.weekday - 1];

    // 선택한 날에 근무가 있는 직원들만 필터링.
    return staffList.where((staff) {
      return staff.workDays?.contains(selectedWeekDay) ?? false;
    }).toList();
  }
}
