import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/domain/utils/app_styles.dart';
import 'package:staful/ui/widgets/bottom_sheet_widget.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';

class EditScheduleScreen extends StatefulWidget {
  final dynamic workDate;
  final dynamic workHours;

  const EditScheduleScreen({
    super.key,
    required this.workDate,
    required this.workHours,
  });

  @override
  State<EditScheduleScreen> createState() => _EditScheduleScreenState();
}

class _EditScheduleScreenState extends State<EditScheduleScreen> {
  bool isOnEditMode = false;

  List<TimeOfDay> get scheduleInfo => [
        widget.workHours[0].split(":").map(int.parse).toList(),
        widget.workHours[1].split(":").map(int.parse).toList()
      ];

  late final updatedSchedule = widget.workHours;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigateBackAppBar(context),
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
                                // alignment: Alignment.topCenter,
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
                              StaffProfileWidget(
                                  imagePath: "lib/assets/images/Ellipse 5.png"),
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
                                    children: [
                                      Expanded(
                                        child: TimePicker(
                                          scheduleInfo: scheduleInfo[0],
                                          onDateTimeChanged:
                                              handleOnUpdateOpeningHour,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: TimePicker(
                                          scheduleInfo: scheduleInfo[1],
                                          onDateTimeChanged:
                                              handleOnUpdateClosingHour,
                                        ),
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
            isOnEditMode
                ? Container(
                    margin: const EdgeInsets.only(bottom: 70),
                    child: Row(
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
                              backgroundColor: WidgetStateProperty.all<Color>(
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
                              backgroundColor: WidgetStateProperty.all<Color>(
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
                    ),
                  )
                : Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          margin: const EdgeInsets.only(bottom: bottomMargin),
                          child: const DeleteScheduleBtn(
                            onPressed: showBottomSheetWidget,
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
  final TimeOfDay scheduleInfo;
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
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.time,
        minuteInterval: 10,
        onDateTimeChanged: onDateTimeChanged,
        initialDateTime: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          scheduleInfo.hour,
          scheduleInfo.minute,
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
      "${widget.workHours[0]} - ${widget.workHours[1]}",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
