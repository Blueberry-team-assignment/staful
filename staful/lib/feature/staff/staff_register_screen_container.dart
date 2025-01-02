import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/feature/auth/log_in/log_in_provider.dart';
import 'package:staful/feature/auth/sign_up/sign_up_screen.dart';
import 'package:staful/feature/staff/staff_info_provider.dart';
import 'package:staful/ui/screens/staff/staff_register_screen.dart';

class StaffRegisterScreenContainer extends ConsumerWidget {
  const StaffRegisterScreenContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Staff nullStaff = Staff(name: "", staffId: "");
    final state = ref.watch(staffInfoNotifierProvider(nullStaff));

    return Stack(
      children: [
        StaffRegisterScreen(
          staff: state.editableStaffInfo!,
          onUpdate: (updatedStaff) {
            ref
                .read(staffInfoNotifierProvider(nullStaff).notifier)
                .updateEditableStaff(updatedStaff);
          },
          onSave: () {
            ref.read(staffInfoNotifierProvider(nullStaff).notifier).createStaff(
                uid: ref.read(logInProvider).user!.uid,
                staff: state.editableStaffInfo!);
          },
        ),
        if (state.isLoading) const LoadingIndicator()
      ],
    );
  }
}
