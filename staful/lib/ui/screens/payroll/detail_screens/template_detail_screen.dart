import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:staful/ui/layouts/backAppBar_Layout.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/domain/models/staff_model.dart';
import 'package:staful/domain/models/template_model.dart';
import 'package:staful/ui/screens/payroll/detail_screens/payroll_search_screen.dart';
import 'package:staful/ui/screens/payroll/detail_screens/staff_search_screen.dart';
import 'package:staful/ui/screens/staff/staff_info_screen.dart';
import 'package:staful/domain/utils/app_styles.dart';
import 'package:staful/domain/utils/currency_formatter.dart';
import 'package:staful/domain/utils/dummies.dart';
import 'package:staful/ui/widgets/save_cancel_footer.dart';
import 'package:staful/ui/widgets/simple_text_button_widget.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';
import 'package:staful/ui/widgets/confirmation_dialog.dart';

class TemplateDetailScreen extends StatefulWidget {
  final TemplateModel template;
  // final VoidCallback onSave;

  const TemplateDetailScreen({
    super.key,
    required this.template,
    // required this.onSave,
  });

  @override
  State<TemplateDetailScreen> createState() => _TemplateDetailScreenState();
}

class _TemplateDetailScreenState extends State<TemplateDetailScreen> {
  final TextEditingController templateNameController = TextEditingController();
  final List<TextEditingController> payDetailControllers = [];
  late List<PayDetail> payDetails = [];
  late List<Staff> staffs = [];

  @override
  void initState() {
    super.initState();
    _initializeTemplateDetails();
    _initializePayDetailControllers();
  }

  void _initializeTemplateDetails() {
    templateNameController.text = widget.template.name;
    payDetails = List.from(widget.template.payDetails);
    staffs = List.from(widget.template.staffList);
  }

  void _initializePayDetailControllers() {
    for (var payDetail in payDetails) {
      final controller = TextEditingController();
      if (payDetail.amount > 0) {
        controller.text = formatNumber(payDetail.amount.toString());
      } else {
        controller.text = "0";
      }
      payDetailControllers.add(controller);
      controller.addListener(() {
        setState(() {}); // 상태 업데이트
      });
    }
  }

  @override
  void dispose() {
    templateNameController.dispose();
    for (var controller in payDetailControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _handleSave(BuildContext context) {
    final payDetails = _collectPayDetailsFromInput();
    final newTemplate = TemplateModel(
      name: templateNameController.text,
      payDetails: payDetails,
      staffList: staffs,
    );

    Navigator.of(context).pop(newTemplate);
  }

  List<PayDetail> _collectPayDetailsFromInput() {
    return List.generate(
      payDetails.length,
      (int i) => PayDetail(
        type: payDetails[i].type,
        description: payDetails[i].description,
        amount: int.parse(payDetailControllers[i].text.replaceAll(",", "")),
      ),
    );
  }

  void _handleCancel(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onPayDetailListChange(List<PayDetail> updatedPayDetails) {
    setState(() {
      payDetails = List.from(updatedPayDetails);
      _resetPayDetailControllers();
    });
  }

  void _resetPayDetailControllers() {
    payDetailControllers.clear();
    _initializePayDetailControllers();
  }

  void _onStaffListChange(List<Staff> updatedStaffs) {
    setState(() {
      // 새로 추가된 스태프 반영
      for (var staff in updatedStaffs) {
        if (!staffs.contains(staff)) {
          staffs.add(staff);
        }
      }
      // 목록에서 제거된 스태프 반영
      staffs.removeWhere((staff) => !updatedStaffs.contains(staff));
    });
  }

  Future<void> navigateAndUpdate({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    required void Function(dynamic) onResult, // 결과 처리 콜백
  }) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: builder),
    );

    if (result != null) {
      onResult(result); // 결과 처리 콜백 호출
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackAppBarLayout(
      scrollableArea: Column(
        children: [
          _buildTemplateNameInput(),
          const SizedBox(height: 15),
          _buildPayDetailSection(),
          _buildStaffListSection(),
        ],
      ),
      nonScrollableArea: SaveCancelFooter(
        onTabUndoBtn: () => _handleCancel(context),
        onTapSaveBtn: () => {
          ConfirmationDialog.show(
            context: context,
            onConfirm: () => _handleSave(context),
            message: "정상적으로 저장되었습니다",
          )
        },
      ),
    );
  }

  Widget _buildTemplateNameInput() {
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
    );
  }

  Widget _buildPayDetailSection() {
    return Column(
      children: [
        _buildSectionHeader(
          title: "세부 항목",
          onPressed: () => navigateAndUpdate(
            context: context,
            builder: (context) => PayrollSearchScreen(
              payDetails: payDetails,
              text: "세부 항목",
            ),
            onResult: (updatedPayDetails) =>
                _onPayDetailListChange(updatedPayDetails),
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: payDetails.length,
          itemBuilder: (context, index) {
            final payDetail = payDetails[index];
            return Column(
              children: [
                _buildPayDetailCard(payDetail, index),
                const SizedBox(height: 15),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildStaffListSection() {
    return Column(
      children: [
        _buildSectionHeader(
          title: "직원 리스트",
          onPressed: () => navigateAndUpdate(
            context: context,
            builder: (context) => StaffSearchScreen(
              staffList: staffs,
              text: "직원 리스트",
            ),
            onResult: (updatedStaffs) => _onStaffListChange(updatedStaffs),
          ),
        ),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: staffs.map((staff) {
            return Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              color: Colors.white,
              child: StaffProfileWidget(
                imagePath: 'lib/assets/images/${staff.image}',
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

  Widget _buildPayDetailCard(PayDetail payDetail, int index) {
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
