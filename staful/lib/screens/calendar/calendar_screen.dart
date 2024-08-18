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

  void handleOnPressed() {
    setState(() {
      showDailyCalendar = !showDailyCalendar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CalendarAppBar(context),
      body: SingleChildScrollView(
        child: showDailyCalendar
            ? const DailyCalendarScreen()
            : const MonthlyCalendarScreen(),
      ),
    );
  }

  AppBar CalendarAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 93,
      backgroundColor: Theme.of(context).colorScheme.surface,
      leading: SvgPicture.asset(
        'lib/assets/icons/logo_STAFull.svg',
      ),
      actions: [
        IconButton(
          iconSize: 50,
          onPressed: handleOnPressed,
          icon: Icon(showDailyCalendar
              ? Icons.toggle_off_outlined
              : Icons.toggle_on_rounded),
        )
      ],
    );
  }
}

AppBar NavigateBackAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.surface,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_outlined),
      onPressed: () => Navigator.of(context).pop(),
    ),
  );
}
