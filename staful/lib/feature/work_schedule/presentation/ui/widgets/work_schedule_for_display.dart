import 'package:flutter/cupertino.dart';
import 'package:staful/feature/work_schedule/domain/model/time_range_model.dart';
import 'package:staful/utils/time_utils.dart';

class WorkScheduleForDisplay extends StatelessWidget {
  final TimeRangeModel workHours;

  const WorkScheduleForDisplay({
    super.key,
    required this.workHours,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          formatTimeOfDay(workHours.start),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "-",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          formatTimeOfDay(workHours.end),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
