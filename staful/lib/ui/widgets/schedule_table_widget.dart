import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/feature/calendar/provider/calendar_provider.dart';
import 'package:staful/ui/screens/calendar/edit_schedule_screen.dart';
import 'package:staful/utils/constants.dart';
import 'package:staful/utils/navigation_helpers.dart';
import 'package:staful/utils/time_utils.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class ScheduleTableWidget extends ConsumerStatefulWidget {
  final DateTime date;

  const ScheduleTableWidget({
    super.key,
    required this.date,
  });

  @override
  ConsumerState<ScheduleTableWidget> createState() =>
      ScheduleTableWidgetState();
}

class ScheduleTableWidgetState extends ConsumerState<ScheduleTableWidget> {
  late final double screenWidth = MediaQuery.of(context).size.width;
  final timeInfo = getTimeInfo();
  final ScrollController _scrollController = ScrollController();
  final double normalCellWidth = 28;
  final double profileCellWidth = 74;
  final List<int> _numbers = List.generate(
      27,
      (index) =>
          index - 1); // -1 ~ 24까지 리스트. -1은 0번째 컬럼을 위함. 시간표는 1번째 행(0)부터 시작함.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToCurrentTime();
    });
  }

  void scrollToCurrentTime() {
    final timeInfo = getTimeInfo(date: DateTime.now());
    final int currentHour = timeInfo["hour"];
    final int currentMinute = timeInfo["minute"];
    final int columnIndex = currentHour + 2;

    // 각 시간 셀의 중간에 해당하는 분 위치 계산
    final double minuteOffset = (currentMinute / 60.0) * normalCellWidth;

    // 화면 중앙에 오도록 스크롤할 위치 계산
    final double targetScrollOffset = columnIndex * normalCellWidth +
        minuteOffset -
        (screenWidth / 2 + normalCellWidth / 2) +
        profileCellWidth;

    _scrollController.animateTo(
      targetScrollOffset,
      duration: const Duration(milliseconds: 1300),
      curve: Curves.easeInOutBack,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(calendarViewModelProvider);
    final schedules = [
      defaultTimeRange,
      ...state.filteredStaff.map((staff) => staff.workHours)
    ];
    print(schedules);

    return Scaffold(
        body: TableView.builder(
      horizontalDetails: ScrollableDetails(
        controller: _scrollController,
        direction: AxisDirection.right,
      ),
      cellBuilder: (context, vicinity) =>
          _buildCell(context, vicinity, schedules, state.filteredStaff),
      columnCount: 27,
      pinnedColumnCount: 1,
      columnBuilder: _buildColumnSpan,
      rowCount: schedules.length,
      rowBuilder: _buildRowSpan,
      pinnedRowCount: 1,
    ));
  }

  TableViewCell _buildCell(BuildContext context, TableVicinity vicinity,
      List<TimeRange?> schedules, List<Staff> staffList) {
    if (vicinity.row == 0) {
      if (vicinity.column == 0) return const TableViewCell(child: Text(""));
      final int number = _numbers[vicinity.column];
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

    if (vicinity.column == 0) {
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

    final int start = schedules[vicinity.yIndex]?.startTime.hour ?? 9 + 1;
    final int end = schedules[vicinity.yIndex]?.endTime.hour ?? 18 + 1;
    final [startMinute, endMinute] = [
      schedules[vicinity.yIndex]?.startTime.minute ?? 0,
      schedules[vicinity.yIndex]?.endTime.minute ?? 0,
    ];
    if (vicinity.column >= start + 1 && vicinity.column <= end) {
      return TableViewCell(
        columnMergeStart: start + 1,
        columnMergeSpan: end - start + 2, // Span for merging columns
        child: GestureDetector(
          onTap: () => openPage(
            context,
            EditScheduleScreen(
              workDate: {
                "month": timeInfo["month"],
                "day": timeInfo["day"],
                "dayOfWeekKorean": timeInfo["dayOfWeekKorean"]
              },
              workHours: schedules[vicinity.yIndex],
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
                color: _isEmployeeOnSchedule(schedules[vicinity.yIndex]!)
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.secondary,
                child: Center(
                  child: Text(
                    "${formatTimeOfDay(schedules[vicinity.yIndex]!.startTime)} - ${formatTimeOfDay(schedules[vicinity.yIndex]!.endTime)}",
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

  TableSpan _buildColumnSpan(int index) {
    return TableSpan(
      extent:
          FixedTableSpanExtent(index == 0 ? profileCellWidth : normalCellWidth),
      foregroundDecoration: index == 0
          ? TableSpanDecoration(
              border: TableSpanBorder(
                trailing: BorderSide(
                  width: 0.5,
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
            )
          : null,
    );
  }

  TableSpan _buildRowSpan(int index) {
    return TableSpan(
      extent: FixedTableSpanExtent(index == 0 ? 40 : 80),
      padding: index > 0 ? const TableSpanPadding(leading: 5.0) : null,
    );
  }

  bool _isEmployeeOnSchedule(TimeRange schedule) {
    final [start, end] = [schedule.startTime, schedule.endTime];
    final [sHour, sMinute] = [start.hour, start.minute];
    final [eHour, eMinute] = [end.hour, end.minute];

    bool isOnSchedule = false;
    if (timeInfo["hour"] > sHour && timeInfo["hour"] < eHour) {
      isOnSchedule = true;
    }
    if (timeInfo["hour"] == sHour && timeInfo["minute"] >= sMinute) {
      isOnSchedule = true;
    }
    if (timeInfo["hour"] == eHour && timeInfo["minute"] <= eMinute) {
      isOnSchedule = true;
    }

    return isOnSchedule;
  }
}
