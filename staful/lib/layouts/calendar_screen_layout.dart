import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:staful/layouts/app_layout.dart';

import 'package:staful/screens/calendar/daliy_calendar_screen.dart';
import 'package:staful/screens/calendar/monthly_calendar_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({
    super.key,
  });

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int toggleButtonIndex = 0;

  void handleOnPressed(int index) {
    setState(() {
      toggleButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: appBarWithLogo(context),
      body: SingleChildScrollView(
        child: toggleButtonIndex == 0
            ? const DailyCalendarScreen()
            : const MonthlyCalendarScreen(),
      ),
    );
  }
}
