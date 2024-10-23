import 'package:flutter/material.dart';
import 'package:staful/layouts/app_layout.dart';
import 'package:staful/models/staff_model.dart';
import 'package:staful/models/template_model.dart';
import 'package:staful/screens/payroll/detail_screens/template_detail_screen.dart';
// import 'package:staful/screens/payroll/detail_screens/payroll_template_register_screen';
import 'package:staful/screens/staff/staff_info_screen.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/dummies.dart';
import 'package:staful/utils/navigation_helpers.dart';
import 'package:staful/widgets/overlay_search_results_widget.dart';
import 'package:staful/widgets/simple_text_button_widget.dart';
import 'package:staful/widgets/simple_text_input_widget.dart';
import 'package:staful/widgets/staff_profile_widget.dart';

final List<PayDetail> defaultList = [
  PayDetail(description: "식대", amount: 0, type: PayType.fixed),
  PayDetail(description: "시급", amount: 0, type: PayType.hourly),
];

final emptyTemplate =
    TemplateModel(name: "", payDetails: defaultList, staffList: []);

class PayrollTemplatesScreen extends StatefulWidget {
  const PayrollTemplatesScreen({super.key});

  @override
  State<PayrollTemplatesScreen> createState() => _PayrollTemplatesScreenState();
}

class _PayrollTemplatesScreenState extends State<PayrollTemplatesScreen> {
  final TextEditingController searchInputController = TextEditingController();
  List<String> searchSuggestions =
      templates.map((template) => template.name).toList();

  late List<TemplateModel> searchedTemplates = templates;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var template in templates) {
      template.getStaffList(staffs, template.name);
    }
  }

  void handleOnSave() {
    setState(() {});
  }

  void onSearchInputChanged(String text) {
    // 검색어가 변경될 때마다 호출됨
    // print(text);
    if (text.isEmpty) {
      setState(() {
        searchedTemplates = templates;
      });
    }
  }

  void onSuggestionSelected(String suggestion) {
    searchInputController.text = suggestion;

    setState(() {
      searchedTemplates =
          templates.where((template) => template.name == suggestion).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () => openPage(
                        context,
                        TemplateDetailScreen(
                          template: emptyTemplate,
                          onSave: handleOnSave,
                        )),
                    text: "등록",
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                SimpleTextInputWidget(
                  placeHolder: "템플릿명을 검색하세요",
                  onChanged: onSearchInputChanged,
                  controller: searchInputController,
                ),
                OverlaySearchResultsWidget(
                  staffSearch: false,
                  suggestions: searchSuggestions,
                  controller: searchInputController,
                  onSelect: onSuggestionSelected,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "총 ${searchedTemplates.length}개",
                  style: TextStyleConfig(size: 14).setTextStyle(),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchedTemplates.length, // 스태프 수에 따라 아이템 수 결정
                itemBuilder: (context, index) {
                  final TemplateModel template = searchedTemplates[index];
                  return Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: GestureDetector(
                        onTap: () => openPage(
                            context,
                            TemplateDetailScreen(
                              template: template,
                              onSave: handleOnSave,
                            )),
                        child: buildTemplateCards(context, template),
                      )); // 개별 스태프 카드 생성
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ColumnItemContainer buildTemplateCards(
    BuildContext context, TemplateModel template) {
  final staffList = template.staffList;

  return ColumnItemContainer(
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          template.name,
          style: contentTextStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 66,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: staffList.length,
            itemBuilder: (context, index) {
              final Staff staff = staffList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: StaffProfileWidget(
                  imagePath: "lib/assets/images/${staff.image}",
                  name: staff.name,
                ),
              ); // 개별 스태프 카드 생성
            },
          ),
        )
      ],
    ),
  );
}
