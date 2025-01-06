import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/presentation/provider/log_in_provider.dart';
import 'package:staful/feature/staff/data/repositories/staff_repository.dart';
import 'package:staful/feature/staff/domain/interface/staff_interface.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';
import 'package:staful/provider/uid_provider.dart';

final getStaffsUsingTemplateUsecaseProvider = Provider((ref) {
  final staffInterface = ref.watch(staffRepositoryProvider);
  final uid = ref.watch(uidProvider);
  return GetStaffsUsingTemplateUsecase(staffInterface, uid);
});

class GetStaffsUsingTemplateUsecase {
  final StaffInterface _staffInterface;
  final String? uid;

  GetStaffsUsingTemplateUsecase(this._staffInterface, this.uid);

  Future<List<StaffModel>> execute({required String templateId}) async {
    final staffList = await _staffInterface.fetchAllStaffs(
        uid: uid!);

    return staffList.where((staff) {
      return staff.templateId == templateId;
    }).toList();
  }
}
