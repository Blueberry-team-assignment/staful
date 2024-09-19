import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Map<String, dynamic> getCurrentDateTimeInfo() {
  DateTime now = DateTime.now();

  int year = now.year;
  int month = now.month;
  int day = now.day;
  int hour = now.hour;
  int minute = now.minute;

  String dayOfWeekEnglish = DateFormat('EEEE').format(now);

  Map<String, String> daysOfWeekKorean = {
    'Monday': '월요일',
    'Tuesday': '화요일',
    'Wednesday': '수요일',
    'Thursday': '목요일',
    'Friday': '금요일',
    'Saturday': '토요일',
    'Sunday': '일요일',
  };

  String dayOfWeekKorean = daysOfWeekKorean[dayOfWeekEnglish]!;

  return {
    'year': year,
    'month': month,
    'day': day,
    'hour': hour,
    'minute': minute,
    'dayOfWeekEnglish': dayOfWeekEnglish,
    'dayOfWeekKorean': dayOfWeekKorean,
  };
}

String formatTimeOfDay(TimeOfDay time) {
  final hour = time.hour.toString().padLeft(2, '0'); // 시간이 한 자리일 경우 앞에 0을 붙임
  final minute = time.minute.toString().padLeft(2, '0'); // 분이 한 자리일 경우 앞에 0을 붙임

  return "$hour : $minute";
}
