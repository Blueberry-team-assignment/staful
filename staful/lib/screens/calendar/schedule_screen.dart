import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:staful/layouts/calendar_screen_layout.dart';
import 'package:staful/screens/calendar/edit_schedule_screen.dart';
import 'package:staful/utils/time_utils.dart';
import 'package:staful/widgets/schedule_table_widget.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class ScheduleScreen extends StatefulWidget {
  final DateTime date;
  const ScheduleScreen({
    super.key,
    required this.date,
  });

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final GlobalKey<ScheduleTableWidgetState> _scheduleTableKey =
      GlobalKey<ScheduleTableWidgetState>();

  void _handleParentTap() {
    // 자식 위젯에 정의된 scrollToCurrentTime 메서드를 호출
    _scheduleTableKey.currentState?.scrollToCurrentTime();
  }

  @override
  Widget build(BuildContext context) {
    final timeInfo = getCurrentDateTimeInfo();

    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: NavigateBackAppBar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 5,
          ),
          child: Column(
            children: [
              const SizedBox(
                  // height: 5,
                  ),
              GestureDetector(
                onTap: _handleParentTap,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      timeInfo["dayOfWeekKorean"],
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      [
                        timeInfo["year"].toString().substring(2),
                        timeInfo["month"],
                        timeInfo["day"]
                      ].join("."),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Flexible(child: ScheduleTableWidget()),
              // const TableViewCell(child: Text("hi"))
            ],
          ),
        ));
  }
}
