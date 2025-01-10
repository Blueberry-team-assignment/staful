import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:staful/feature/schedule/data/dto/schedule_dto.dart';
import 'package:staful/feature/schedule/domain/interfaces/schedule_interface.dart';
import 'package:staful/feature/schedule/domain/model/schedule_model.dart';

class ScheduleRepository implements ScheduleInterface {
  final FirebaseFirestore _firebaseFirestore;

  ScheduleRepository(this._firebaseFirestore);

  // 해당 직원, 해당 월의 조정스케쥴 불러오기
  @override
  Future<List<ScheduleModel>> fetchModifiedSchedulesMonthly({
    required String staffId,
    required DateTime date,
  }) async {
    try {
      final firstDayOfMonth = DateTime(date.year, date.month, 1);
      final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);

      final scheduleSnapshot = await FirebaseFirestore.instance
          .collection('staff')
          .doc(staffId)
          .collection('modifiedSchedules')
          .where('date', isGreaterThanOrEqualTo: firstDayOfMonth)
          .where('date', isLessThanOrEqualTo: lastDayOfMonth)
          .where('isDeleted', isEqualTo: false)
          .get();

      return scheduleSnapshot.docs.map((schedule) {
        final data = schedule.data();
        data['id'] = schedule.id;
        return ScheduleModel.fromJson(data);
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch schedules: $e');
    }
  }

  // 조정스케쥴 등록 및 수정
  @override
  Future<void> updateSchedules({
    required ScheduleDto dto,
  }) async {
    try {
      final scheduleRef = _firebaseFirestore
          .collection('staff')
          .doc(dto.staffId)
          .collection('modifiedSchedules');

      final existingSchedule =
          await scheduleRef.where('date', isEqualTo: dto.date).get();

      if (existingSchedule.docs.isNotEmpty) {
        //  기존 문서 업데이트
        await scheduleRef.doc(existingSchedule.docs.first.id).update({
          'workHours': dto.workHours.toJson(),
        });
      } else {
        // 새로운 문서 추가
        await scheduleRef.add({
          'date': dto.date,
          'workHours': dto.workHours.toJson(),
          'isDeleted': false,
        });
      }
    } catch (e) {
      throw Exception('Failed to update schedule: $e');
    }
  }

  @override
  Future<void> deleteSchedules(
      {required String staffId, required DateTime date}) async {
    try {
      final scheduleRef = _firebaseFirestore
          .collection('staff')
          .doc(staffId)
          .collection('modifiedSchedules');

      final existingSchedule =
          await scheduleRef.where('date', isEqualTo: date).get();

      if (existingSchedule.docs.isNotEmpty) {
        await scheduleRef.doc(existingSchedule.docs.first.id).update({
          'isDeleted': true,
        });
      }
    } catch (e) {
      throw Exception('Failed to delete schedule: $e');
    }
  }
}
