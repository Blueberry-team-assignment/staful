import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CalendarAppBar(context),
      body: SingleChildScrollView(
        child: toggleButtonIndex == 0
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
        SizedBox(
          width: 102,
          height: 34,
          child: ToggleButtons(
            onPressed: handleOnPressed,
            isSelected: [toggleButtonIndex == 0, toggleButtonIndex == 1],
            borderRadius: BorderRadius.circular(10),
            children: const [Text("일별"), Text("월별")],
          ),
        ),
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
