import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/staff/data/dto/staff_dto.dart';
import 'package:staful/feature/staff/domain/interface/staff_interface.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';

final staffRepositoryProvider = Provider<StaffInterface>((ref) {
  return StaffRepository(FirebaseFirestore.instance);
});

class StaffRepository implements StaffInterface {
  final FirebaseFirestore _firestore;

  StaffRepository(this._firestore);

  @override
  Future<List<StaffModel>> fetchAllStaffs({
    required String uid,
  }) async {
    final staffList =
        await _firestore.collection('users').doc(uid).collection('staff').get();

    return staffList.docs.map((staff) {
      // doc id 추가
      final data = staff.data();
      data['id'] = staff.id;

      return StaffModel.fromJson(data);
    }).toList();
  }

  @override
  Future<StaffModel> updateStaff({
    required String uid,
    required String staffId,
    required StaffDto dto,
  }) async {
    try {
      final staffRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('staff')
          .doc(staffId);

      await staffRef.update(dto.toJson());

      final updatedDoc = await staffRef.get();
      final data = updatedDoc.data();
      data!['id'] = staffId;
      return StaffModel.fromJson(data);
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
  Future<StaffModel> createStaff({
    required String uid,
    required StaffDto dto,
  }) async {
    try {
      final staffRef =
          _firestore.collection('users').doc(uid).collection('staff');

      final newDoc = await staffRef.add(dto.toJson());

      final createdDoc = await newDoc.get();
      return StaffModel.fromJson(createdDoc.data()!);
    } catch (e) {
      throw Exception('Failed to create staff: $e');
    }
  }
}
