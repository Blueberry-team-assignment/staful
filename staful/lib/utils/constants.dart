import 'package:flutter/material.dart';
import 'package:staful/feature/payroll_template/domain/model/pay_detail_model.dart';
import 'package:staful/feature/work_schedule/domain/model/time_range_model.dart';
import 'package:staful/feature/payroll_template/domain/model/template_model.dart';

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

const defaultTimeRange = TimeRangeModel(
  start: TimeOfDay(hour: 9, minute: 0),
  end: TimeOfDay(hour: 18, minute: 0),
);

const defaultPayDetailList = [
  PayDetailModel(
      payType: PayType.hourly, desc: "시급", amount: 0, isSelected: true),
  PayDetailModel(
      payType: PayType.fixed, desc: "식대", amount: 0, isSelected: true),
  PayDetailModel(payType: PayType.fixed, desc: "추가 수당", amount: 0),
  PayDetailModel(payType: PayType.fixed, desc: "기타 수당", amount: 0),
];

const defaultTemplate =
    TemplateModel(name: "", payDetails: defaultPayDetailList);
