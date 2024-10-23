import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:staful/layouts/app_layout.dart';
import 'package:staful/models/staff_model.dart';
import 'package:staful/models/template_model.dart';
import 'package:staful/screens/payroll/detail_screens/payroll_search_screen.dart';
import 'package:staful/screens/payroll/detail_screens/staff_search_screen.dart';
import 'package:staful/screens/staff/staff_info_screen.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/currency_formatter.dart';
import 'package:staful/utils/dummies.dart';
import 'package:staful/utils/navigation_helpers.dart';
import 'package:staful/widgets/save_cancel_footer.dart';
import 'package:staful/widgets/simple_text_button_widget.dart';
import 'package:staful/widgets/staff_profile_widget.dart';
import 'package:staful/widgets/confirmation_dialog.dart';

enum SaveType { update, create }

class TemplateDetailScreen extends StatefulWidget {
  final TemplateModel template;
  final VoidCallback onSave;
  // final SaveType saveType;

  const TemplateDetailScreen({
    super.key,
    required this.template,
    required this.onSave,
  });

  @override
  State<TemplateDetailScreen> createState() => _TemplateDetailScreenState();
}

class _TemplateDetailScreenState extends State<TemplateDetailScreen> {
  final TextEditingController templateNameController = TextEditingController();

  // 세부항목
  final List<TextEditingController> payDetailControllers = [];
  late List<PayDetail> payDetails = [];

  // 직원 리스트
  final List<Staff> staffs = [];
  void onStaffListChange(List<Staff> staffsFromChild) {
    setState(() {
      staffs.clear();
      staffs.addAll(staffsFromChild);
    });
  }

  // 공통 메서드
  @override
  void initState() {
    super.initState();
    templateNameController.text = widget.template.name;
    payDetails.addAll(widget.template.payDetails);
    staffs.addAll(widget.template.staffList);

    // PayDetails 수 만큼 TextEditingController 생성
    for (var i = 0; i < payDetails.length; i++) {
      payDetailControllers.add(TextEditingController());
      if (payDetails[i].amount > 0) {
        payDetailControllers[i].text =
            formatNumber(payDetails[i].amount.toString());
      }
    }
    // 컨트롤러의 텍스트 변경될 때마다 상태 업데이트
    for (var controller in payDetailControllers) {
      controller.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    for (var controller in payDetailControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  String formatNumber(String value) {
    if (value.isEmpty) return '';
    final formatter = NumberFormat('#,###');
    return formatter.format(int.parse(value.replaceAll(',', '')));
  }

  void onTapSaveBtn() {
    try {
      final payDetails = [
        PayDetail(
            type: PayType.hourly,
            description: "시급",
            amount:
                int.parse(payDetailControllers[0].text.replaceAll(",", ""))),
        PayDetail(
            type: PayType.fixed,
            description: "식대",
            amount: int.parse(payDetailControllers[1].text.replaceAll(",", "")))
      ];

      final template = TemplateModel(
        name: templateNameController.text,
        payDetails: payDetails,
        staffList: staffs,
      );

      // 등록이 아니고 수정일 경우는 업데이트 해야함. 업데이트 메서드 추가 필요
      templates.add(template);
      widget.onSave();
    } catch (e) {}
  }

  void onTabUndoBtn(BuildContext context) {
    // setState(() {
    //   templateNameController.clear();
    //   for (var controller in payDetailControllers) {
    //     controller.clear();
    //   }
    // });
    Navigator.of(context).pop();
  }

  onPayDetailListChange(List<PayDetail> payDetailsFromChild) {
    setState(() {
      payDetails.clear();
      payDetails.addAll(payDetailsFromChild);

      // PayDetails 수 만큼 TextEditingController 생성
      payDetailControllers.clear();
      for (var i = 0; i < payDetails.length; i++) {
        payDetailControllers.add(TextEditingController());
        if (payDetails[i].amount > 0) {
          payDetailControllers[i].text =
              formatNumber(payDetails[i].amount.toString());
        }
      }

      // 컨트롤러의 텍스트 변경될 때마다 상태 업데이트
      for (var controller in payDetailControllers) {
        controller.addListener(() {
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: navigateBackAppBar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        style: titleStyle,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "템플릿명을 입력하세요",
                          hintStyle: titleStyle.copyWith(
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                        controller: templateNameController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("세부 항목"),
                          SizedBox(
                            height: 30,
                            child: SimpleTextButtonWidget(
                              text: "수정",
                              onPressed: () => openPage(
                                context,
                                PayrollSearchScreen(
                                  text: "세부 항목",
                                  payDetails: payDetails,
                                  onListChange: onPayDetailListChange,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: payDetails.length,
                          itemBuilder: (context, index) {
                            final payDetail = payDetails[index];

                            return Column(
                              children: [
                                buildPayDetailCard(payDetail, index),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            );
                          }),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("직원 리스트"),
                          SizedBox(
                            height: 30,
                            child: SimpleTextButtonWidget(
                              text: "수정",
                              onPressed: () => openPage(
                                context,
                                StaffSearchScreen(
                                  text: "직원 리스트",
                                  onListChange: onStaffListChange,
                                  staffList: staffs,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GridView.count(
                        crossAxisCount: 4,
                        shrinkWrap: true, // 자식 위젯들의 크기에 맞게 자신의 크기를 줄이도록 함.
                        physics:
                            const NeverScrollableScrollPhysics(), // GridView 자체 스크롤 비활성화.

                        children: staffs
                            .map(
                              (staff) => Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                color: Colors.white,
                                child: StaffProfileWidget(
                                  imagePath: 'lib/assets/images/${staff.image}',
                                  name: staff.name,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
              SaveCancelFooter(
                onTabUndoBtn: () => onTabUndoBtn(context),
                onTapSaveBtn: () => {
                  ConfirmationDialog.show(
                      context: context,
                      onConfirm: onTapSaveBtn,
                      message: "정상적으로 저장되었습니다")
                },
              )
            ],
          ),
        ));
  }

  ColumnItemContainer buildPayDetailCard(PayDetail payDetail, int index) {
    return ColumnItemContainer(
      content: Column(
        children: [
          Row(
            children: [Text(payDetail.description)],
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
              suffixIcon: payDetailControllers[index].text.isNotEmpty
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
            controller: payDetailControllers[index],
          ),
        ],
      ),
    );
  }
}
