import 'package:flutter/material.dart';
import 'package:staful/screens/calendar/edit_schedule_screen.dart';
import 'package:staful/utils/time_utils.dart';
import 'package:staful/widgets/staff_profile_widget.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class ScheduleTableWidget extends StatefulWidget {
  const ScheduleTableWidget({
    super.key,
  });

  @override
  State<ScheduleTableWidget> createState() => ScheduleTableWidgetState();
}

class ScheduleTableWidgetState extends State<ScheduleTableWidget> {
  late final double screenWidth = MediaQuery.of(context).size.width;
  final timeInfo = getCurrentDateTimeInfo();
  final ScrollController _scrollController = ScrollController();
  final double normalCellWidth = 28;
  final double profileCellWidth = 74;
  final List<int> _numbers = List.generate(
      27,
      (index) =>
          index - 1); // -1 ~ 24까지 리스트. -1은 0번째 컬럼을 위함. 시간표는 1번째 행(0)부터 시작함.

  final schedules = [
    [],
    ["10:30", "20:30"],
    ["10:50", "21:00"],
    ["14:00", "24:00"]
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToCurrentTime();
    });
  }

  void scrollToCurrentTime() {
    final timeInfo = getCurrentDateTimeInfo();
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
    return Scaffold(
        body: TableView.builder(
      horizontalDetails: ScrollableDetails(
        controller: _scrollController,
        direction: AxisDirection.right,
      ),
      cellBuilder: _buildCell,
      columnCount: 27,
      pinnedColumnCount: 1,
      columnBuilder: _buildColumnSpan,
      rowCount: schedules.length,
      rowBuilder: _buildRowSpan,
      pinnedRowCount: 1,
    ));
  }

  TableViewCell _buildCell(BuildContext context, TableVicinity vicinity) {
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
      return const TableViewCell(
        child: Center(
          child: StaffProfileWidget(
            imageName: "Ellipse 3.png",
            name: "매니저",
          ),
        ),
      );
    }

    final int start = _getTimeIndex(schedules[vicinity.yIndex][0]) + 1;
    final int end = _getTimeIndex(schedules[vicinity.yIndex][1]) + 1;
    final [startMinute, endMinute] = [
      int.parse(schedules[vicinity.yIndex][0].split(":")[1]),
      int.parse(schedules[vicinity.yIndex][1].split(":")[1])
    ];
    if (vicinity.column >= start && vicinity.column <= end) {
      return TableViewCell(
        columnMergeStart: start,
        columnMergeSpan: end - start + 2, // Span for merging columns
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const EditScheduleScreen(),
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
                color: _isEmployeeOnSchedule(schedules[vicinity.yIndex])
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.secondary,
                child: Center(
                  child: Text(
                    "${schedules[vicinity.yIndex][0]} - ${schedules[vicinity.yIndex][1]}",
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

  int _getTimeIndex(String time) {
    final int hour = int.parse(time.split(":")[0]);
    return hour;
  }

  bool _isEmployeeOnSchedule(schedule) {
    final [start, end] = schedule;
    final [sHour, sMinute] = start.split(":").map(int.parse).toList();
    final [eHour, eMinute] = end.split(":").map(int.parse).toList();

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
