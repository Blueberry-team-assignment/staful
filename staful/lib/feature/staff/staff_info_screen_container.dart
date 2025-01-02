import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/feature/auth/log_in/log_in_provider.dart';
import 'package:staful/feature/auth/sign_up/sign_up_screen.dart';
import 'package:staful/feature/staff/staff_info_provider.dart';
import 'package:staful/ui/screens/staff/staff_info_screen.dart';

class StaffInfoScreenContainer extends ConsumerWidget {
  final Staff staff;

  const StaffInfoScreenContainer({
    super.key,
    required this.staff,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                .saveChanges(ref.read(logInProvider).user!.uid);
          },
          onReset: () {
            ref
                .read(staffInfoNotifierProvider(staff).notifier)
                .resetToOriginal();
          },
        ),
        if (state.isLoading) const LoadingIndicator()
      ],
    );
  }
}
