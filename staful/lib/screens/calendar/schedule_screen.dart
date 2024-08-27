import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:staful/layouts/calendar_screen_layout.dart';
import 'package:staful/screens/calendar/edit_schedule_screen.dart';
import 'package:staful/widgets/merged_table_widget.dart';
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
  @override
  Widget build(BuildContext context) {
    final [year, month, day] = widget.date.toString().split(" ")[0].split("-");

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: NavigateBackAppBar(context),
        body: Column(
          children: [
            Row(
              children: [
                Text(day),
                Text([year, month, day].join("."))
              ],
            ),
            const Flexible(child: MergedTableWidget()),
            // const TableViewCell(child: Text("hi"))
          ],
        ));
  }
}
