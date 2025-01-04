import 'package:flutter/material.dart';
import 'package:staful/feature/schedule/domain/model/time_range_model.dart';
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

const weekDays = ["월", "화", "수", "목", "금", "토", "일"];

final defaultTimeRange = TimeRangeModel(
  start: const TimeOfDay(hour: 9, minute: 0),
  end: const TimeOfDay(hour: 18, minute: 0),
);
