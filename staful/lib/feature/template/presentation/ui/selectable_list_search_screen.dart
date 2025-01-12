import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/pay_detail/domain/model/pay_detail_model.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';
import 'package:staful/feature/template/presentation/provider/template_provider.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/ui/widgets/column_item_container.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/ui/widgets/save_cancel_footer.dart';
import 'package:staful/ui/widgets/simple_text_input_widget.dart';
import 'package:staful/utils/constants.dart';

class SelectableListSearchScreen extends ConsumerStatefulWidget {
  final String title;

  const SelectableListSearchScreen({
    super.key,
    required this.title,
  });

  @override
  ConsumerState<SelectableListSearchScreen> createState() =>
      _SelectableListSearchScreenState();
}

class _SelectableListSearchScreenState extends ConsumerState<SelectableListSearchScreen> {
  final TextEditingController searchInputController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    searchInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final templateState = ref.watch(templateNotifierProvider);
    final templateNotifier = ref.read(templateNotifierProvider.notifier);
    final String screenType = widget.title == "직원"
        ? "staff"
        : "payDetail"; // 직원 목록 검색 페이지 또는 세부 항목 검색 페이지

    return Scaffold(
      appBar: navigateBackAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.title} 리스트",
                  style: titleStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                SimpleTextInputWidget(
                  placeHolder: "${widget.title}을 검색하세요",
                  onChanged: screenType == "staff"
                      ? templateNotifier.getFilteredStaffList
                      : templateNotifier.getFilteredPayDetailList,
                  controller: searchInputController,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: screenType == "staff"
                    ? templateState.staffList.length
                    : templateState.selectedTemplate.payDetails.length,
                itemBuilder: (BuildContext context, int index) {
                  dynamic item;

                  item = screenType == "staff"
                      ? templateState.staffList[index]
                      : templateState.selectedTemplate.payDetails[index];
                  if (!item.isVisible) return const SizedBox.shrink();
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        screenType == "staff"
                            ? templateNotifier.updateSelectedStaff(item.id)
                            : templateNotifier.togglePayDetail(item.desc);
                      },
                      child: ColumnItemContainer(
                        color: item.isSelected
                            ? Theme.of(context).primaryColorLight
                            : Colors.white,
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    if (screenType == "staff")
                                      StaffProfileWidget(
                                        imagePath: item.image != null
                                            ? "lib/assets/images/${item.image}"
                                            : null,
                                      ),
                                    if (screenType == "staff")
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    Text(
                                      screenType == "staff"
                                          ? item.name
                                          : item.desc,
                                      style: contentTextStyle.copyWith(
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                Icon(
                                  item.isSelected
                                      ? Icons.check_box_outlined
                                      : Icons.check_box_outline_blank_outlined,
                                  color: item.isSelected
                                      ? Theme.of(context).primaryColor
                                      : Colors.black,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // SaveCancelFooter(
            //   onTabUndoBtn: onUndo,
            //   onTapSaveBtn: onSave,
            // ),
            const SizedBox(
              height: bottomMargin,
            )
          ],
        ),
      ),
    );
  }
}
