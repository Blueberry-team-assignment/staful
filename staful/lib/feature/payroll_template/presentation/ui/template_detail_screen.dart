import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/payroll_template/domain/model/pay_detail_model.dart';
import 'package:staful/feature/staff_info/domain/model/staff_model.dart';
import 'package:staful/feature/staff_info/presentation/provider/staff_provider.dart';
import 'package:staful/feature/payroll_template/domain/model/template_model.dart';
import 'package:staful/feature/payroll_template/presentation/provider/state/template_state.dart';
import 'package:staful/feature/payroll_template/presentation/provider/template_provider.dart';
import 'package:staful/ui/layouts/backAppBar_Layout.dart';
import 'package:staful/feature/payroll_template/presentation/ui/selectable_list_search_screen.dart';
import 'package:staful/ui/widgets/column_item_container.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/currency_formatter.dart';
import 'package:staful/ui/widgets/save_cancel_footer.dart';
import 'package:staful/ui/widgets/simple_text_button_widget.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';
import 'package:staful/utils/navigation_helpers.dart';

class TemplateDetailScreen extends ConsumerStatefulWidget {
  final TemplateModel template;

  const TemplateDetailScreen({
    super.key,
    required this.template,
  });

  @override
  ConsumerState<TemplateDetailScreen> createState() =>
      _TemplateDetailScreenState();
}

class _TemplateDetailScreenState extends ConsumerState<TemplateDetailScreen> {
  final TextEditingController templateNameController = TextEditingController();
  final payDetailAmountControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  bool isOnCreateScreen = true;

  @override
  void initState() {
    super.initState();
    // template 등록일 경우 id = null, 조회일 경우 id가 존재.
    if (widget.template.id != null) {
      templateNameController.text = widget.template.name;
      isOnCreateScreen = false;
    }
  }

  @override
  void dispose() {
    for (var i = 0; i < 4; i++) {
      payDetailAmountControllers[i].dispose();
    }
    templateNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final templateState = ref.watch(templateNotifierProvider);
    final templateNotifier = ref.read(templateNotifierProvider.notifier);

    void onReset() {
      // templateNotifier.setSelectedTemplate(widget.template);
    }

    void onSave() {
      isOnCreateScreen
          ? templateNotifier.createTemplate(templateState.selectedTemplate)
          : templateNotifier.updateTemplate(templateState.selectedTemplate);
      Navigator.of(context).pop();
    }

    return BackAppBarLayout(
      scrollableArea: Column(
        children: [
          _buildTemplateNameInput(templateNotifier, templateState),
          const SizedBox(height: 25),
          _buildPayDetailSection(templateNotifier, templateState),
          const SizedBox(height: 25),
          _buildStaffListSection(templateState.staffList,
              templateState.selectedTemplate.staffIds, templateNotifier),
        ],
      ),
      nonScrollableArea: SaveCancelFooter(
        onTabUndoBtn: onReset,
        onTapSaveBtn: onSave,
      ),
    );
  }

  Widget _buildTemplateNameInput(
      TemplateNotifier templateNotifier, TemplateState templateState) {
    return TextFormField(
        style: titleStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "템플릿명을 입력하세요",
          hintStyle: titleStyle.copyWith(
            color: Theme.of(context).disabledColor,
          ),
        ),
        // controller: templateNameController,
        initialValue: widget.template.name,
        onChanged: (value) {
          templateNotifier.updateName(name: value);
        });
  }

  Widget _buildPayDetailSection(
      TemplateNotifier templateNotifier, TemplateState templateState) {
    return Column(
      children: [
        _buildSectionHeader(
          title: "세부 항목",
          onPressed: () {
            templateNotifier.setListAllVisible();
            openPage(
                context,
                const SelectableListSearchScreen(
                  title: "세부 항목",
                ));
          },
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: templateState.selectedTemplate.payDetails.length,
          itemBuilder: (context, index) {
            final payDetail = templateState.selectedTemplate.payDetails[index];
            if (!payDetail.isSelected) return const SizedBox.shrink();
            return Column(
              children: [
                _buildPayDetailCard(payDetail, templateNotifier,
                    payDetailAmountControllers[index]),
                const SizedBox(height: 15),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildStaffListSection(List<StaffModel> staffList,
      List<String> staffIds, TemplateNotifier templateNotifier) {
    return Column(
      children: [
        _buildSectionHeader(
          title: "직원 리스트",
          onPressed: () {
            templateNotifier.setListAllVisible();
            templateNotifier.setStaffSelected(staffIds);
            openPage(
                context,
                const SelectableListSearchScreen(
                  title: "직원",
                ));
          },
        ),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: staffList
              .where((staff) => staffIds.contains(staff.id))
              .map((staff) {
            return Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              color: Colors.white,
              child: StaffProfileWidget(
                imagePath: staff.image != null
                    ? 'lib/assets/images/${staff.image}'
                    : null,
                name: staff.name,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(
      {required String title, required VoidCallback onPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        SizedBox(
          height: 30,
          child: SimpleTextButtonWidget(
            text: "수정",
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }

  Widget _buildPayDetailCard(PayDetailModel payDetail,
      TemplateNotifier templateNotifier, TextEditingController controller) {
    return ColumnItemContainer(
      content: Column(
        children: [
          Row(
            children: [Text(payDetail.desc)],
          ),
          TextFormField(
            initialValue: payDetail.amount > 0
                ? formatNumber(payDetail.amount.toString())
                : null,
            style: contentTextStyle,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(),
              border: const UnderlineInputBorder(),
              hintText: "숫자를 입력하세요",
              hintStyle: contentTextStyle.copyWith(
                color: Theme.of(context).disabledColor,
              ),
              suffixIcon: controller.text.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.5),
                      child: Text(" 원", style: contentTextStyle))
                  : null,
              suffixStyle: contentTextStyle,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CurrencyFormatter(),
            ],
            // controller: controller,
            onChanged: (value) {
              final parsedValue = int.tryParse(value.replaceAll(',', '')) ?? 0;
              templateNotifier.updateAmount(payDetail.desc, parsedValue);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '이 필드는 필수입니다'; // 에러 메시지 반환
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
