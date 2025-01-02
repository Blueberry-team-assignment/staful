import 'package:staful/data/models/staff_model.dart';
import 'package:staful/data/staff_repository.dart';
import 'package:staful/data/user_repository.dart';
import 'package:staful/utils/constants.dart';

class GetFilteredStaffUseCase {
  final StaffRepositoryImpl _staffRepository;

  GetFilteredStaffUseCase(this._staffRepository);

  Future<List<Staff>> execute({required DateTime selectedDay}) async {
    final staffList = await _staffRepository.fetchAllStaffs();
    final selectedWeekDay = weekDays[selectedDay.weekday - 1];

    // 선택한 요일에 근무가 있는 직원들 필터링.
    return staffList.where((staff) {
      return staff.workDays?.contains(selectedWeekDay) ?? false;
    }).toList();
  }
}
