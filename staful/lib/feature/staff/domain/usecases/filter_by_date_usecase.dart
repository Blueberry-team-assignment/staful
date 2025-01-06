import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/staff/data/repositories/staff_repository.dart';
import 'package:staful/feature/staff/domain/interface/staff_interface.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';
import 'package:staful/provider/uid_provider.dart';
import 'package:staful/utils/constants.dart';

final filterByDateUsecaseProvider = Provider((ref) {
  final staffInterface = ref.watch(staffRepositoryProvider);
  final uid = ref.watch(uidProvider);
  return FilterByDateUsecase(staffInterface, uid);
});

class FilterByDateUsecase {
  final StaffInterface _staffInterface;
  final String? uid;

  FilterByDateUsecase(this._staffInterface, this.uid);

  Future<List<StaffModel>> execute({required DateTime selectedDay}) async {
    print('uid in calendarProvider : $uid');
    final staffList = await _staffInterface.fetchAllStaffs(uid: uid!);
    final selectedWeekDay = weekDays[selectedDay.weekday - 1];

    // 선택한 날에 근무가 있는 직원들만 필터링.
    return staffList.where((staff) {
      return staff.workDays.contains(selectedWeekDay);
    }).toList();
  }
}
