import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/schedule/domain/model/time_range_model.dart';
import 'package:staful/feature/schedule/presentation/widgets/time_picker.dart';
import 'package:staful/feature/schedule/presentation/widgets/work_schedule_for_display.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';
import 'package:staful/ui/widgets/column_item_container.dart';
import 'package:staful/ui/widgets/simple_text_button_widget.dart';
import 'package:staful/utils/constants.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/ui/widgets/bottom_sheet_widget.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';

class EditScheduleScreen extends ConsumerStatefulWidget {
  final DateTime date;
  final StaffModel staff;

  const EditScheduleScreen({
    super.key,
    required this.date,
    required this.staff,
  });

  @override
  ConsumerState<EditScheduleScreen> createState() => _EditScheduleScreenState();
}

class _EditScheduleScreenState extends ConsumerState<EditScheduleScreen> {
  bool isOnEditMode = false;
  TimeRangeModel updatedSchedule = defaultTimeRange;

  void handleOnUpdateOpeningHour(DateTime time) {
    updatedSchedule = TimeRangeModel(
      start: TimeOfDay(hour: time.hour, minute: time.minute),
      end: widget.staff.workHours.end,
    );
  }

  void handleOnUpdateClosingHour(DateTime time) {
    updatedSchedule = TimeRangeModel(
      start: widget.staff.workHours.start,
      end: TimeOfDay(hour: time.hour, minute: time.minute),
    );
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
                ColumnItemContainer(
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "근무자",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          StaffProfileWidget(imagePath: widget.staff.image),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.staff.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
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
                        "근무 날짜",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "${widget.date.month}.${widget.date.day} ${weekDays[widget.date.weekday - 1]}",
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
                            isOnEditMode
                                ? Row(
                                    children: [
                                      Expanded(
                                        child: TimePicker(
                                          scheduleInfo:
                                              widget.staff.workHours.start,
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
                                              widget.staff.workHours.end,
                                          onDateTimeChanged:
                                              handleOnUpdateClosingHour,
                                        ),
                                      ),
                                    ],
                                  )
                                : WorkScheduleForDisplay(
                                    workHours: widget.staff.workHours,
                                  )
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
