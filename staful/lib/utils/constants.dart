import 'package:flutter/material.dart';
import 'package:staful/utils/time_utils.dart';

const mapOfWorkDays = {
  "sun": "일",
  "mon": "월",
  "tue": "화",
  "wed": "수",
  "thu": "목",
  "fri": "금",
  "sat": "토",
};

final defaultTimeRange = TimeRange(
  startTime: const TimeOfDay(hour: 9, minute: 0),
  endTime: const TimeOfDay(hour: 18, minute: 0),
);
