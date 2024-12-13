import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addDummyData() async {
  final staffCollection = FirebaseFirestore.instance.collection('staff');
  final templateCollection = FirebaseFirestore.instance.collection('template');

  List<Map<String, dynamic>> dummyStaff = [
    {
      "name": "이나라",
      "image": "Ellipse 2.png",
      "workDays": ["mon", "tue", "fri"],
      "workHours": {
        "start": {"hour": 10, "minute": 0},
        "end": {"hour": 18, "minute": 0}
      },
      "workDate": [],
      "templateId": 0,
      "desc": ""
    },
    {
      "name": "김경민",
      "image": "Ellipse 3.png",
      "workDays": ["wed", "thu", "fri"],
      "workHours": {
        "start": {"hour": 13, "minute": 0},
        "end": {"hour": 22, "minute": 0}
      },
      "workDate": [],
      "templateId": 0,
      "desc": ""
    },
    {
      "name": "김선미",
      "image": "Ellipse 4.png",
      "workDays": ["mon", "thu"],
      "workHours": {
        "start": {"hour": 13, "minute": 0},
        "end": {"hour": 20, "minute": 0}
      },
      "workDate": [],
      "templateId": 0,
      "desc": ""
    },
    {
      "name": "신동찬",
      "image": "Ellipse 5.png",
      "workDays": ["sun", "tue", "sat"],
      "workHours": {
        "start": {"hour": 8, "minute": 0},
        "end": {"hour": 18, "minute": 0}
      },
      "workDate": [],
      "templateId": 1,
      "desc": ""
    },
    {
      "name": "매니저",
      "image": "Ellipse 2.png",
      "workDays": ["mon", "wed", "fri"],
      "workHours": {
        "start": {"hour": 9, "minute": 0},
        "end": {"hour": 18, "minute": 0}
      },
      "workDate": [],
      "templateId": 1,
      "desc": ""
    },
    {
      "name": "김수한무거북",
      "image": "Ellipse 3.png",
      "workDays": ["mon", "tue", "sat"],
      "workHours": {
        "start": {"hour": 10, "minute": 30},
        "end": {"hour": 15, "minute": 0}
      },
      "workDate": [],
      "templateId": 1,
      "desc": ""
    },
    {
      "name": "김수한무",
      "image": "Ellipse 4.png",
      "workDays": ["sun", "thu", "fri"],
      "workHours": {
        "start": {"hour": 11, "minute": 0},
        "end": {"hour": 19, "minute": 0}
      },
      "workDate": [],
      "templateId": 1,
      "desc": ""
    },
    {
      "name": "Steive Kim",
      "image": "Ellipse 5.png",
      "workDays": ["mon", "wed", "sun"],
      "workHours": {
        "start": {"hour": 9, "minute": 30},
        "end": {"hour": 17, "minute": 30}
      },
      "workDate": [],
      "templateId": 0,
      "desc": ""
    }
  ];
  List<Map<String, dynamic>> dummyTemplate = [
    {
      "name": "평일 마감 템플릿",
      "payDetails": [
        {"description": "식대", "amount": 80000, "type": "fixed"},
        {"description": "시급", "amount": 10000, "type": "hourly"}
      ],
      "staffList": []
    },
    {
      "name": "주말 마감 템플릿",
      "payDetails": [
        {"description": "식대", "amount": 50000, "type": "fixed"},
        {"description": "시급", "amount": 12000, "type": "hourly"}
      ],
      "staffList": []
    }
  ];

  for (var i = 0; i < dummyStaff.length; i++) {
    final staff = dummyStaff[i];
    staff["id"] = i;
    await staffCollection.add(staff);

    if (i < dummyTemplate.length) {
      final template = dummyTemplate[i];
      template["id"] = i;
      await templateCollection.add(template);
    }
  }

  print("Dummy data added!");
}
