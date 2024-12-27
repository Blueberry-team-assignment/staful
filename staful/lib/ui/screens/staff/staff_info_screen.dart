import 'package:flutter/material.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/domain/utils/time_utils.dart';
import 'package:staful/domain/utils/app_styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/ui/screens/calendar/edit_schedule_screen.dart';
import 'package:staful/ui/widgets/column_item_container.dart';
import 'package:staful/ui/widgets/work_days_row.dart';
import 'package:staful/ui/widgets/simple_text_button_widget.dart';
import 'package:staful/ui/widgets/simple_text_input_widget.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';

class StaffInfoScreen extends StatefulWidget {
  final Staff originalStaff;
  final Staff editableStaff;
  final void Function(Staff) onUpdate;
  final VoidCallback onSave;
  final VoidCallback onReset;

  const StaffInfoScreen({
    super.key,
    required this.originalStaff,
    required this.editableStaff,
    required this.onReset,
    required this.onSave,
    required this.onUpdate,
  });

  @override
  State<StaffInfoScreen> createState() => _StaffInfoScreenState();
}

class _StaffInfoScreenState extends State<StaffInfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController memoFieldController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  bool isEditMode = false;
  TimeRange updatedSchedule = TimeRange(
      startTime: const TimeOfDay(hour: 0, minute: 0),
      endTime: const TimeOfDay(hour: 24, minute: 0));

  @override
  void initState() {
    super.initState();

    // 컨트롤러 초기화
    nameController.text = widget.originalStaff.name;
    memoFieldController.text = widget.originalStaff.desc ?? "";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    memoFieldController.dispose();
    super.dispose();
  }

  // 수정 모드 토글
  void toggleEditMode() {
    setState(() {
      isEditMode = !isEditMode;
    });
  }

  // 저장 버튼 클릭
  void onSave() {
    widget.onSave();
    // 저장 완료 후 보기 모드로 전환
    toggleEditMode();
  }

  // 변경사항 되돌리고 수정모드 종료하기
  void onUndo() {
    widget.onReset();
    toggleEditMode();
  }

  // 이미지 변경 버튼 클릭
  Future<void> onTapImgChangeBtn() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // widget.onUpdate(widget.editableStaff.copyWith(image: pickedFile))
    }
  }

  void handleOnUpdateOpeningHour(DateTime time) {
    updatedSchedule = TimeRange(
      startTime: TimeOfDay(hour: time.hour, minute: time.minute),
      endTime:
          widget.editableStaff.workHours?.endTime ?? updatedSchedule.endTime,
    );
    widget.onUpdate(widget.editableStaff.copyWith(workHours: updatedSchedule));
  }

  void handleOnUpdateClosingHour(DateTime time) {
    updatedSchedule = TimeRange(
      startTime: widget.editableStaff.workHours?.startTime ??
          updatedSchedule.startTime,
      endTime: TimeOfDay(hour: time.hour, minute: time.minute),
    );
    widget.onUpdate(widget.editableStaff.copyWith(workHours: updatedSchedule));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: navigateBackAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
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
                        isEditMode
                            ? const SizedBox.shrink()
                            : SizedBox(
                                height: 29,
                                child: SimpleTextButtonWidget(
                                  onPressed: toggleEditMode,
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
                                imagePath: widget.editableStaff.image,
                                size: 64),
                            const SizedBox(
                              height: 5,
                            ),
                            if (isEditMode)
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
                                isEditMode
                                    ? Row(
                                        children: [
                                          Expanded(
                                            child: SimpleTextInputWidget(
                                              placeHolder: "이름",
                                              controller: nameController,
                                              onlyBottomBorder: true,
                                              onChanged: (value) {
                                                widget.onUpdate(widget
                                                    .editableStaff
                                                    .copyWith(name: value));
                                              },
                                            ),
                                          )
                                        ],
                                      )
                                    : Text(
                                        widget.originalStaff.name,
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
                            staff: widget.editableStaff,
                            disabled: !isEditMode,
                            onUpdate: widget.onUpdate,
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
                                if (isEditMode)
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TimePicker(
                                          scheduleInfo: widget.editableStaff
                                                  .workHours?.startTime ??
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
                                          scheduleInfo: widget.editableStaff
                                                  .workHours?.endTime ??
                                              updatedSchedule.endTime,
                                          onDateTimeChanged:
                                              handleOnUpdateClosingHour,
                                        ),
                                      ),
                                    ],
                                  )
                                else
                                  WorkScheduleForDisplay(
                                    workHours: widget.originalStaff.workHours ??
                                        updatedSchedule,
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
                        readOnly: !isEditMode,
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
            if (isEditMode)
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
                      onPressed: onUndo,
                      child: const Text(
                        "수정 취소",
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
                      onPressed: onSave,
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
