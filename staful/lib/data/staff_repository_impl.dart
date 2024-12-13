import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:staful/domain/models/staff_model.dart';
import 'package:staful/domain/staff_repository.dart';

class StaffRepositoryImpl implements StaffRepository {
  @override
  Future<List<SelectableStaff>> fetchStaff() async {
    final snapshot = await FirebaseFirestore.instance.collection('staff').get();
    return snapshot.docs
        .map((doc) => SelectableStaff.fromFirestore(doc.data()))
        .toList();
  }
}
