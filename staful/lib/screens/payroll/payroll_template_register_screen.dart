import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:staful/layouts/app_layout.dart';
import 'package:staful/models/template_model.dart';
import 'package:staful/screens/staff/staff_info_screen.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/widgets/simple_text_button_widget.dart';

class PayrollTemplateRegisterScreen extends StatefulWidget {
  const PayrollTemplateRegisterScreen({super.key});

  @override
  State<PayrollTemplateRegisterScreen> createState() =>
      _PayrollTemplateRegisterScreenState();
}

class _PayrollTemplateRegisterScreenState
    extends State<PayrollTemplateRegisterScreen> {
  final TextEditingController templateNameController = TextEditingController();
  final List<TextEditingController> controllers = [];
  final List<PayDetail> payDetails = [
    PayDetail(type: PayType.hourly, description: "시급", amount: -1),
    PayDetail(type: PayType.fixed, description: "식대", amount: -1)
  ];

  @override
  void initState() {
    super.initState();
    // PayDetails 수 만큼 TextEditingController 생성
    for (var i = 0; i < payDetails.length; i++) {
      controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    // TextEditingController 해제
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  String formatNumber(String value) {
    if (value.isEmpty) return '';
    final formatter = NumberFormat('#,###');
    return formatter.format(int.parse(value.replaceAll(',', '')));
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
              hintText: payDetail.amount >= 0
                  ? payDetail.amount.toString()
                  : "숫자를 입력하세요",
              hintStyle: contentTextStyle.copyWith(
                color: Theme.of(context).disabledColor,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(top: 8.5),
                child: Text(" 원", style: contentTextStyle),
              ),
              suffixStyle: contentTextStyle,
            ),
            onChanged: (value) {
              // 입력값을 천 단위 콤마로 포맷
              String formattedValue = formatNumber(value);
              print(value);
              print(formattedValue);
              controllers[index].value = TextEditingValue(
                text: formattedValue,
                selection:
                    TextSelection.collapsed(offset: formattedValue.length),
              );
            },
          ),
          const SizedBox(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: navigateBackAppBar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("세부 항목"),
                  SizedBox(
                    height: 30,
                    child: SimpleTextButtonWidget(
                      text: "수정",
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
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("직원 리스트"),
                  SizedBox(
                    height: 30,
                    child: SimpleTextButtonWidget(
                      text: "수정",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
