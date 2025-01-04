import 'package:flutter/material.dart';
import 'package:staful/ui/layouts/backAppBar_Layout.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/feature/template/presentation/payroll_templates_screen.dart';
import 'package:staful/ui/widgets/column_item_container.dart';
import 'package:staful/feature/staff/ui/staff_info_screen.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/navigation_helpers.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';

class PayrollDetailScreen extends StatefulWidget {
  // final Staff staffInfo;
  final String name;
  final String imagePath;
  final dynamic payrollData;

  const PayrollDetailScreen(
      {super.key,
      required this.name,
      required this.imagePath,
      required this.payrollData
      // required this.staffInfo,
      });

  @override
  State<PayrollDetailScreen> createState() => _PayrollDetailScreenState();
}

class _PayrollDetailScreenState extends State<PayrollDetailScreen> {
  void _onPressed() {}

  @override
  Widget build(BuildContext context) {
    return BackAppBarLayout(
        scrollableArea: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "급여 내역서",
                  style: titleStyle,
                ),
                Text(
                  "다운로드 시 엑셀파일로 저장됩니다",
                  style: contentTitleStyle,
                )
              ],
            ),
            IconButton(
              onPressed: _onPressed,
              icon: const Icon(
                Icons.file_download_outlined,
                size: 32,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        ColumnItemContainer(
          content: Row(
            children: [
              StaffProfileWidget(
                imagePath: widget.imagePath,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.name,
                style: titleStyle.copyWith(fontSize: 20),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "급여 내역",
          style: contentTitleStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          // onTap: () => openPage(
          //   context,
          //   const PayrollTemplatesScreen(),
          // ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(borderRadius),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 9,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyleConfig(size: 13).setTextStyle(),
                      children: [
                        TextSpan(
                          text: "평일 마감 템플릿 ",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: "적용중",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_right_outlined)
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ColumnItemContainer(
          color: Theme.of(context).primaryColorLight,
          content: Column(
            children: [
              Row(
                children: [
                  Text(
                    "총 급여",
                    style: contentTitleStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
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
          height: 15,
        ),
        ColumnItemContainer(
          content: Column(
            children: [
              Row(
                children: [
                  Text(
                    "기본급",
                    style: contentTitleStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "1,340,000원",
                    style: contentTextStyle,
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ColumnItemContainer(
          content: Column(
            children: [
              Row(
                children: [
                  Text(
                    "식대",
                    style: contentTitleStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "50,000원",
                    style: contentTextStyle,
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ColumnItemContainer(
          content: Column(
            children: [
              Row(
                children: [
                  Text(
                    "시간 외 근로수당",
                    style: contentTitleStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "123,000원",
                    style: contentTextStyle,
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ColumnItemContainer(
          content: Column(
            children: [
              Row(
                children: [
                  Text(
                    "그 외 수당",
                    style: contentTitleStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "100,000원",
                    style: contentTextStyle,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
