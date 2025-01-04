// import 'package:flutter/material.dart';
// import 'package:staful/feature/pay_detail/domain/model/pay_detail_model.dart';
// import 'package:staful/ui/layouts/app_layout.dart';
// import 'package:staful/ui/widgets/column_item_container.dart';
// import 'package:staful/utils/app_styles.dart';
// import 'package:staful/ui/widgets/confirmation_dialog.dart';
// import 'package:staful/ui/widgets/overlay_search_results_widget.dart';
// import 'package:staful/ui/widgets/save_cancel_footer.dart';
// import 'package:staful/ui/widgets/simple_text_input_widget.dart';

// final _items = [
//   {"description": "식대", "type": PayType.fixed},
//   {"description": "시급", "type": PayType.hourly},
//   {"description": "추가 수당", "type": PayType.fixed},
//   {"description": "기타 수당", "type": PayType.fixed}
// ];

// class PayrollSearchScreen extends StatefulWidget {
//   final String text;
//   // final void Function(List<PayDetail>) onListChange;
//   final List<PayDetailModel> payDetails;

//   const PayrollSearchScreen({
//     super.key,
//     required this.text,
//     // required this.onListChange,
//     required this.payDetails,
//   });

//   @override
//   State<PayrollSearchScreen> createState() => _PayrollSearchScreenState();
// }

// class _PayrollSearchScreenState extends State<PayrollSearchScreen> {
//   final TextEditingController searchInputController = TextEditingController();
//   final List<String> searchSuggestions =
//       _items.map((item) => item["description"] as String).toList();
//   late List<PayDetailModel> selectablePayDetails = [];

//   void onSearchInputChanged(String text) {
//     if (text.isEmpty) {
//       setState(() {
//         for (var payDetail in selectablePayDetails) {
//           payDetail.isVisible = true;
//         }
//       });
//     }
//   }

//   void onSuggestionSelected(String suggestion) {
//     searchInputController.text = suggestion;
//     setState(() {
//       for (var payDetail in selectablePayDetails) {
//         if (suggestion == payDetail.payDetail.description) {
//           payDetail.isVisible = true;
//         } else {
//           payDetail.isVisible = false;
//         }
//       }
//     });
//   }

//   void handleOnTap(int idx) {
//     setState(() {
//       selectablePayDetails[idx].toggleSelected();
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     final List<PayDetailModel> list = [];
//     for (var item in _items) {
//       int amount = 0;
//       bool isSelected = false;
//       for (var detail in widget.payDetails) {
//         if (detail.description == item["description"] &&
//             detail.type == item["type"]) {
//           amount = detail.amount;
//           isSelected = true;
//         }
//       }

//       final newItem = PayDetailModel(
//         payDetail: PayDetail(
//           type: item["type"] as PayType,
//           description: item["description"] as String,
//           amount: amount,
//         ),
//         isSelected: isSelected,
//       );

//       list.add(newItem);
//     }
//     selectablePayDetails.clear();
//     selectablePayDetails.addAll(list);
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     for (var detail in selectablePayDetails) {
//       detail.isVisible = true;
//     }
//     super.dispose();
//   }

//   void onTapSaveBtn(BuildContext context) {
//     final List<PayDetailModel> updatedPayDetails = selectablePayDetails
//         .where((detail) => detail.isSelected == true)
//         .map((detail) => detail.payDetail)
//         .toList();

//     // widget.onListChange(updatedPayDetails);
//     Navigator.of(context).pop(updatedPayDetails);
//   }

//   void onTabUndoBtn(BuildContext context) {
//     // setState(() {
//     //   for (int i = 2; i < selectablePayDetails.length; i++) {
//     //     selectablePayDetails[i].isSelected = false;
//     //   }
//     // });
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
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "${widget.text} 수정",
//                   style: titleStyle,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Stack(
//               children: [
//                 SimpleTextInputWidget(
//                   placeHolder: "세부 항목을 검색하세요",
//                   onChanged: onSearchInputChanged,
//                   controller: searchInputController,
//                 ),
//                 OverlaySearchResultsWidget(
//                   staffSearch: false,
//                   suggestions: searchSuggestions,
//                   controller: searchInputController,
//                   onSelect: onSuggestionSelected,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Expanded(
//               child: ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 itemCount: selectablePayDetails.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final PayDetailModel payDetail =
//                       selectablePayDetails[index];
//                   if (!payDetail.isVisible) return const SizedBox.shrink();
//                   return Container(
//                     margin: const EdgeInsets.only(
//                       top: 10,
//                     ),
//                     height: 70,
//                     child: GestureDetector(
//                       onTap: () => handleOnTap(index),
//                       child: ColumnItemContainer(
//                         color: selectablePayDetails[index].isSelected
//                             ? lightColor
//                             : Colors.white,
//                         content: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               payDetail.payDetail.description,
//                               style: contentTextStyle.copyWith(fontSize: 16),
//                             ),
//                             Icon(
//                               selectablePayDetails[index].isSelected
//                                   ? Icons.check_box_outlined
//                                   : Icons.check_box_outline_blank_outlined,
//                               color: selectablePayDetails[index].isSelected
//                                   ? Theme.of(context).primaryColor
//                                   : Colors.black,
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SaveCancelFooter(
//               onTabUndoBtn: () => onTabUndoBtn(context),
//               onTapSaveBtn: () => ConfirmationDialog.show(
//                   context: context,
//                   onConfirm: () => onTapSaveBtn(context),
//                   showCancelButton: false,
//                   message: "정상적으로 추가되었습니다"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
