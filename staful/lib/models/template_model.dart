import 'package:staful/models/staff_model.dart';

class TemplateModel {
  final String name;
  final List<Map<String, int>>? payDetails;
  final List<Staff>? staffList;

  TemplateModel({
    required this.name,
    this.payDetails,
    this.staffList,
  });
}
