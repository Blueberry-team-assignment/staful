import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/staff_info/domain/model/staff_model.dart';
import 'package:staful/feature/staff_info/presentation/provider/staff_provider.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/constants.dart';

class WorkDaysRow extends StatelessWidget {
  final bool disabled;
  final StaffModel staff;

  const WorkDaysRow({
    super.key,
    required this.staff,
    required this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: mapOfWorkDays.values
          .map((value) => WorkDaysRowItem(
                day: value,
                disabled: disabled,
                staff: staff,
              ))
          .toList(),
    );
  }
}

class WorkDaysRowItem extends ConsumerWidget {
  final String day;
  final bool disabled;
  final StaffModel staff;

  const WorkDaysRowItem({
    super.key,
    required this.day,
    required this.disabled,
    required this.staff,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staffNotifier = ref.read(staffNotifierProvider.notifier);
    final isSelected = staff.workDays.contains(day);

    void handleOnPressed() {
      if (disabled) return;

      final updatedWorkDays = List<String>.from(staff.workDays);
      if (isSelected) {
        updatedWorkDays.remove(day);
      } else {
        updatedWorkDays.add(day);
      }

      staffNotifier.updateSelectedStaff(
        field: 'workDays',
        value: updatedWorkDays,
      );
    }

    return Expanded(
      child: TextButton(
        onPressed: handleOnPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            isSelected ? Theme.of(context).primaryColorLight : Colors.white,
          ),
        ),
        child: Text(
          day,
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
