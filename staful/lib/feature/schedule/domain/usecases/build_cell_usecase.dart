import 'package:flutter/material.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/feature/schedule/presentation/edit_schedule_screen.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';
import 'package:staful/utils/navigation_helpers.dart';
import 'package:staful/utils/time_utils.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class BuildCellUseCase {
  final double normalCellWidth;

  BuildCellUseCase({required this.normalCellWidth});

  TableViewCell build(
    BuildContext context,
    TableVicinity vicinity,
    List<TimeRange?> schedules,
    List<Staff> staffList,
    DateTime date,
  ) {
    if (vicinity.row == 0) {
      return _buildHeaderCell(vicinity);
    }
    if (vicinity.column == 0) {
      return _buildProfileCell(vicinity, staffList);
    }
    return _buildScheduleCell(
      context,
      vicinity,
      schedules,
      date,
    );
  }

  TableViewCell _buildHeaderCell(TableVicinity vicinity) {
    if (vicinity.column == 0) return const TableViewCell(child: Text(""));
    final int number = vicinity.column - 1;
    return TableViewCell(
      child: SizedBox(
        height: 10,
        width: 50,
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
              fontSize: 13.0,
            ),
          ),
        ),
      ),
    );
  }

  TableViewCell _buildProfileCell(
      TableVicinity vicinity, List<Staff> staffList) {
    return TableViewCell(
      child: Container(
        color: Colors.white,
        child: Center(
          child: StaffProfileWidget(
            imagePath: staffList[vicinity.yIndex - 1].image,
            name: staffList[vicinity.yIndex - 1].name,
          ),
        ),
      ),
    );
  }

  TableViewCell _buildScheduleCell(
    BuildContext context,
    TableVicinity vicinity,
    List<TimeRange?> schedules,
    DateTime date,
  ) {
    final int start = schedules[vicinity.yIndex - 1]?.startTime.hour ?? 9 + 1;
    final int end = schedules[vicinity.yIndex - 1]?.endTime.hour ?? 18 + 1;
    final [startMinute, endMinute] = [
      schedules[vicinity.yIndex - 1]?.startTime.minute ?? 0,
      schedules[vicinity.yIndex - 1]?.endTime.minute ?? 0,
    ];
    if (vicinity.column >= start + 1 && vicinity.column <= end) {
      return TableViewCell(
        columnMergeStart: start + 1,
        columnMergeSpan: end - start + 2, // Span for merging columns
        child: GestureDetector(
          onTap: () => openPage(
            context,
            // 선택한 일정의 시간으로 수정해야함.
            EditScheduleScreen(
              workDate: {
                "month": date.month,
                "day": date.day,
                "dayOfWeekKorean": date.weekday,
              },
              workHours: schedules[vicinity.yIndex - 1],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                10 + normalCellWidth * (startMinute / 60),
                20,
                10 + normalCellWidth * ((60 - endMinute) / 60),
                20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ColoredBox(
                color: _isEmployeeOnSchedule(schedules[vicinity.yIndex - 1]!)
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.secondary,
                child: Center(
                  child: Text(
                    "${formatTimeOfDay(schedules[vicinity.yIndex - 1]!.startTime)} - ${formatTimeOfDay(schedules[vicinity.yIndex - 1]!.endTime)}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return const TableViewCell(child: SizedBox.shrink());
  }

  bool _isEmployeeOnSchedule(TimeRange schedule) {
    final timeInfo = DateTime.now();
    final [start, end] = [schedule.startTime, schedule.endTime];
    final [sHour, sMinute] = [start.hour, start.minute];
    final [eHour, eMinute] = [end.hour, end.minute];

    bool isOnSchedule = false;
    if (timeInfo.hour > sHour && timeInfo.hour < eHour) {
      isOnSchedule = true;
    }
    if (timeInfo.hour == sHour && timeInfo.minute >= sMinute) {
      isOnSchedule = true;
    }
    if (timeInfo.hour == eHour && timeInfo.minute <= eMinute) {
      isOnSchedule = true;
    }

    return isOnSchedule;
  }
}
