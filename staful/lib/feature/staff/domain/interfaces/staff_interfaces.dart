import 'package:staful/feature/staff/domain/model/staff_model.dart';

abstract class StaffInterfaces {
  Future<List<StaffModel>> fetchAllStaffs();
}
