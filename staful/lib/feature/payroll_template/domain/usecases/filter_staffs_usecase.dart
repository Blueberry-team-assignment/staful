import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/staff_info/domain/model/staff_model.dart';
import 'package:staful/ui/widgets/overlay_search_results_widget.dart';

final filterStaffsUsecaseProvider = Provider((ref) {
  return FilterStaffsUsecase();
});

class FilterStaffsUsecase {
  List<StaffModel> execute(
      {required String text, required List<StaffModel> staffList}) {
    if (text == "" || text.isEmpty) {
      return staffList.map((staff) => staff.copyWith(isVisible: true)).toList();
    }

    bool callback(StaffModel staff) {
      final chosungName = decomposeHangul(staff.name);
      final chosungInput = decomposeHangul(text);
      return chosungName.startsWith(chosungInput);
    }

    return staffList.map((staff) {
      if (callback(staff) == false) {
        return staff.copyWith(isVisible: false);
      }
      return staff.copyWith(isVisible: true);
    }).toList();
  }
}
