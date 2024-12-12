import 'package:flutter/material.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => CalendarWidgetState();
}

class CalendarWidgetState extends State<CalendarWidget> {
  DateTime date = DateTime.now(); // 선택한 날짜를 입력받을 변수 선언

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: TextButton(
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context, // 팝업으로 띄우기 때문에 context 전달
                    initialDate:
                        date, // 달력을 띄웠을 때 선택된 날짜. 위에서 date 변수에 오늘 날짜를 넣었으므로 오늘 날짜가 선택돼서 나옴
                    firstDate: DateTime(1900), // 시작 년도
                    lastDate:
                        DateTime.now(), // 마지막 년도. 오늘로 지정하면 미래의 날짜는 선택할 수 없음
                  );
                  if (selectedDate != null) {
                    setState(() {
                      date = selectedDate; // 선택한 날짜는 date 변수에 저장
                    });
                  }
                },
                child: Text(
                    '$date')) //출력하면 시간도 같이 출력이 되는데 날짜만 표시하고 싶으면 substring으로 잘라내면 됨
            ));
  }
}
