import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staful/screens/calendar/calendar_screen.dart';
import 'package:staful/screens/calendar/edit_schedule_screen.dart';

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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: NavigateBackAppBar(context),
      body: Center(
        child: GestureDetector(
            onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EditScheduleScreen(),
                  ),
                ),
            child: Text("${widget.date.toString().split(" ")[0]} 스케줄!!!")),
      ),
    );
  }
}
