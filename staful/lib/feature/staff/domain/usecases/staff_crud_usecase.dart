import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/presentation/provider/log_in_provider.dart';
import 'package:staful/feature/staff/data/dto/staff_dto.dart';
import 'package:staful/feature/staff/data/repositories/staff_repository.dart';
import 'package:staful/feature/staff/domain/interface/staff_interface.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';

final staffCrudUsecaseProvider = Provider((ref) {
  final staffInterface = ref.watch(staffRepositoryProvider);
  return StaffCrudUsecase(staffInterface, ref);
});

class StaffCrudUsecase {
  final StaffInterface _staffInterface;
  final Ref ref;

  StaffCrudUsecase(this._staffInterface, this.ref);

  Future<StaffModel> createStaff(StaffModel staff) async {
    return await _staffInterface.createStaff(
        uid: ref.read(logInProvider).authUser!.uid,
        dto: StaffDto.fromJson(staff.toJson()));
  }

  Future<List<StaffModel>> getAllStaffs() async {
    final staffs = await _staffInterface.fetchAllStaffs(
      uid: ref.read(logInProvider).authUser!.uid,
    );
    return staffs;
  }

  Future<StaffModel> updateStaff(StaffModel staff) async {
    // staff.copyWith

    return await _staffInterface.updateStaff(
      uid: ref.read(logInProvider).authUser!.uid,
      dto: StaffDto.fromJson(staff.toJson()),
      staffId: staff.id!,
    );
  }

  Future<void> deleteStaff(String staffId) async {
    await _staffInterface.deleteStaff(
        staffId: staffId, uid: ref.read(logInProvider).authUser!.uid);
  }
}
