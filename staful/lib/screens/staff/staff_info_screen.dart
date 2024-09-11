import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staful/layouts/calendar_screen_layout.dart';
import 'package:staful/screens/staff/staff_screen.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/widgets/bottom_sheet_widget.dart';
import 'package:staful/widgets/simple_text_input_widget.dart';
import 'package:staful/widgets/staff_profile_widget.dart';

class StaffInfoScreen extends StatefulWidget {
  final dynamic workDate;
  final dynamic workHours;
  final dynamic workDays;

  const StaffInfoScreen({
    super.key,
    required this.workDate,
    required this.workHours,
    required this.workDays,
  });

  @override
  State<StaffInfoScreen> createState() => _StaffInfoScreenState();
}

class _StaffInfoScreenState extends State<StaffInfoScreen> {
  bool isOnEditMode = false;

  List<List<dynamic>> get scheduleInfo => [
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

  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();

  void handleFirstNameChanged(String inputText) {
    print(inputText);
  }

  void handleLastNameChanged(String inputText) {
    print(inputText);
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
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "직원 정보",
                      style: TextStyleConfig(size: 24).setTextStyle(),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: StaffProfileWidget(
                          imageName: "Ellipse 5.png", size: 64),
                    ),
                  ],
                ),
                ColumnItemContainer(
                  content: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "이름",
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
                                      child: SimpleTextInputWidget(
                                          placeHolder: "성",
                                          onChanged: handleLastNameChanged,
                                          controller: lastNameController),
                                    ),
                                    Expanded(
                                      child: SimpleTextInputWidget(
                                          placeHolder: "이름",
                                          onChanged: handleFirstNameChanged,
                                          controller: firstNameController),
                                    )
                                  ],
                                )
                              : const Text(
                                  "매니저",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const ColumnItemContainer(
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "근무 요일",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          ExpandedRowItem(
                            text: "일",
                          ),
                          ExpandedRowItem(
                            text: "월",
                          ),
                          ExpandedRowItem(
                            text: "화",
                          ),
                          ExpandedRowItem(
                            text: "수",
                          ),
                          ExpandedRowItem(
                            text: "목",
                          ),
                          ExpandedRowItem(
                            text: "금",
                          ),
                          ExpandedRowItem(
                            text: "토",
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ColumnItemContainer(
                  content: Row(
                    children: [
                      Column(
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
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "메모",
                        style: TextStyleConfig(
                          size: 14,
                        ).setTextStyle(),
                      ),
                    ),
                  ],
                ),
                const ColumnItemContainer(
                  content: TextField(
                    maxLines: null,
                    minLines: 16,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: "직원에 대해 알아야 할 점을 자유롭게 기록하세요",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Row(
              children: [
                TextButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class ColumnItemContainer extends StatelessWidget {
  final Widget? content;

  const ColumnItemContainer({
    super.key,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: content,
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

  final StaffInfoScreen widget;

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
