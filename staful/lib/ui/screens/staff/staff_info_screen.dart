import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/domain/utils/time_utils.dart';
import 'package:staful/feature/staff/staff_info_provider.dart';
import 'package:staful/domain/utils/app_styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/ui/screens/calendar/edit_schedule_screen.dart';
import 'package:staful/ui/screens/staff/staff_screen.dart';
import 'package:staful/ui/widgets/simple_text_button_widget.dart';
import 'package:staful/ui/widgets/simple_text_input_widget.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';

class StaffInfoScreen extends ConsumerStatefulWidget {
  final Staff staffInfo; // 직원 정보는 필수 전달

  const StaffInfoScreen({
    super.key,
    required this.staffInfo,
  });

  @override
  ConsumerState<StaffInfoScreen> createState() => _StaffInfoScreenState();
}

class _StaffInfoScreenState extends ConsumerState<StaffInfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController memoFieldController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  bool isEditMode = false;
  late TimeRange updatedSchedule = TimeRange(
      startTime: const TimeOfDay(hour: 0, minute: 0),
      endTime: const TimeOfDay(hour: 24, minute: 0));

  @override
  void initState() {
    super.initState();

    // StaffInfo 초기화
    // final notifier = ref.read(staffInfoNotifierProvider.notifier);
    // notifier.loadStaffInfo(widget.staffInfo);

    // 컨트롤러 초기화
    nameController.text = widget.staffInfo.name;
    memoFieldController.text = widget.staffInfo.desc ?? "";
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
    final notifier = ref.read(staffInfoNotifierProvider.notifier);
    notifier.saveStaffInfo();

    // 저장 완료 후 보기 모드로 전환
    toggleEditMode();
  }

  // 되돌리기
  void onUndo() {}

  // 이미지 변경 버튼 클릭
  Future<void> onTapImgChangeBtn() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final notifier = ref.read(staffInfoNotifierProvider.notifier);
      final currentStaff =
          ref.read(staffInfoNotifierProvider).editableStaffInfo;
      final updatedStaff = currentStaff?.copyWith(image: pickedFile.path);
      notifier.updateStaffInfoState(updatedStaff);
    }
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

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(staffInfoNotifierProvider.notifier);
    final state = ref.watch(staffInfoNotifierProvider);

    final editableStaff = state.editableStaffInfo;

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
                                imagePath: editableStaff?.image, size: 64),
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
                                                notifier.updateStaffInfoState(
                                                  editableStaff?.copyWith(
                                                      name: value),
                                                );
                                              },
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
                            disabled: !isEditMode,
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
                                  // WorkScheduleForDisplay(
                                  //   widget: EditScheduleScreen(workDate: workDate, workHours: workHours),

                                  // ),
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
