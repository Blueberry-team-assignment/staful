import 'package:flutter/material.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/domain/models/staff_model.dart';
import 'package:staful/domain/models/template_model.dart';
import 'package:staful/ui/screens/payroll/detail_screens/template_detail_screen.dart';
import 'package:staful/ui/screens/staff/staff_info_screen.dart';
import 'package:staful/domain/utils/app_styles.dart';
import 'package:staful/domain/utils/dummies.dart';
import 'package:staful/ui/widgets/overlay_search_results_widget.dart';
import 'package:staful/ui/widgets/simple_text_button_widget.dart';
import 'package:staful/ui/widgets/simple_text_input_widget.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';

final List<PayDetail> defaultList = [
  PayDetail(description: "식대", amount: 0, type: PayType.fixed),
  PayDetail(description: "시급", amount: 0, type: PayType.hourly),
];

final emptyTemplate = TemplateModel(
  name: "",
  payDetails: defaultList,
  staffList: [],
  templateId: 99,
);

class PayrollTemplatesScreen extends StatefulWidget {
  const PayrollTemplatesScreen({super.key});

  @override
  State<PayrollTemplatesScreen> createState() => _PayrollTemplatesScreenState();
}

class _PayrollTemplatesScreenState extends State<PayrollTemplatesScreen> {
  final TextEditingController searchInputController = TextEditingController();
  List<String> searchSuggestions =
      TEMPLATES.map((template) => template.name).toList();

  late List<TemplateModel> searchedTemplates = TEMPLATES;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _navigateAndUpdateTemplate({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    required void Function(TemplateModel) onResult,
  }) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: builder),
    );

    if (result != null && result is TemplateModel) {
      onResult(result); // 결과값을 처리하는 콜백
      searchInputController.clear();
    }
  }

  // 검색어 입력 시 필터링
  void _onSearchInputChanged(String text) {
    setState(() {
      if (text.isEmpty) {
        searchedTemplates = TEMPLATES;
      }
      // else {
      //   searchedTemplates = TEMPLATES
      //       .where((template) => template.name == searchInputController.text)
      //       .toList();
      // }
    });
  }

  // 검색 제안 선택 시 처리
  void _onSuggestionSelected(String suggestion) {
    searchInputController.text = suggestion;

    setState(() {
      searchedTemplates = TEMPLATES
          .where((template) => template.name.startsWith(suggestion))
          .toList();
    });
  }

  // 템플릿 추가 시 로직
  void _onAddTemplate(TemplateModel newTemplate) {
    setState(() {
      TEMPLATES.add(newTemplate);
      searchSuggestions = TEMPLATES.map((template) => template.name).toList();
    });
  }

  // 템플릿 수정 시 로직
  void _onUpdateTemplate(TemplateModel updatedTemplate, int index) {
    setState(() {
      TEMPLATES[index] = updatedTemplate;
      searchSuggestions = TEMPLATES.map((template) => template.name).toList();
      // _onSearchInputChanged(searchInputController.text);
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
                    onPressed: () => _navigateAndUpdateTemplate(
                      context: context,
                      builder: (context) => TemplateDetailScreen(
                        template: emptyTemplate,
                      ),
                      onResult: (updatedTemplate) =>
                          _onAddTemplate(updatedTemplate),
                    ),
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
                  onChanged: _onSearchInputChanged,
                  controller: searchInputController,
                ),
                OverlaySearchResultsWidget(
                  staffSearch: false,
                  suggestions: searchSuggestions,
                  controller: searchInputController,
                  onSelect: _onSuggestionSelected,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "총 ${searchedTemplates.length}개",
                  style: TextStyleConfig(size: 14).setTextStyle(),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchedTemplates.length, // 템플릿 수에 따라 아이템 수 결정
                itemBuilder: (context, index) {
                  final TemplateModel template = searchedTemplates[index];
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      onTap: () => _navigateAndUpdateTemplate(
                        context: context,
                        builder: (context) => TemplateDetailScreen(
                          template: template,
                        ),
                        onResult: (updatedTemplate) => _onUpdateTemplate(
                            updatedTemplate, TEMPLATES.indexOf(template)),
                      ),
                      child: buildTemplateCards(context, template),
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
        const SizedBox(height: 10),
        SizedBox(
          height: 66,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: staffList.length,
            itemBuilder: (context, index) {
              final Staff staff = staffList[index];
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
