// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:staful/data/models/staff_model.dart';
// import 'package:staful/feature/auth/presentation/ui/sign_up_screen.dart';
// import 'package:staful/feature/staff/presentation/provider/old_staff_provider.dart';
// import 'package:staful/feature/staff/presentation/ui/staff_screen.dart';
// import 'package:staful/ui/widgets/overlay_search_results_widget.dart';

// final searchedStaffProvider = StateProvider.autoDispose<List<Staff>?>(
//     (ref) => ref.watch(staffNotifierProvider).staffList);

// class StaffScreenContainer extends ConsumerStatefulWidget {
//   const StaffScreenContainer({super.key});

//   @override
//   ConsumerState<StaffScreenContainer> createState() =>
//       _StaffScreenContainerState();
// }

// class _StaffScreenContainerState extends ConsumerState<StaffScreenContainer> {
//   final searchInputController = TextEditingController();

//   @override
//   void dispose() {
//     searchInputController.dispose();
//     super.dispose();
//   }

//   void onSearchInputChanged(String text) {
//     final staffList = ref.watch(staffNotifierProvider).staffList ?? [];

//     if (text.isEmpty) {
//       ref.read(searchedStaffProvider.notifier).state = staffList;
//     } else {
//       ref.read(searchedStaffProvider.notifier).state = staffList.where((staff) {
//         final chosungName = decomposeHangul(staff.name);
//         final chosungInput = decomposeHangul(text);
//         return chosungName.startsWith(chosungInput);
//       }).toList();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final searchedStaff = ref.watch(searchedStaffProvider);

//     return Stack(children: [
//       StaffScreen(
//         searchedStaff: searchedStaff,
//         searchInputController: searchInputController,
//         onSearchInputChanged: onSearchInputChanged,
//       ),
//       if (ref.watch(staffNotifierProvider).isLoading) const LoadingIndicator()
//     ]);
//   }
// }
