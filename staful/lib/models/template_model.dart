import 'package:staful/models/staff_model.dart';

class TemplateModel {
  final String name;
  final List<PayDetail> payDetails;
  List<Staff>? staffList;

  TemplateModel({
    required this.name,
    required this.payDetails,
    this.staffList,
  });

  void getStaffList(List<Staff> staffList, String templateName) {
    this.staffList = staffList
        .where((staff) => staff.template.name == templateName)
        .toList();
  }
}

class PayDetail {
  final PayType type;
  final String description;
  final int amount;

  PayDetail({
    required this.type,
    required this.description,
    required this.amount,
  });
}

enum PayType { hourly, fixed }
