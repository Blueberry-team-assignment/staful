import 'package:staful/data/models/staff_model.dart';
import 'package:staful/data/staff_repository.dart';
import 'package:staful/utils/constants.dart';

class GetFilteredStaffUseCase {
  final StaffInterface _staffInterface;

  GetFilteredStaffUseCase(this._staffInterface);

  Future<List<Staff>> execute({required DateTime selectedDay}) async {
    final staffList = await _staffInterface.fetchAllStaffs();
    final selectedWeekDay = weekDays[selectedDay.weekday - 1];

    // 선택한 날에 근무가 있는 직원들만 필터링.
    return staffList.where((staff) {
      return staff.workDays?.contains(selectedWeekDay) ?? false;
    }).toList();
  }
}
