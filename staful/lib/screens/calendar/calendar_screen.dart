import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:staful/screens/calendar/schedule_screen.dart';
import 'package:staful/utils/dummies.dart';
import 'package:staful/utils/navigation_helpers.dart';
import 'package:staful/widgets/staff_profile_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({
    super.key,
  });

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  List<Widget> staffProfileWidgets(BuildContext context) {
    return staffs
        .map((staff) => Padding(
              padding: const EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () => openPage(
                  context,
                  ScheduleScreen(
                    date: _selectedDay,
                  ),
                ),
                child: StaffProfileWidget(
                  imagePath: "lib/assets/images/${staff.image}",
                  name: staff.name,
                ),
              ),
            ))
        .toList();
  }

  void onDaySelected(selectedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = selectedDay;
    });
  }

  // 헤더 한번 탭할 시, 선택했던 날짜로 포커스
  void handleOnHeaderTapped(DateTime _) {
    setState(() {
      _focusedDay = _selectedDay;
    });
  }

  // 헤더 길게 탭할 시, 리셋
  void handleOnHeaderLongPressed(DateTime _) {
    setState(() {
      _selectedDay = DateTime.now();
      _focusedDay = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 5,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 15,
              ),
              TableCalendar(
                onHeaderLongPressed: handleOnHeaderLongPressed,
                onHeaderTapped: handleOnHeaderTapped,
                onDaySelected: (selectedDay, focusedDay) => {
                  onDaySelected(selectedDay),
                },
                calendarStyle: CalendarStyle(
                  todayTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: calendarHeaderStyle(),
                locale: Localizations.localeOf(context).toString(),
                currentDay: _selectedDay,
                focusedDay: _focusedDay,
                firstDay: DateTime(1950),
                lastDay: DateTime(2150),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "근무자",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true, // 자식 위젯들의 크기에 맞게 자신의 크기를 줄이도록 함.
                    physics:
                        const NeverScrollableScrollPhysics(), // GridView 자체 스크롤 비활성화.
                    children: staffProfileWidgets(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  HeaderStyle calendarHeaderStyle() {
    return HeaderStyle(
      rightChevronIcon: ChevronIconStyle("r"),
      rightChevronMargin: const EdgeInsets.only(
        right: 70,
      ),
      leftChevronIcon: ChevronIconStyle("l"),
      leftChevronMargin: const EdgeInsets.only(
        left: 70,
      ),
      headerPadding: const EdgeInsets.only(bottom: 15),
      formatButtonVisible: false,
      titleCentered: true,
      titleTextFormatter: (date, locale) => DateFormat("y.MM").format(date),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        // decoration: TextDecoration.underline,
        // color: Colors.transparent,
        // shadows: [
        //   Shadow(
        //     // color: Colors.transparent,
        //     offset: Offset(0, -8),
        //   )
        // ],
      ),
    );
  }

  Icon ChevronIconStyle(direction) {
    return Icon(
      direction == "l"
          ? Icons.chevron_left_outlined
          : Icons.chevron_right_outlined,
      size: 30,
      color: Colors.black,
    );
  }
}
