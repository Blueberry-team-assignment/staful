// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:staful/feature/staff/presentation/provider/staff_provider.dart';
// import 'package:staful/feature/staff/presentation/ui/staff_info_screen.dart';
// import 'package:staful/feature/staff/presentation/ui/staff_register_screen.dart';

// class StaffInfoScreenContainer extends ConsumerWidget {
//   const StaffInfoScreenContainer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(staffNotifierProvider);
//     final notifier = ref.read(staffNotifierProvider.notifier);

//     if (state.selectedStaff == null) {
//       return const StaffRegisterScreen();
//     }

//     return const StaffInfoScreen();
//   }
// }
