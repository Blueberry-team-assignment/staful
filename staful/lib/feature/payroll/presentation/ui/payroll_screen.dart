import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/template/presentation/provider/template_provider.dart';
import 'package:staful/feature/payroll/presentation/ui/payroll_detail_screen.dart';
import 'package:staful/feature/template/presentation/ui/templates_screen.dart';
import 'package:staful/ui/widgets/column_item_container.dart';
import 'package:staful/feature/staff/presentation/ui/staff_info_screen.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/navigation_helpers.dart';
import 'package:staful/ui/widgets/simple_text_button_widget.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';

class PayrollScreen extends ConsumerStatefulWidget {
  const PayrollScreen({super.key});

  @override
  ConsumerState<PayrollScreen> createState() => _PayrollScreenState();
}

class _PayrollScreenState extends ConsumerState<PayrollScreen> {
  final contentTitleStyle =
      TextStyleConfig(size: 14, weight: FontWeight.normal).setTextStyle();
  final contentTextStyle = TextStyleConfig(size: 20).setTextStyle();
  String selectedOption = '24년 09월';
  List<DateTime> monthOptions = [];

  @override
  void initState() {
    super.initState();
    generateMonthOptions();
  }

  void generateMonthOptions() {
    DateTime now = DateTime.now();
    for (int i = 0; i < 24; i++) {
      DateTime date = DateTime(now.year, now.month - i, 1);
      String formattedMonth =
          '${date.year % 100}년 ${date.month.toString().padLeft(2, '0')}월';
      monthOptions.add(date);
    }
  }

  void handleOnChanged(String? newValue) {
    setState(() {
      selectedOption = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final templateNotifier = ref.watch(templateNotifierProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (templateNotifier.mounted == true) {
        templateNotifier.fetchAllTemplates();
      }
    });

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 30,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "급여",
                  style: TextStyleConfig(size: 24).setTextStyle(),
                ),
                SizedBox(
                  height: 29,
                  child: SimpleTextButtonWidget(
                    onPressed: () => openPage(
                      context,
                      const PayrollTemplatesScreen(),
                    ),
                    text: "템플릿 관리",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownMenu(
              dropdownMenuEntries: monthOptions.map((DateTime date) {
                return DropdownMenuEntry<String>(
                  value: date.toString(),
                  label:
                      '${date.year % 100}년 ${date.month.toString().padLeft(2, '0')}월',
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    textStyle: WidgetStatePropertyAll(
                      TextStyleConfig(size: 14).setTextStyle(),
                    ),
                  ),
                );
              }).toList(),
              menuStyle: const MenuStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
                alignment: Alignment.bottomLeft,
              ),
              onSelected: handleOnChanged,
              trailingIcon: Transform.translate(
                offset: const Offset(3, -5),
                child: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                ),
              ),
              selectedTrailingIcon: Transform.translate(
                offset: const Offset(3, -5),
                child: const Icon(
                  Icons.keyboard_arrow_up_outlined,
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                border: InputBorder.none,
                hintStyle: TextStyleConfig(size: 14).setTextStyle(),
                fillColor: Colors.white,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: const EdgeInsets.only(left: 10),
                suffixIconColor: Colors.black,
                isDense: true,
                constraints: BoxConstraints.tight(
                  const Size.fromHeight(30),
                ),
              ),
              textStyle: TextStyleConfig(size: 14).setTextStyle(),
              menuHeight: 200,
              width: 140,
              hintText: selectedOption,
            ),
            const SizedBox(
              height: 20,
            ),
            ColumnItemContainer(
              content: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "총 급여",
                        style: contentTitleStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "6,000,000원",
                        style: contentTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "직원별 급여",
              style: contentTitleStyle,
            ),
            const SizedBox(
              height: 15,
            ),
            buildStaffPayrolls(
                "매 니져", "lib/assets/images/Ellipse 2.png", "1,340,000"),
            const SizedBox(
              height: 15,
            ),
            buildStaffPayrolls(
                "김 선미", "lib/assets/images/Ellipse 3.png", "200,000"),
          ],
        ),
      ),
    );
  }

  GestureDetector buildStaffPayrolls(
      String name, String imagePath, String payAmount) {
    return GestureDetector(
      onTap: () => openPage(
        context,
        PayrollDetailScreen(
            name: name, imagePath: imagePath, payrollData: payAmount),
      ),
      child: ColumnItemContainer(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                StaffProfileWidget(
                  imagePath: imagePath,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  style: contentTextStyle,
                ),
              ],
            ),
            Text(
              "$payAmount원",
              style: contentTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
