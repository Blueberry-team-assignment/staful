import 'package:intl/intl.dart';

Map<String, dynamic> getCurrentDateTimeInfo() {
  // Get the current date and time
  DateTime now = DateTime.now();

  // Extract year, month, day, hour, and minute
  int year = now.year;
  int month = now.month;
  int day = now.day;
  int hour = now.hour;
  int minute = now.minute;

  // Get the day of the week in English
  String dayOfWeekEnglish = DateFormat('EEEE').format(now);

  // Map the day of the week to Korean
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

  // Return the results as a map
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
