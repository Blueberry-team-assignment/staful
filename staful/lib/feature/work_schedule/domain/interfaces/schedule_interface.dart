import 'package:staful/feature/work_schedule/data/dto/schedule_dto.dart';
import 'package:staful/feature/work_schedule/domain/model/schedule_model.dart';

abstract class ScheduleInterface {
  Future<ScheduleModel?> fetchModifiedSchedule({
    required String staffId,
    required DateTime selectedDay,
    required String uid,
  });

  Future<void> updateSchedules({
    required ScheduleDto dto,
    required String uid,
  });

  Future<void> deleteSchedules({
    required String staffId,
    required DateTime date,
    required String uid,
  });
}
