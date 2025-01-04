import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/presentation/provider/log_in_provider.dart';
import 'package:staful/feature/staff/data/repositories/staff_repository.dart';
import 'package:staful/feature/staff/domain/interface/staff_interface.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';
import 'package:staful/ui/widgets/overlay_search_results_widget.dart';

final filterBySearchInputUsecaseProvider = Provider((ref) {
  final staffInterface = ref.watch(staffRepositoryProvider);
  return FilterBySearchInputUsecase(staffInterface, ref);
});

class FilterBySearchInputUsecase {
  final StaffInterface _staffInterface;
  final Ref ref;

  FilterBySearchInputUsecase(this._staffInterface, this.ref);

  Future<List<StaffModel>> execute({required String text}) async {
    final staffList = await _staffInterface.fetchAllStaffs(
        uid: ref.read(logInProvider).authUser!.uid);

    return staffList.where((staff) {
      final chosungName = decomposeHangul(staff.name);
      final chosungInput = decomposeHangul(text);
      return chosungName.startsWith(chosungInput);
    }).toList();
  }
}
