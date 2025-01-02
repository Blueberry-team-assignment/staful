import 'package:flutter/material.dart';
import 'package:staful/data/models/template_model.dart';
import 'package:staful/utils/time_utils.dart';

// class Staff {
//   final String name;
//   final String image;
//   final List<String> workDays;
//   final TimeRange workHours;
//   final List<String>? workDate;
//   final String memo;
//   final TemplateModel template;

//   Staff({
//     required this.name,
//     required this.image,
//     required this.workDays,
//     required this.workHours,
//     this.workDate,
//     this.memo = "",
//     required this.template,
//   });

//   // 주간 근무 시간을 계산하는 메서드
//   Map<String, int> get weeklyWorkingHours {
//     final dailyWorkMinutes = workHours.workDurationInMinutes;
//     final totalWorkMinutes =
//         dailyWorkMinutes * workDays.length; // 모든 요일의 근무시간은 동일하다고 가정

//     return {"hour": totalWorkMinutes ~/ 60, "minute": totalWorkMinutes % 60};
//   }

//   // 총 지급액을 계산하는 메서드
//   int get totalPay {
//     final int totalWorkMinutes =
//         workHours.workDurationInMinutes * workDays.length;
//     return template.payDetails.fold(0, (sum, payDetail) {
//       if (payDetail.type == PayType.hourly) {
//         // 시간에 비례한 지급액일 때
//         final hourlyRate = payDetail.amount;
//         return sum + (hourlyRate * totalWorkMinutes ~/ 60);
//       } else {
//         // 고정급일 때
//         return sum + payDetail.amount;
//       }
//     });
//   }
// }

class Staff {
  final String name;
  final String? image;
  final List<String>? workDays;
  final TimeRange? workHours;
  final List<String>? workDate;
  final String staffId;
  final String? desc;

  // UI 관련 상태 변수
  bool isSelected; // 선택 여부
  bool isVisible; // 보임 여부

  Staff({
    required this.name,
    this.image,
    this.workDays,
    this.workHours,
    this.workDate,
    this.desc,
    required this.staffId,
    this.isSelected = false, // 기본값: 선택되지 않음
    this.isVisible = true, // 기본값: 보임
  });

  void toggleSelected() {
    isSelected = !isSelected;
  }

  void toggleVisibility(bool show) {
    isVisible = show;
  }

  // 주간 근무 시간을 계산하는 메서드
  Map<String, int> get weeklyWorkingHours {
    if (workDays == null || workDays?.length == 0) {
      return {"hour": 0, "minute": 0};
    }
    final dailyWorkMinutes = workHours?.workDurationInMinutes ?? 0;
    final totalWorkMinutes =
        dailyWorkMinutes * workDays!.length; // 모든 요일의 근무시간은 동일하다고 가정

    return {"hour": totalWorkMinutes ~/ 60, "minute": totalWorkMinutes % 60};
  }

  // Firestore 데이터를 기반으로 인스턴스를 생성하는 팩토리 메서드
  factory Staff.fromFirestore(Map<String, dynamic> data) {
    final workHourData = data["workHours"] as Map<String, dynamic>?;

    // workHours 처리
    final newWorkHour = workHourData != null
        ? TimeRange(
            startTime: TimeOfDay(
                hour: workHourData["start"]["hour"],
                minute: workHourData["start"]["minute"]),
            endTime: TimeOfDay(
                hour: workHourData["end"]["hour"],
                minute: workHourData["end"]["minute"]),
          )
        : TimeRange(
            startTime: const TimeOfDay(hour: 9, minute: 0), // 기본값
            endTime: const TimeOfDay(hour: 18, minute: 0), // 기본값
          );

    return Staff(
      name: data["name"],
      image: data["image"],
      workDays:
          data["workDays"] != null ? List<String>.from(data["workDays"]) : [],
      workHours: newWorkHour,
      workDate:
          data["workDate"] != null ? List<String>.from(data["workDate"]) : [],
      staffId: data["staffId"] ?? "",
      desc: data["desc"] ?? "",
    );
  }

  // 인스턴스를 Firestore 형식으로 변환
  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "image": image,
      "workDays": workDays,
      "workHours": workHours,
      "workDate": workDate,
      "staffId": staffId,
      "desc": desc,
    };
  }

  Staff copyWith({
    String? name,
    String? templateId,
    String? staffId,
    String? desc,
    String? image,
    List<String>? workDate,
    List<String>? workDays,
    TimeRange? workHours,
    bool? isSelected,
    bool? isVisible,
  }) {
    return Staff(
      name: name ?? this.name,
      staffId: staffId ?? this.staffId,
      desc: desc ?? this.desc,
      image: image ?? this.image,
      workDate: workDate ?? this.workDate,
      workDays: workDays ?? this.workDays,
      workHours: workHours ?? this.workHours,
      isSelected: isSelected ?? this.isSelected,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}
