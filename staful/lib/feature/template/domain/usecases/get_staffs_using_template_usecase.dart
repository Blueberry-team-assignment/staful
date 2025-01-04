import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/staff/data/repositories/staff_repository.dart';
import 'package:staful/feature/staff/domain/interfaces/staff_interfaces.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';

// final GetStaffsUsingTemplateUsecaseProvider = Provider((ref) {
//   final staffInterface = ref.watch(staffRepositoryProvider);
//   return GetStaffsUsingTemplateUsecase(staffInterface);
// })

class GetStaffsUsingTemplateUsecase {
  final StaffInterfaces _staffInterface;

  GetStaffsUsingTemplateUsecase(this._staffInterface);

  Future<List<StaffModel>> execute({required String templateId}) async {
    final staffList = await _staffInterface.fetchAllStaffs();

    return staffList.where((staff) {
      return staff.templateId == templateId;
    }).toList();
  }
}
