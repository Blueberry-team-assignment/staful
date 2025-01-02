import 'package:flutter/material.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/time_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/ui/screens/calendar/edit_schedule_screen.dart';
import 'package:staful/ui/widgets/column_item_container.dart';
import 'package:staful/ui/widgets/work_days_row.dart';
import 'package:staful/ui/widgets/simple_text_button_widget.dart';
import 'package:staful/ui/widgets/simple_text_input_widget.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';

class StaffRegisterScreen extends StatefulWidget {
  final Staff staff;
  final VoidCallback onSave;
  final void Function(Staff) onUpdate;

  const StaffRegisterScreen({
    super.key,
    required this.staff,
    required this.onSave,
    required this.onUpdate,
  });

  @override
  State<StaffRegisterScreen> createState() => _StaffRegisterScreenState();
}

class _StaffRegisterScreenState extends State<StaffRegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController memoFieldController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String? imagePath; // 선택된 이미지 경로
  late TimeRange updatedSchedule = TimeRange(
      startTime: const TimeOfDay(hour: 0, minute: 0),
      endTime: const TimeOfDay(hour: 24, minute: 0));

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    memoFieldController.dispose();
    super.dispose();
  }

  // 저장 버튼 클릭
  void onSave(context) {
    try {
      if (nameController.text.isEmpty) {
        return;
      }

      widget.onSave();

      if (mounted) {
        Navigator.of(context).pop(); // 등록 후 이전 화면으로 돌아가기
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // 되돌리기
  void onUndo() {}

  // 이미지 변경 버튼 클릭
  Future<void> onTapImgChangeBtn() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // widget.onUpdate(widget.staff.copyWith(image: pickedFile));
    }
  }

  void handleOnUpdateOpeningHour(DateTime time) {
    updatedSchedule = TimeRange(
      startTime: TimeOfDay(hour: time.hour, minute: time.minute),
      endTime: widget.staff.workHours?.endTime ?? updatedSchedule.endTime,
    );
    widget.onUpdate(widget.staff.copyWith(workHours: updatedSchedule));
  }

  void handleOnUpdateClosingHour(DateTime time) {
    updatedSchedule = TimeRange(
      startTime: widget.staff.workHours?.startTime ?? updatedSchedule.startTime,
      endTime: TimeOfDay(hour: time.hour, minute: time.minute),
    );
    widget.onUpdate(widget.staff.copyWith(workHours: updatedSchedule));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: navigateBackAppBar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          30,
          10,
          30,
          50,
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
                          "직원 등록",
                          style: TextStyleConfig(size: 24).setTextStyle(),
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
                            StaffProfileWidget(imagePath: imagePath, size: 64),
                            const SizedBox(
                              height: 5,
                            ),
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
                                Text(
                                  "이름",
                                  style: contentTitleStyle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SimpleTextInputWidget(
                                        placeHolder: "이름을 입력해주세요",
                                        onChanged: (value) => {
                                          widget.onUpdate(widget.staff
                                              .copyWith(name: value))
                                        },
                                        controller: nameController,
                                        onlyBottomBorder: true,
                                      ),
                                    )
                                  ],
                                )
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
                          Text(
                            "근무 요일",
                            style: contentTitleStyle,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          WorkDaysRow(
                            staff: widget.staff,
                            // onUpdate: ,
                            disabled: false,
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
                                Text(
                                  "근무 시간",
                                  style: contentTitleStyle,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TimePicker(
                                        scheduleInfo:
                                            widget.staff.workHours?.startTime ??
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
                                        scheduleInfo:
                                            widget.staff.workHours?.endTime ??
                                                updatedSchedule.endTime,
                                        onDateTimeChanged:
                                            handleOnUpdateClosingHour,
                                      ),
                                    ),
                                  ],
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
            Row(
              children: [
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
                    onPressed: () => onSave(context),
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
          ],
        ),
      ),
    );
  }
}
