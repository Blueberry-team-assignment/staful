import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';
import 'package:staful/feature/template/domain/model/template_model.dart';
import 'package:staful/feature/template/presentation/provider/template_provider.dart';
import 'package:staful/feature/template/presentation/ui/template_detail_screen.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/feature/template/presentation/ui/template_register_screen.dart';
import 'package:staful/ui/widgets/column_item_container.dart';
import 'package:staful/ui/widgets/simple_text_button_widget.dart';
import 'package:staful/ui/widgets/simple_text_input_widget.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/constants.dart';
import 'package:staful/utils/navigation_helpers.dart';

class PayrollTemplatesScreen extends ConsumerStatefulWidget {
  const PayrollTemplatesScreen({super.key});

  @override
  ConsumerState<PayrollTemplatesScreen> createState() =>
      _PayrollTemplatesScreenState();
}

class _PayrollTemplatesScreenState
    extends ConsumerState<PayrollTemplatesScreen> {
  final TextEditingController searchInputController = TextEditingController();

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
                  "템플릿 리스트",
                  style: titleStyle,
                ),
                SizedBox(
                  height: 30,
                  child: SimpleTextButtonWidget(
                    onPressed: () {
                      openPage(
                          context,
                          const TemplateDetailScreen(
                            template: defaultTemplate,
                          ));
                    },
                    text: "등록",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Stack(
              children: [
                SimpleTextInputWidget(
                  placeHolder: "템플릿명을 검색하세요",
                  onChanged: templateNotifier.getFilteredList,
                  controller: searchInputController,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "총 ${templateState.filteredList.length}개",
                  style: TextStyleConfig(size: 14).setTextStyle(),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    templateState.filteredList.length, // 템플릿 수에 따라 아이템 수 결정
                itemBuilder: (context, index) {
                  final TemplateModel template =
                      templateState.filteredList[index];
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      onTap: () {},
                      // openPage(context, const TemplateDetailScreen()),
                      child: buildTemplateCards(
                        context: context,
                        template: template,
                        staffList: [],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 템플릿 카드 UI 빌드
ColumnItemContainer buildTemplateCards({
  required BuildContext context,
  required TemplateModel template,
  required List<StaffModel> staffList,
}) {
  return ColumnItemContainer(
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          template.name,
          style: contentTextStyle,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 66,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: staffList.length,
            itemBuilder: (context, index) {
              final StaffModel staff = staffList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: StaffProfileWidget(
                  imagePath: "lib/assets/images/${staff.image}",
                  name: staff.name,
                ),
              );
            },
          ),
        )
      ],
    ),
  );
}
