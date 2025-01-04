import 'package:staful/feature/staff/domain/interface/staff_interface.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';

// final GetStaffsUsingTemplateUsecaseProvider = Provider((ref) {
//   final staffInterface = ref.watch(staffRepositoryProvider);
//   return GetStaffsUsingTemplateUsecase(staffInterface);
// })

class GetStaffsUsingTemplateUsecase {
  final StaffInterface _staffInterface;

  GetStaffsUsingTemplateUsecase(this._staffInterface);

  Future<List<StaffModel>> execute({required String templateId}) async {
    final staffList = await _staffInterface.fetchAllStaffs();

    return staffList.where((staff) {
      return staff.templateId == templateId;
    }).toList();
  }
}
