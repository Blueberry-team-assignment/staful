import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/feature/auth/presentation/provider/log_in_provider.dart';
import 'package:staful/feature/auth/presentation/ui/sign_up_screen.dart';
import 'package:staful/feature/staff/presentation/provider/staff_info_provider.dart';
import 'package:staful/feature/staff/presentation/ui/staff_register_screen.dart';

class StaffRegisterScreenContainer extends ConsumerWidget {
  final Staff staff;

  const StaffRegisterScreenContainer({
    super.key,
    required this.staff,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(staffInfoNotifierProvider(staff));

    return Stack(
      children: [
        StaffRegisterScreen(
          staff: state.createdStaffInfo!,
          onUpdate: (createdStaff) {
            ref
                .read(staffInfoNotifierProvider(staff).notifier)
                .updateCreatedStaff(createdStaff);
          },
          onSave: () {
            ref.read(staffInfoNotifierProvider(staff).notifier).createStaff(
                uid: ref.read(logInProvider).authUser!.uid,
                staff: state.createdStaffInfo!);
          },
        ),
        if (state.isLoading) const LoadingIndicator()
      ],
    );
  }
}
