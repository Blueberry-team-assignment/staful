import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staful/layouts/calendar_screen_layout.dart';
import 'package:staful/widgets/staff_profile_widget.dart';

class EditScheduleScreen extends StatefulWidget {
  final dynamic workDate;
  final workSchedule;

  const EditScheduleScreen({
    super.key,
    required this.workDate,
    required this.workSchedule,
  });

  @override
  State<EditScheduleScreen> createState() => _EditScheduleScreenState();
}

class _EditScheduleScreenState extends State<EditScheduleScreen> {
  bool isOnEditMode = false;

  List<List<dynamic>> get scheduleInfo => [
        widget.workSchedule[0].split(":").map(int.parse).toList(),
        widget.workSchedule[1].split(":").map(int.parse).toList()
      ];

  late final updatedSchedule = widget.workSchedule;

  void handleOnUpdateOpeningHour(DateTime time) {
    setState(() {
      updatedSchedule[0] = time.toString().split(" ")[1].substring(0, 5);
    });
  }

  void handleOnUpdateClosingHour(DateTime time) {
    setState(() {
      updatedSchedule[1] = time.toString().split(" ")[1].substring(0, 5);
    });
  }

  void onTabEditBtn() {
    setState(() {
      isOnEditMode = true;
    });
  }

  void onTabUndoBtn() {
    setState(() {
      isOnEditMode = false;
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                '이 스케줄을 삭제하시겠습니까?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                '삭제되면 다시 복구되지 않습니다',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).disabledColor,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('취소'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: NavigateBackAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const Text(
                      "근무 시간",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    isOnEditMode
                        ? const SizedBox.shrink()
                        : SizedBox(
                            width: 43,
                            height: 29,
                            child: TextButton(
                              onPressed: onTabEditBtn,
                              style: ButtonStyle(
                                // alignment: Alignment.topCenter,s
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  Theme.of(context).primaryColorLight,
                                ),
                                padding:
                                    WidgetStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                              child: const Text(
                                "수정",
                                style: TextStyle(
                                  textBaseline: TextBaseline.alphabetic,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: const Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "근무자",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              StaffProfileWidget(imageName: "Ellipse 5.png"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "매니저",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "근무 날짜",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${widget.workDate["month"]}.${widget.workDate["day"]} ${widget.workDate["dayOfWeekKorean"]}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "근무 시간",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            isOnEditMode
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TimePicker(
                                        scheduleInfo: scheduleInfo[0],
                                        onDateTimeChanged:
                                            handleOnUpdateOpeningHour,
                                      ),
                                      TimePicker(
                                        scheduleInfo: scheduleInfo[1],
                                        onDateTimeChanged:
                                            handleOnUpdateClosingHour,
                                      ),
                                    ],
                                  )
                                : WorkScheduleForDisplay(widget: widget)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: isOnEditMode
                      ? Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                          Theme.of(context).disabledColor),
                                ),
                                onPressed: onTabUndoBtn,
                                child: const Text(
                                  "취소",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextButton(
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                          Theme.of(context).primaryColor),
                                ),
                                onPressed: () => {},
                                child: const Text(
                                  "저장",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          height: 48,
                          child: DeleteScheduleBtn(
                            onPressed: _showBottomSheet,
                          ),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteScheduleBtn extends StatelessWidget {
  final Function(BuildContext) onPressed;

  const DeleteScheduleBtn({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(context),
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(Theme.of(context).disabledColor),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      child: const Text(
        "근무 삭제",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}

class TimePicker extends StatelessWidget {
  final List scheduleInfo;
  final Function(DateTime) onDateTimeChanged;

  const TimePicker({
    super.key,
    required this.scheduleInfo,
    required this.onDateTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 170,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.time,
        minuteInterval: 5,
        onDateTimeChanged: onDateTimeChanged,
        initialDateTime: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          scheduleInfo[0],
          scheduleInfo[1],
        ),
        use24hFormat: true,
      ),
    );
  }
}

class WorkScheduleForDisplay extends StatelessWidget {
  const WorkScheduleForDisplay({
    super.key,
    required this.widget,
  });

  final EditScheduleScreen widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${widget.workSchedule[0]} - ${widget.workSchedule[1]}",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
