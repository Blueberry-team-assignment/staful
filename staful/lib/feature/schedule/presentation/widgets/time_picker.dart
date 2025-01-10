import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  final TimeOfDay scheduleInfo;
  final Function(DateTime) onDateTimeChanged;

  const TimePicker({
    super.key,
    required this.scheduleInfo,
    required this.onDateTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.time,
        minuteInterval: 10,
        onDateTimeChanged: onDateTimeChanged,
        initialDateTime: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          scheduleInfo.hour,
          scheduleInfo.minute,
        ),
        use24hFormat: true,
      ),
    );
  }
}
