import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staful/layouts/app_layout.dart';
import 'package:staful/models/staff_model.dart';
import 'package:staful/screens/staff/staff_screen.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/time_utils.dart';
import 'package:staful/widgets/simple_text_input_widget.dart';
import 'package:staful/widgets/staff_profile_widget.dart';

class StaffInfoScreen extends StatefulWidget {
  final Staff staffInfo;

  const StaffInfoScreen({
    super.key,
    required this.staffInfo,
  });

  @override
  State<StaffInfoScreen> createState() => _StaffInfoScreenState();
}

class _StaffInfoScreenState extends State<StaffInfoScreen> {
  bool isOnEditMode = false;

  String get weeklyWorkTime => widget.staffInfo.weeklyWorkingHours["minute"]! >
          0
      ? "${widget.staffInfo.weeklyWorkingHours["hour"]}시간 ${widget.staffInfo.weeklyWorkingHours["minute"]}분"
      : "${widget.staffInfo.weeklyWorkingHours["hour"]}시간";

  late List<TimeOfDay> updatedSchedule;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updatedSchedule = [
      widget.staffInfo.workHours.startTime,
      widget.staffInfo.workHours.endTime
    ];
  }

  void handleOnUpdateOpeningHour(DateTime time) {
    setState(() {
      updatedSchedule[0] = TimeOfDay(hour: time.hour, minute: time.minute);
    });
  }

  void handleOnUpdateClosingHour(DateTime time) {
    setState(() {
      updatedSchedule[1] = TimeOfDay(hour: time.hour, minute: time.minute);
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
      appBar: navigateBackAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                      Theme.of(context).primaryColorLight,
                                    ),
                                    padding: WidgetStateProperty.all<
                                        EdgeInsetsGeometry>(
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
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: StaffProfileWidget(
                              imageName: widget.staffInfo.image, size: 64),
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
                                  : Text(
                                      widget.staffInfo.name,
                                      style: const TextStyle(
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
                    ColumnItemContainer(
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "근무 요일",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          WorkDaysRow(workDays: widget.staffInfo.workDays)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ColumnItemContainer(
                      content: Row(
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
                                if (isOnEditMode)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TimePicker(
                                        scheduleInfo: widget
                                            .staffInfo.workHours.startTime,
                                        onDateTimeChanged:
                                            handleOnUpdateOpeningHour,
                                      ),
                                      TimePicker(
                                        scheduleInfo:
                                            widget.staffInfo.workHours.endTime,
                                        onDateTimeChanged:
                                            handleOnUpdateClosingHour,
                                      ),
                                    ],
                                  )
                                else
                                  WorkScheduleForDisplay(widget: widget),
                                const SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyleConfig(size: 13)
                                        .setTextStyle(),
                                    children: [
                                      const TextSpan(text: "해당 직원은"),
                                      TextSpan(
                                          text: " 주 $weeklyWorkTime ",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                      const TextSpan(text: "근무입니다"),
                                    ],
                                  ),
                                )
                              ],
                            ),
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
                    ColumnItemContainer(
                      content: TextField(
                        readOnly: !isOnEditMode,
                        maxLines: null,
                        minLines: 4,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          hintText: "직원에 대해 알아야 할 점을 자유롭게 기록하세요",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isOnEditMode)
              Row(
                children: [
                  Expanded(
                    child: TextButton(
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
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextButton(
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
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
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
      width: 170,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.time,
        minuteInterval: 5,
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

  final StaffInfoScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            formatTimeOfDay(widget.staffInfo.workHours.startTime),
            style: TextStyleConfig(size: 20).setTextStyle(),
          ),
          Text(
            "-",
            style: TextStyleConfig(size: 20).setTextStyle(),
          ),
          Text(
            formatTimeOfDay(widget.staffInfo.workHours.endTime),
            style: TextStyleConfig(size: 20).setTextStyle(),
          )
        ],
      ),
    );
  }
}
