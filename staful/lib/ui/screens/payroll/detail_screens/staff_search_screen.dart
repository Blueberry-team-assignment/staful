// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:staful/feature/staff/domain/model/staff_model.dart';
// import 'package:staful/ui/layouts/app_layout.dart';
// import 'package:staful/ui/widgets/column_item_container.dart';
// import 'package:staful/utils/app_styles.dart';
// import 'package:staful/ui/widgets/confirmation_dialog.dart';
// import 'package:staful/ui/widgets/save_cancel_footer.dart';
// import 'package:staful/ui/widgets/simple_text_input_widget.dart';
// import 'package:staful/ui/widgets/staff_profile_widget.dart';

// class StaffSearchScreen extends ConsumerStatefulWidget {
//   final String text;
//   // final void Function(List<Staff>) onListChange;
//   final List<StaffModel> staffList;

//   const StaffSearchScreen({
//     super.key,
//     required this.text,
//     // required this.onListChange,
//     required this.staffList,
//   });

//   @override
//   ConsumerState<StaffSearchScreen> createState() => _StaffSearchScreenState();
// }

// class _StaffSearchScreenState extends ConsumerState<StaffSearchScreen> {
//   final TextEditingController searchInputController = TextEditingController();
//   late List<StaffModel> Staffs = [];

//   @override
//   void initState() {
//     super.initState();
//     _initializeStaffs();
//   }

//   void _initializeStaffs() {
//     final selectedStaffNames =
//         widget.staffList.map((staff) => staff.name).toSet();

//     // Staffs = STAFFS
//     //     .map((staff) => Staff(
//     //           name: staff.name,
//     //           image: staff.image,
//     //           workDays: staff.workDays,
//     //           workHours: staff.workHours,
//     //           isSelected: selectedStaffNames.contains(staff.name),
//     //           templateId: staff.templateId,
//     //         ))
//     //     .toList();
//   }

//   void _onSearchInputChanged(String text) {
//     setState(() {
//       if (text.isEmpty) {
//         _showAllStaffs();
//       } else {
//         _filterStaffsByName(text);
//       }
//     });
//   }

//   void _showAllStaffs() {
//     for (var staff in Staffs) {
//       staff.toggleVisibility(true);
//     }
//   }

//   void _filterStaffsByName(String name) {
//     for (var staff in Staffs) {
//       staff.toggleVisibility(staff.name.contains(name));
//     }
//   }

//   void _onSuggestionSelected(String suggestion) {
//     searchInputController.text = suggestion;
//     setState(() {
//       _filterStaffsByName(suggestion);
//     });
//   }

//   void _handleStaffTap(int index) {
//     setState(() {
//       Staffs[index].toggleSelected();
//     });
//   }

//   void _onTapSaveBtn(BuildContext context) {
//     final List<StaffModel> selectedStaffs =
//         Staffs.where((staff) => staff!.isSelected).toList();

//     // widget.onListChange(selectedStaffs);
//     Navigator.of(context).pop(selectedStaffs);
//   }

//   void _onTabUndoBtn(BuildContext context) {
//     Navigator.of(context).pop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Color lightColor = Theme.of(context).primaryColorLight;

//     return Scaffold(
//       appBar: navigateBackAppBar(context),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildHeader(),
//             const SizedBox(height: 20),
//             _buildSearchInput(),
//             const SizedBox(height: 10),
//             Expanded(child: _buildStaffList(lightColor)),
//             SaveCancelFooter(
//               onTabUndoBtn: () => _onTabUndoBtn(context),
//               onTapSaveBtn: () => ConfirmationDialog.show(
//                 context: context,
//                 onConfirm: () => _onTapSaveBtn(context),
//                 message: "정상적으로 추가되었습니다",
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           "${widget.text} 수정",
//           style: titleStyle,
//         ),
//       ],
//     );
//   }

//   Widget _buildSearchInput() {
//     return Stack(
//       children: [
//         SimpleTextInputWidget(
//           placeHolder: "직원명을 검색하세요",
//           onChanged: _onSearchInputChanged,
//           controller: searchInputController,
//         ),
//         // OverlaySearchResultsWidget(
//         //   suggestions: STAFFS.map((staff) => staff.name).toList(),
//         //   controller: searchInputController,
//         //   onSelect: _onSuggestionSelected,
//         // ),
//       ],
//     );
//   }

//   Widget _buildStaffList(Color lightColor) {
//     return ListView.builder(
//       itemCount: Staffs.length,
//       itemBuilder: (context, index) {
//         final staff = Staffs[index];
//         if (!staff.isVisible) return const SizedBox.shrink();

//         return GestureDetector(
//           onTap: () => _handleStaffTap(index),
//           child: ColumnItemContainer(
//             color: staff.isSelected ? lightColor : Colors.white,
//             content: _buildStaffRow(staff),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildStaffRow(StaffModel staff) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             StaffProfileWidget(imagePath: "lib/assets/images/${staff.image}"),
//             const SizedBox(width: 10),
//             Text(
//               staff.name,
//               style: contentTextStyle.copyWith(fontSize: 16),
//             ),
//           ],
//         ),
//         Icon(
//           staff.isSelected
//               ? Icons.check_box_outlined
//               : Icons.check_box_outline_blank_outlined,
//           color:
//               staff.isSelected ? Theme.of(context).primaryColor : Colors.black,
//         )
//       ],
//     );
//   }
// }
