import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/pay_detail/domain/model/pay_detail_model.dart';
import 'package:staful/feature/template/presentation/provider/template_provider.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/ui/widgets/column_item_container.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/ui/widgets/save_cancel_footer.dart';
import 'package:staful/ui/widgets/simple_text_input_widget.dart';
import 'package:staful/utils/constants.dart';

class PayrollSearchScreen extends ConsumerStatefulWidget {
  final String title;

  const PayrollSearchScreen({
    super.key,
    required this.title,
  });

  @override
  ConsumerState<PayrollSearchScreen> createState() =>
      _PayrollSearchScreenState();
}

class _PayrollSearchScreenState extends ConsumerState<PayrollSearchScreen> {
  final TextEditingController searchInputController = TextEditingController();
  List<PayDetailModel> payDetailList = defaultPayDetailList;

  @override
  void dispose() {
    // TODO: implement dispose
    searchInputController.dispose();
    super.dispose();
  }

  void onSave(BuildContext context) {}

  void onUndo(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final templateState = ref.watch(templateNotifierProvider);
    final templateNotifier = ref.read(templateNotifierProvider.notifier);

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
                  widget.title,
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
                  placeHolder: "세부 항목을 검색하세요",
                  onChanged: templateNotifier.getFilteredPayDetailList,
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
                itemCount: templateState.selectedTemplate!.payDetails.length,
                itemBuilder: (BuildContext context, int index) {
                  final PayDetailModel payDetail =
                      templateState.selectedTemplate!.payDetails[index];
                  if (!payDetail.isVisible) return const SizedBox.shrink();
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    height: 70,
                    child: GestureDetector(
                      onTap: () =>
                          templateNotifier.togglePayDetail(payDetail.desc),
                      child: ColumnItemContainer(
                        color: payDetail.isSelected
                            ? Theme.of(context).primaryColorLight
                            : Colors.white,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              payDetail.desc,
                              style: contentTextStyle.copyWith(fontSize: 16),
                            ),
                            Icon(
                              payDetail.isSelected
                                  ? Icons.check_box_outlined
                                  : Icons.check_box_outline_blank_outlined,
                              color: payDetail.isSelected
                                  ? Theme.of(context).primaryColor
                                  : Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SaveCancelFooter(
              onTabUndoBtn: () => {},
              onTapSaveBtn: () => {},
              //  ConfirmationDialog.show(
              //     context: context,
              //     onConfirm: () => onTapSaveBtn(context),
              //     showCancelButton: false,
              //     message: "정상적으로 추가되었습니다"),
            )
          ],
        ),
      ),
    );
  }
}
