import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/domain/models/staff_model.dart';
import 'package:staful/ui/screens/staff/staff_screen.dart';
import 'package:staful/domain/utils/app_styles.dart';
import 'package:staful/domain/utils/time_utils.dart';
import 'package:staful/ui/widgets/simple_text_button_widget.dart';
import 'package:staful/ui/widgets/simple_text_input_widget.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';
import 'package:image_picker/image_picker.dart';

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
  late TextEditingController lastNameController = TextEditingController();
  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController nameController = TextEditingController();
  final TextEditingController memoFieldController = TextEditingController();
  late TimeRange updatedSchedule;
  final ImagePicker _picker = ImagePicker();
  late XFile imageController;
  late List<String> workDaysController;

  // String get weeklyWorkTime => widget.staffInfo.weeklyWorkingHours["minute"]! >
  //         0
  //     ? "${widget.staffInfo.weeklyWorkingHours["hour"]}시간 ${widget.staffInfo.weeklyWorkingHours["minute"]}분"
  //     : "${widget.staffInfo.weeklyWorkingHours["hour"]}시간";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 수정화면에 보여줄 입력값들 초기화
    updatedSchedule = TimeRange(
        startTime: widget.staffInfo.workHours!.startTime,
        endTime: widget.staffInfo.workHours!.endTime);
    imageController = XFile("lib/assets/images/${widget.staffInfo.image}");
    nameController.text = widget.staffInfo.name;
    memoFieldController.text = widget.staffInfo.desc!;
    workDaysController = widget.staffInfo.workDays!;
  }

  void handleOnUpdateOpeningHour(DateTime time) {
    setState(() {
      updatedSchedule = TimeRange(
        startTime: TimeOfDay(hour: time.hour, minute: time.minute),
        endTime: updatedSchedule.endTime,
      );
    });
  }

  void handleOnUpdateClosingHour(DateTime time) {
    setState(() {
      updatedSchedule = TimeRange(
        startTime: updatedSchedule.startTime,
        endTime: TimeOfDay(hour: time.hour, minute: time.minute),
      );
    });
  }

  void onTabEditBtn() {
    setState(() {
      isOnEditMode = true;
      lastNameController = TextEditingController();
      firstNameController = TextEditingController();
    });
  }

  Future<void> onTapImgChangeBtn() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageController = XFile(pickedFile.path);
      });
    }
  }

  void onTabUndoBtn() {
    setState(() {
      isOnEditMode = false;
    });
  }

  void onTapSaveBtn() {
    setState(() {
      isOnEditMode = false;
    });
  }

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
                                height: 29,
                                child: SimpleTextButtonWidget(
                                  onPressed: onTabEditBtn,
                                  text: "수정",
                                ),
                              ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            StaffProfileWidget(
                                imagePath: imageController.path, size: 64),
                            const SizedBox(
                              height: 5,
                            ),
                            if (isOnEditMode)
                              SizedBox(
                                height: 24,
                                child: SimpleTextButtonWidget(
                                  onPressed: onTapImgChangeBtn,
                                  text: "사진 변경",
                                ),
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                    ColumnItemContainer(
                      content: Row(
                        children: [
                          Expanded(
                            child: Column(
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
                                              controller: lastNameController,
                                              onlyBottomBorder: true,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: SimpleTextInputWidget(
                                              placeHolder: "이름",
                                              onChanged: handleFirstNameChanged,
                                              controller: firstNameController,
                                              onlyBottomBorder: true,
                                            ),
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
                            ),
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
                          WorkDaysRow(
                            workDays: widget.staffInfo.workDays!,
                            disabled: !isOnEditMode,
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
                                  height: 15,
                                ),
                                if (isOnEditMode)
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TimePicker(
                                          scheduleInfo:
                                              updatedSchedule.startTime,
                                          onDateTimeChanged:
                                              handleOnUpdateOpeningHour,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: TimePicker(
                                          scheduleInfo: updatedSchedule.endTime,
                                          onDateTimeChanged:
                                              handleOnUpdateClosingHour,
                                        ),
                                      ),
                                    ],
                                  )
                                else
                                  WorkScheduleForDisplay(
                                    workHours: updatedSchedule,
                                  ),
                                const SizedBox(
                                  height: 15,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyleConfig(size: 13)
                                        .setTextStyle(),
                                    children: [
                                      const TextSpan(text: "해당 직원은"),
                                      TextSpan(
                                          // text: " 주 $weeklyWorkTime ",
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
                        controller: memoFieldController,
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
                      onPressed: onTapSaveBtn,
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
              height: bottomMargin,
            ),
          ],
        ),
      ),
    );
  }
}

class ColumnItemContainer extends StatelessWidget {
  final Widget? content;
  final Color? color;

  const ColumnItemContainer({
    super.key,
    this.content,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
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
  final TimeRange workHours;

  const WorkScheduleForDisplay({
    super.key,
    required this.workHours,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          formatTimeOfDay(workHours.startTime),
          style: TextStyleConfig(size: 20).setTextStyle(),
        ),
        Text(
          "-",
          style: TextStyleConfig(size: 20).setTextStyle(),
        ),
        Text(
          formatTimeOfDay(workHours.endTime),
          style: TextStyleConfig(size: 20).setTextStyle(),
        )
      ],
    );
  }
}
