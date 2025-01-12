import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/presentation/provider/log_in_provider.dart';
import 'package:staful/feature/staff_info/data/dto/staff_dto.dart';
import 'package:staful/feature/staff_info/data/repositories/staff_repository.dart';
import 'package:staful/feature/staff_info/domain/interface/staff_interface.dart';
import 'package:staful/feature/staff_info/domain/model/staff_model.dart';
import 'package:staful/provider/uid_provider.dart';

final staffCrudUsecaseProvider = Provider((ref) {
  final staffInterface = ref.watch(staffRepositoryProvider);
  final uid = ref.watch(uidProvider);
  return StaffCrudUsecase(staffInterface, uid);
});

class StaffCrudUsecase {
  final StaffInterface _staffInterface;
  final String? uid;

  StaffCrudUsecase(this._staffInterface, this.uid);

  Future<StaffModel> createStaff(StaffModel staff) async {
    return await _staffInterface.createStaff(
        uid: uid!, dto: StaffDto.fromJson(staff.toJson()));
  }

  Future<List<StaffModel>> getAllStaffs() async {
    final staffs = await _staffInterface.fetchAllStaffs(
      uid: uid!,
    );
    return staffs;
  }

  Future<StaffModel> updateStaff(StaffModel staff) async {
    final updatedStaff = await _staffInterface.updateStaff(
      uid: uid!,
      dto: StaffDto.fromJson(staff.toJson()),
      staffId: staff.id!,
    );

    return updatedStaff;
  }

  Future<void> deleteStaff(String staffId) async {
    await _staffInterface.deleteStaff(staffId: staffId, uid: uid!);
  }
}
