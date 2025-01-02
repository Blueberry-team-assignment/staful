import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/feature/auth/log_in/log_in_provider.dart';
import 'package:staful/feature/auth/sign_up/sign_up_screen.dart';
import 'package:staful/feature/staff/provider/staff_info_provider.dart';
import 'package:staful/feature/staff/ui/staff_info_screen.dart';

class StaffInfoScreenContainer extends ConsumerWidget {
  final Staff staff;

  const StaffInfoScreenContainer({
    super.key,
    required this.staff,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.read(logInProvider).user!.uid;
    final state = ref.watch(staffInfoNotifierProvider(staff));

    return Stack(
      children: [
        StaffInfoScreen(
          originalStaff: state.originalStaffInfo!,
          editableStaff: state.editableStaffInfo!,
          onUpdate: (updatedStaff) {
            ref
                .read(staffInfoNotifierProvider(staff).notifier)
                .updateEditableStaff(updatedStaff);
          },
          onSave: () {
            ref
                .read(staffInfoNotifierProvider(staff).notifier)
                .saveChanges(uid);
          },
          onReset: () {
            ref
                .read(staffInfoNotifierProvider(staff).notifier)
                .resetToOriginal();
          },
          onDelete: () {
            ref
                .read(staffInfoNotifierProvider(staff).notifier)
                .deleteStaff(uid, state.originalStaffInfo!.staffId);
          },
        ),
        if (state.isLoading) const LoadingIndicator()
      ],
    );
  }
}
