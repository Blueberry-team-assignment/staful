import 'package:staful/domain/models/staff_model.dart';

abstract class StaffRepository {
  Future<List<SelectableStaff>> fetchStaff();
}