import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:staful/feature/work_schedule/presentation/provider/calendar_provider.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarWidget extends ConsumerWidget {
  const TableCalendarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarState = ref.watch(calendarNotifierProvider);
    final calendarNotifier = ref.read(calendarNotifierProvider.notifier);

    return TableCalendar(
      onHeaderLongPressed: (_) => calendarNotifier.selectDay(DateTime.now()),
      onHeaderTapped: (_) =>
          calendarNotifier.selectDay(calendarState.focusedDay!),
      onDaySelected: (selectedDay, focusedDay) =>
          calendarNotifier.selectDay(selectedDay),
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
      currentDay: calendarState.selectedDay,
      focusedDay: calendarState.focusedDay ?? DateTime.now(),
      firstDay: DateTime(1950),
      lastDay: DateTime(2150),
    );
  }

  HeaderStyle calendarHeaderStyle() {
    return HeaderStyle(
      rightChevronIcon: chevronIconStyle("r"),
      rightChevronMargin: const EdgeInsets.only(
        right: 70,
      ),
      leftChevronIcon: chevronIconStyle("l"),
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
      ),
    );
  }

  Icon chevronIconStyle(direction) {
    return Icon(
      direction == "l"
          ? Icons.chevron_left_outlined
          : Icons.chevron_right_outlined,
      size: 30,
      color: Colors.black,
    );
  }
}
