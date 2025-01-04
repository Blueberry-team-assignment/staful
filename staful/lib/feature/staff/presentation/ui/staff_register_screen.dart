import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';
import 'package:staful/feature/staff/presentation/provider/staff_provider.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/constants.dart';
import 'package:staful/utils/time_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/feature/schedule/presentation/edit_schedule_screen.dart';
import 'package:staful/ui/widgets/column_item_container.dart';
import 'package:staful/ui/widgets/work_days_row.dart';
import 'package:staful/ui/widgets/simple_text_button_widget.dart';
import 'package:staful/ui/widgets/simple_text_input_widget.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';

class StaffRegisterScreen extends ConsumerStatefulWidget {
  // final Staff staff;
  // final VoidCallback onSave;
  // final void Function(Staff) onUpdate;

  const StaffRegisterScreen({
    super.key,
    // required this.staff,
    // required this.onSave,
    // required this.onUpdate,
  });

  @override
  ConsumerState<StaffRegisterScreen> createState() =>
      _StaffRegisterScreenState();
}

class _StaffRegisterScreenState extends ConsumerState<StaffRegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController memoFieldController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String? imagePath; // 선택된 이미지 경로
  late TimeRange updatedSchedule = defaultTimeRange;

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    memoFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(staffNotifierProvider);
    final notifier = ref.read(staffNotifierProvider.notifier);
    final weeklyWorkingHours =
        state.selectedStaff.calculateWeeklyWorkingHours();

    void handleOnUpdateOpeningHour(DateTime time) {
      updatedSchedule = TimeRange(
        startTime: TimeOfDay(hour: time.hour, minute: time.minute),
        endTime: state.selectedStaff.workHours.endTime,
      );

      notifier.updateSelectedStaff(field: "workHours", value: updatedSchedule);
    }

    void handleOnUpdateClosingHour(DateTime time) {
      updatedSchedule = TimeRange(
        startTime: state.selectedStaff.workHours.startTime,
        endTime: TimeOfDay(hour: time.hour, minute: time.minute),
      );

      notifier.updateSelectedStaff(field: "workHours", value: updatedSchedule);
    }

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
                                onPressed: () async {
                                  final XFile? pickedFile = await _picker
                                      .pickImage(source: ImageSource.gallery);

                                  if (pickedFile != null) {
                                    // 수정 필요
                                    notifier.updateSelectedStaff(
                                        field: "image",
                                        value: pickedFile.toString());
                                  }
                                },
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
                                          notifier.updateSelectedStaff(
                                              field: "name", value: value)
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
                            staff: state.selectedStaff,
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
                                        scheduleInfo: state
                                            .selectedStaff.workHours.startTime,
                                        onDateTimeChanged:
                                            handleOnUpdateOpeningHour,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TimePicker(
                                        scheduleInfo: state
                                            .selectedStaff.workHours.endTime,
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
                                          text:
                                              " 주 ${weeklyWorkingHours["hour"]}",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                      const TextSpan(text: "시간 "),
                                      if (weeklyWorkingHours["minute"] != 0)
                                        TextSpan(
                                            text:
                                                "${weeklyWorkingHours["minute"]}",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                      if (weeklyWorkingHours["minute"] != 0)
                                        const TextSpan(text: "분 "),
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
                        onChanged: (value) => {
                          notifier.updateSelectedStaff(
                              field: "desc", value: value)
                        },
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
                    onPressed: () {
                      notifier.createStaff(state.selectedStaff);
                      Navigator.of(context).pop();
                    },
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
