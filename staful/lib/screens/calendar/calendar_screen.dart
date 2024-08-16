import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staful/screens/calendar/daliy_calendar_screen.dart';
import 'package:staful/screens/calendar/edit_schedule_screen.dart';
import 'package:staful/screens/calendar/monthly_calendar_screen.dart';
import 'package:staful/screens/calendar/schedule_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({
    super.key,
  });

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  bool showDailyCalendar = true;
  int _currentIndex = 0;

  void handleOnPressed() {
    setState(() {
      showDailyCalendar = !showDailyCalendar;
    });
  }

  void handleCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childScreens = [
      showDailyCalendar
          ? DailyCalendarScreen(
              handleCurrentIndex: handleCurrentIndex,
            )
          : const MonthlyCalendarScreen(),
      const ScheduleScreen(),
      const EditScheduleScreen()
    ];

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          leadingWidth: 123,
          backgroundColor: Theme.of(context).colorScheme.surface,
          leading: Container(
            margin: const EdgeInsets.only(left: 30),
            child: SvgPicture.asset(
              'lib/assets/icons/logo_STAFull.svg',
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(
                right: 30,
              ),
              child: IconButton(
                iconSize: 50,
                onPressed: handleOnPressed,
                icon: Icon(showDailyCalendar
                    ? Icons.toggle_off_outlined
                    : Icons.toggle_on_rounded),
              ),
            )
          ],
        ),
        body: childScreens[_currentIndex]);
  }
}
