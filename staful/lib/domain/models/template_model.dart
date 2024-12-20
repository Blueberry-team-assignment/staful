import 'package:staful/domain/models/staff_model.dart';

// class Template {
//   final String name;
//   final List<PayDetail> payDetails;
//   List<String> staffIds;
//   int templateId;

//   Template({
//     required this.name,
//     required this.payDetails,
//     required this.staffIds,
//     required this.templateId,
//   });

// void getStaffList(List<Staff> staffList, String templateName) {
//   this.staffList = staffList
//       .where((staff) => staff.template.name == templateName)
//       .toList();
// }
// }

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

class SelectablePayDetail {
  final PayDetail payDetail;
  bool isSelected;
  bool isVisible;

  SelectablePayDetail({
    required this.payDetail,
    this.isSelected = false,
    this.isVisible = true,
  });

  void toggleSelected() {
    isSelected = !isSelected;
  }

  void toggleVisibility() {
    isVisible = !isVisible;
  }
}

class Template {
  final String name;
  final List<SelectablePayDetail>? payDetails; // 지급 세부사항
  final List<String>? staffIds; // 이 템플릿을 사용하는 스태프 ID
  final List<String> templateId;

  // UI 관련 상태 변수
  bool isSelected; // 선택 여부
  bool isVisible; // 보임 여부

  Template({
    required this.name,
    required this.payDetails,
    this.staffIds,
    required this.templateId,
    this.isSelected = false, // 기본값: 선택되지 않음
    this.isVisible = true, // 기본값: 보임
  });

  // Firestore 데이터를 기반으로 인스턴스를 생성하는 팩토리 메서드
  factory Template.fromFirestore(Map<String, dynamic> data) {
    return Template(
      name: data["name"],
      payDetails: List<SelectablePayDetail>.from(data["payDetails"]),
      staffIds: List<String>.from(data["staffIds"]),
      templateId: data["templateId"],
    );
  }

  // 인스턴스를 Firestore 형식으로 변환
  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "payDetails": payDetails,
      "staffIds": staffIds,
      "templateId": templateId,
    };
  }
}
