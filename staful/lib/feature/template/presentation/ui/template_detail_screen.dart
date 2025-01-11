import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/pay_detail/domain/model/pay_detail_model.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';
import 'package:staful/feature/staff/presentation/provider/staff_provider.dart';
import 'package:staful/feature/template/domain/model/template_model.dart';
import 'package:staful/feature/template/presentation/provider/state/template_state.dart';
import 'package:staful/feature/template/presentation/provider/template_provider.dart';
import 'package:staful/ui/layouts/backAppBar_Layout.dart';
import 'package:staful/ui/screens/payroll/detail_screens/payroll_search_screen.dart';
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
  bool isEditMode = false;

  @override
  void initState() {
    super.initState();
    // template 등록일 경우 id = null, 조회일 경우 id가 존재.
    if (widget.template.id != null) {
      templateNameController.text = widget.template.name;
      isEditMode = true;
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

  void toggleEditMode() {
    isEditMode = !isEditMode;
  }

  @override
  Widget build(BuildContext context) {
    final templateState = ref.watch(templateNotifierProvider);
    final templateNotifier = ref.read(templateNotifierProvider.notifier);

    void onReset() {
      templateNotifier.setSelectedTemplate(widget.template);
    }

    void onSave() {
      templateNotifier.updateTemplate(templateState.selectedTemplate);
      Navigator.of(context).pop();
    }

    return BackAppBarLayout(
      scrollableArea: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTemplateNameInput(templateNotifier, templateState),
          const SizedBox(height: 15),
          _buildPayDetailSection(templateNotifier, templateState),
          _buildStaffListSection(templateState.staffList),
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
    // if (!isEditMode) {
    //   return Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     textBaseline: TextBaseline.alphabetic,
    //     children: [
    //       Text(templateState.selectedTemplate.name),
    //       if (widget.template.id != null)
    //         SizedBox(
    //           height: 29,
    //           child: SimpleTextButtonWidget(
    //             onPressed: toggleEditMode,
    //             text: "수정",
    //           ),
    //         ),
    //     ],
    //   );
    // }
    return TextFormField(
        style: titleStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "템플릿명을 입력하세요",
          hintStyle: titleStyle.copyWith(
            color: Theme.of(context).disabledColor,
          ),
        ),
        controller: templateNameController,
        onChanged: (value) {
          templateNotifier.updateSelectedTemplate(field: "name", value: value);
        });
  }

  Widget _buildPayDetailSection(
      TemplateNotifier templateNotifier, TemplateState templateState) {
    return Column(
      children: [
        _buildSectionHeader(
          title: "세부 항목",
          onPressed: () {
            openPage(
                context,
                const PayrollSearchScreen(
                  title: "세부 항목 리스트",
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

  Widget _buildStaffListSection(List<StaffModel> staffList) {
    return Column(
      children: [
        _buildSectionHeader(
          title: "직원 리스트",
          onPressed: () {
            // openPage(context,
            // StaffSearchScreen(
            //   staffList: staffs,
            //   text: "직원 리스트",
            // ))
          },
        ),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: staffList.map((staff) {
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
            controller: controller,
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
