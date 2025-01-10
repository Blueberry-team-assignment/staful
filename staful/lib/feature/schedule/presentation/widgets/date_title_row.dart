import 'package:flutter/material.dart';
import 'package:staful/utils/time_utils.dart';

class DateTitleRow extends StatelessWidget {
  final DateTime date;

  const DateTitleRow({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final timeInfo = getTimeInfo(date: date);

    return Row(
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
    );
  }
}
