import 'package:flutter/material.dart';
import 'package:staful/models/template_model.dart';

class Staff {
  final String name;
  final String image;
  final List<String> workDays;
  final TimeRange workHours;
  final List<String>? workDate;
  final String memo;
  final TemplateModel template;

  Staff({
    required this.name,
    required this.image,
    required this.workDays,
    required this.workHours,
    this.workDate,
    this.memo = "",
    required this.template,
  });

  // 주간 근무 시간을 계산하는 메서드
  Map<String, int> get weeklyWorkingHours {
    final dailyWorkMinutes = workHours.workDurationInMinutes;
    final totalWorkMinutes =
        dailyWorkMinutes * workDays.length; // 모든 요일의 근무시간은 동일하다고 가정

    return {"hour": totalWorkMinutes ~/ 60, "minute": totalWorkMinutes % 60};
  }

  // 총 지급액을 계산하는 메서드
  int get totalPay {
    final int totalWorkMinutes =
        workHours.workDurationInMinutes * workDays.length;
    return template.payDetails.fold(0, (sum, payDetail) {
      if (payDetail.type == PayType.hourly) {
        // 시간에 비례한 지급액일 때
        final hourlyRate = payDetail.amount;
        return sum + (hourlyRate * totalWorkMinutes ~/ 60);
      } else {
        // 고정급일 때
        return sum + payDetail.amount;
      }
    });
  }
}

class TimeRange {
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  TimeRange({
    required this.startTime,
    required this.endTime,
  });

  // 하루의 근무 시간을 분 단위로 계산하는 메서드
  int get workDurationInMinutes {
    final startMinutes = startTime.hour * 60 + startTime.minute;
    final endMinutes = endTime.hour * 60 + endTime.minute;
    return endMinutes - startMinutes;
  }
}
