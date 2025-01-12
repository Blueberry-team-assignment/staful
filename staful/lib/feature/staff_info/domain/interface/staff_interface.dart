import 'package:staful/feature/staff_info/data/dto/staff_dto.dart';
import 'package:staful/feature/staff_info/domain/model/staff_model.dart';

abstract class StaffInterface {
  Future<List<StaffModel>> fetchAllStaffs({
    required String uid,
  });

  Future<StaffModel> updateStaff({
    required String uid,
    required String staffId,
    required StaffDto dto,
  });

  Future<void> deleteStaff({
    required String uid,
    required String staffId,
  });

  Future<StaffModel> createStaff({
    required String uid,
    required StaffDto dto,
  });
}
