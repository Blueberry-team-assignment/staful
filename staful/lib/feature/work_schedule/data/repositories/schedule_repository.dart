import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/work_schedule/data/dto/schedule_dto.dart';
import 'package:staful/feature/work_schedule/domain/interfaces/schedule_interface.dart';
import 'package:staful/feature/work_schedule/domain/model/schedule_model.dart';
import 'package:staful/utils/constants.dart';

final scheduleRepositoryProvider = Provider((ref) {
  return ScheduleRepository(FirebaseFirestore.instance);
});

class ScheduleRepository implements ScheduleInterface {
  final FirebaseFirestore _firebaseFirestore;

  ScheduleRepository(this._firebaseFirestore);

  // 해당 직원의 해당 날짜의 조정스케쥴 불러오기
  @override
  Future<ScheduleModel?> fetchModifiedSchedule({
    required String staffId,
    required DateTime selectedDay,
    required String uid,
  }) async {
    try {
      // 정확한 비교를 위해 시간정보 제거
      final formattedSelectedDay = DateTime(
        selectedDay.year,
        selectedDay.month,
        selectedDay.day,
      ).toIso8601String();

      // 선택된 날짜와 일치하는 조정 스케줄 조회
      final scheduleSnapshot = await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('staff')
          .doc(staffId)
          .collection('modified_schedules')
          .where('date', isEqualTo: formattedSelectedDay)
          .get();

      if (scheduleSnapshot.docs.isEmpty) {
        return null;
      }

      final schedule = scheduleSnapshot.docs.first;
      final data = schedule.data();
      data['id'] = schedule.id;
      return ScheduleModel.fromJson(data);
    } catch (e) {
      throw Exception('Failed to fetch schedules: $e');
    }
  }

  // 조정스케쥴 등록 및 수정
  @override
  Future<void> updateSchedules({
    required ScheduleDto dto,
    required String uid,
  }) async {
    try {
      final formattedSelectedDay = DateTime(
        dto.date.year,
        dto.date.month,
        dto.date.day,
      ).toIso8601String();

      final scheduleRef = _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('staff')
          .doc(dto.staffId)
          .collection('modified_schedules');

      final existingSchedule = await scheduleRef
          .where('date', isEqualTo: formattedSelectedDay)
          .get();

      if (existingSchedule.docs.isNotEmpty) {
        //  기존 문서 업데이트
        await scheduleRef.doc(existingSchedule.docs.first.id).update({
          'workHours': dto.workHours.toJson(),
        });
      } else {
        // 새로운 문서 추가
        await scheduleRef.add({
          'date': formattedSelectedDay,
          'workHours': dto.workHours.toJson(),
          'isDeleted': false,
        });
      }
    } catch (e) {
      throw Exception('Failed to update schedule: $e');
    }
  }

  @override
  Future<void> deleteSchedules({
    required String staffId,
    required DateTime date,
    required String uid,
  }) async {
    try {
      final formattedSelectedDay = DateTime(
        date.year,
        date.month,
        date.day,
      ).toIso8601String();

      final scheduleRef = _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('staff')
          .doc(staffId)
          .collection('modified_schedules');

      final existingSchedule = await scheduleRef
          .where('date', isEqualTo: formattedSelectedDay)
          .get();

      if (existingSchedule.docs.isNotEmpty) {
        await scheduleRef.doc(existingSchedule.docs.first.id).update({
          'isDeleted': true,
        });
      } else {
        await scheduleRef.add({
          'date': formattedSelectedDay,
          'workHours': defaultTimeRange.toJson(),
          'isDeleted': true,
        });
      }
    } catch (e) {
      throw Exception('Failed to delete schedule: $e');
    }
  }
}
