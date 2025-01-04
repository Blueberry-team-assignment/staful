import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/presentation/provider/log_in_provider.dart';
import 'package:staful/feature/staff/data/repositories/staff_repository.dart';
import 'package:staful/feature/staff/domain/interface/staff_interface.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';

final getStaffsUsingTemplateUsecaseProvider = Provider((ref) {
  final staffInterface = ref.watch(staffRepositoryProvider);
  return GetStaffsUsingTemplateUsecase(staffInterface, ref);
});

class GetStaffsUsingTemplateUsecase {
  final StaffInterface _staffInterface;
  final Ref ref;

  GetStaffsUsingTemplateUsecase(this._staffInterface, this.ref);

  Future<List<StaffModel>> execute({required String templateId}) async {
    final staffList = await _staffInterface.fetchAllStaffs(
        uid: ref.read(logInProvider).authUser!.uid);

    return staffList.where((staff) {
      return staff.templateId == templateId;
    }).toList();
  }
}
