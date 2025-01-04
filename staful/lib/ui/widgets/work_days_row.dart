import 'package:flutter/material.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/constants.dart';
class WorkDaysRow extends StatelessWidget {
  final StaffModel staff;
  final bool disabled;
  final void Function(StaffModel)? onUpdate;

  const WorkDaysRow({
    super.key,
    required this.staff,
    required this.disabled,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: mapOfWorkDays.values
          .map((value) => WorkDaysRowItem(
                staff: staff,
                onUpdate: onUpdate,
                text: value,
                isSelected: staff.workDays?.contains(value) ?? false,
                disabled: disabled,
              ))
          .toList(),
    );
  }
}

class WorkDaysRowItem extends StatefulWidget {
  final StaffModel staff;
  final String text;
  final bool isSelected;
  final bool disabled;
  final void Function(StaffModel)? onUpdate;

  const WorkDaysRowItem({
    super.key,
    required this.staff,
    this.text = "",
    this.isSelected = false,
    required this.disabled,
    this.onUpdate,
  });

  @override
  State<WorkDaysRowItem> createState() => WorkDaysRowItemState();
}

class WorkDaysRowItemState extends State<WorkDaysRowItem> {
  late bool isSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = widget.isSelected;
  }

  void handleOnPressed() {
    if (widget.disabled) return;
    setState(() {
      isSelected = !isSelected;
    });

    final newWorkDays = List<String>.from(widget.staff.workDays ?? []);
    if (isSelected) {
      newWorkDays.add(widget.text);
    } else {
      newWorkDays.remove(widget.text);
    }

    if (widget.onUpdate != null) {
      widget.onUpdate!(widget.staff.copyWith(workDays: newWorkDays));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: handleOnPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            isSelected ? Theme.of(context).primaryColorLight : Colors.white,
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyleConfig(
            size: 16,
            color: isSelected
                ? Theme.of(context).primaryColorDark
                : Theme.of(context).disabledColor,
          ).setTextStyle(),
        ),
      ),
    );
  }
}
