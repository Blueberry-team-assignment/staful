import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:staful/domain/models/staff_model.dart';
import 'package:staful/dto/staff/staff_dto.dart';

abstract class StaffInterface {
  Future<List<Staff>> fetchAllStaffList({
    required String uid,
  });

  Future<Staff> updateStaff({
    required String uid,
    required String staffId,
    required UpdateStaffDto updateStaffDto,
  });

  Future<void> deleteStaff({
    required String uid,
    required String staffId,
  });

  Future<Staff> createStaff({
    required String uid,
    required CreateStaffDto createStaffDto,
  });
}

class StaffRepository implements StaffInterface {
  final FirebaseFirestore _firestore;

  StaffRepository(this._firestore);

  @override
  Future<List<Staff>> fetchAllStaffList({
    required String uid,
  }) async {
    final staffList =
        await _firestore.collection('users').doc(uid).collection('staff').get();

    return staffList.docs
        .map((staff) => Staff.fromFirestore(staff.data()))
        .toList();
  }

  @override
  Future<Staff> updateStaff({
    required String uid,
    required String staffId,
    required UpdateStaffDto updateStaffDto,
  });

  @override
  Future<void> deleteStaff({
    required String uid,
    required String staffId,
  });

  @override
  Future<Staff> createStaff({
    required String uid,
    required CreateStaffDto createStaffDto,
  });
}
