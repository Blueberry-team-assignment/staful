// // ignore_for_file: non_constant_identifier_names

// import 'package:flutter/material.dart';
// import 'package:staful/domain/models/staff_model.dart';
// import 'package:staful/domain/models/template_model.dart';
// import 'package:staful/domain/utils/time_utils.dart';

// final TEMPLATES = [
//   Template(
//     name: "평일 마감 템플릿",
//     payDetails: [
//       PayDetail(description: "식대", amount: 80000, type: PayType.fixed),
//       PayDetail(description: "시급", amount: 10000, type: PayType.hourly),
//     ],
//     staffList: [],
//     templateId: 0,
//   ),
//   Template(
//     name: "주말 마감 템플릿",
//     payDetails: [
//       PayDetail(description: "식대", amount: 50000, type: PayType.fixed),
//       PayDetail(description: "시급", amount: 12000, type: PayType.hourly),
//     ],
//     staffList: [],
//     templateId: 1,
//   )
// ];

// final List<Staff> STAFFS = [
//   Staff(
//     name: "이나라",
//     image: "Ellipse 2.png",
//     workDays: ["mon", "tue", "fri"],
//     workHours: TimeRange(
//         startTime: const TimeOfDay(hour: 10, minute: 0),
//         endTime: const TimeOfDay(hour: 18, minute: 0)),
//     workDate: [],
//     templateId: 0,
//   ),
//   Staff(
//     name: "김경민",
//     image: "Ellipse 3.png",
//     workDays: ["wed", "thu", "fri"],
//     workHours: TimeRange(
//         startTime: const TimeOfDay(hour: 13, minute: 0),
//         endTime: const TimeOfDay(hour: 22, minute: 0)),
//     workDate: [],
//     templateId: 0,
//   ),
//   Staff(
//     name: "김선미",
//     image: "Ellipse 4.png",
//     workDays: ["mon", "thu"],
//     workHours: TimeRange(
//         startTime: const TimeOfDay(hour: 13, minute: 0),
//         endTime: const TimeOfDay(hour: 20, minute: 0)),
//     workDate: [],
//     templateId: 0,
//   ),
//   Staff(
//     name: "신동찬",
//     image: "Ellipse 5.png",
//     workDays: ["sun", "tue", "sat"],
//     workHours: TimeRange(
//         startTime: const TimeOfDay(hour: 8, minute: 0),
//         endTime: const TimeOfDay(hour: 18, minute: 0)),
//     workDate: [],
//     templateId: 1,
//   ),
//   Staff(
//     name: "매니저",
//     image: "Ellipse 2.png",
//     workDays: ["mon", "wed", "fri"],
//     workHours: TimeRange(
//         startTime: const TimeOfDay(hour: 9, minute: 0),
//         endTime: const TimeOfDay(hour: 18, minute: 0)),
//     workDate: [],
//     templateId: 1,
//   ),
//   Staff(
//     name: "김수한무거북",
//     image: "Ellipse 3.png",
//     workDays: ["mon", "tue", "sat"],
//     workHours: TimeRange(
//         startTime: const TimeOfDay(hour: 10, minute: 30),
//         endTime: const TimeOfDay(hour: 15, minute: 0)),
//     workDate: [],
//     templateId: 1,
//   ),
//   Staff(
//     name: "김수한무",
//     image: "Ellipse 4.png",
//     workDays: ["sun", "thu", "fri"],
//     workHours: TimeRange(
//         startTime: const TimeOfDay(hour: 11, minute: 0),
//         endTime: const TimeOfDay(hour: 19, minute: 0)),
//     workDate: [],
//     templateId: 1,
//   ),
//   Staff(
//     name: "Steive Kim",
//     image: "Ellipse 5.png",
//     workDays: ["mon", "wed", "sun"],
//     workHours: TimeRange(
//         startTime: const TimeOfDay(hour: 9, minute: 30),
//         endTime: const TimeOfDay(hour: 17, minute: 30)),
//     workDate: [],
//     templateId: 0,
//   ),
// ];

final mapOfWorkDays = {
  "sun": "일",
  "mon": "월",
  "tue": "화",
  "wed": "수",
  "thu": "목",
  "fri": "금",
  "sat": "토",
};
