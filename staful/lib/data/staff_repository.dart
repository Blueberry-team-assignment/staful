import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/dto/staff/create_staff_dto.dart';
import 'package:staful/dto/staff/update_staff_dto.dart';

final staffRepositoryProvider = Provider<StaffInterface>((ref) {
  return StaffRepository(FirebaseFirestore.instance);
});

abstract class StaffInterface {
  Future<List<Staff>> fetchAllStaffs({
    required String uid,
  });

  Future<Staff> updateStaff({
    required String uid,
    required UpdateStaffDto updateStaffDto,
  });

  Future<void> deleteStaff({required String uid, required String staffId});

  Future<Staff> createStaff({
    required String uid,
    required CreateStaffDto createStaffDto,
  });
}

class StaffRepository implements StaffInterface {
  final FirebaseFirestore _firestore;

  StaffRepository(this._firestore);

  @override
  Future<List<Staff>> fetchAllStaffs({
    required String uid,
  }) async {
    final staffList =
        await _firestore.collection('users').doc(uid).collection('staff').get();

    return staffList.docs.map((staff) {
      // doc id 추가
      final data = staff.data();
      data['staffId'] = staff.id;

      return Staff.fromFirestore(data);
    }).toList();
  }

  @override
  Future<Staff> updateStaff({
    required String uid,
    required UpdateStaffDto updateStaffDto,
  }) async {
    try {
      final staffRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('staff')
          .doc(updateStaffDto.staffId);

      await staffRef.update(updateStaffDto.toJson());

      final updatedDoc = await staffRef.get();
      print('staff updated : ${updatedDoc.data()}');
      return Staff.fromFirestore(updatedDoc.data()!);
    } catch (e) {
      throw Exception('Failed to update staff: $e');
    }
  }

  @override
  Future<void> deleteStaff({
    required String uid,
    required String staffId,
  }) async {
    try {
      final staffRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('staff')
          .doc(staffId);

      await staffRef.delete();
    } catch (e) {
      throw Exception('Failed to delete staff: $e');
    }
  }

  @override
  Future<Staff> createStaff({
    required String uid,
    required CreateStaffDto createStaffDto,
  }) async {
    try {
      final staffRef =
          _firestore.collection('users').doc(uid).collection('staff');

      final newDoc = await staffRef.add(createStaffDto.toJson());

      final createdDoc = await newDoc.get();
      return Staff.fromFirestore(createdDoc.data()!);
    } catch (e) {
      throw Exception('Failed to create staff: $e');
    }
  }
}
