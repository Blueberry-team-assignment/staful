import 'package:staful/feature/schedule/data/dto/schedule_dto.dart';
import 'package:staful/feature/schedule/domain/model/schedule_model.dart';

abstract class ScheduleInterface {
  Future<List<ScheduleModel>> fetchModifiedSchedulesMonthly({
    required String staffId,
    required DateTime date,
  });

  Future<void> updateSchedules({
    required ScheduleDto dto,
  });

  Future<void> deleteSchedules({
    required String staffId,
    required DateTime date,
  });
}
