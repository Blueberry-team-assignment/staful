import 'package:flutter/material.dart';
import 'package:staful/layouts/app_layout.dart';
import 'package:staful/models/staff_model.dart';
import 'package:staful/screens/staff/staff_info_screen.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/dummies.dart';
import 'package:staful/widgets/overlay_search_results_widget.dart';
import 'package:staful/widgets/simple_text_button_widget.dart';
import 'package:staful/widgets/simple_text_input_widget.dart';
import 'package:staful/widgets/staff_profile_widget.dart';

class PayrollTemplatesScreen extends StatefulWidget {
  const PayrollTemplatesScreen({super.key});

  @override
  State<PayrollTemplatesScreen> createState() => _PayrollTemplatesScreenState();
}

class _PayrollTemplatesScreenState extends State<PayrollTemplatesScreen> {
  final TextEditingController searchInputController = TextEditingController();
  List<String> searchSuggestions = (staffs.map((staff) => staff.name)).toList();

  late List<Staff> searchedStaff = staffs;

  void onSearchInputChanged(String text) {
    // 검색어가 변경될 때마다 호출됨
    // print(text);
    if (text.isEmpty) {
      setState(() {
        searchedStaff = staffs;
      });
    }
  }

  void onSuggestionSelected(String suggestion) {
    searchInputController.text = suggestion;

    setState(() {
      searchedStaff =
          staffs.where((staff) => staff.name == suggestion).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    void onPressed() {}

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
                      onPressed: () => {},
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
                    placeHolder: "이름으로 검색하세요",
                    onChanged: onSearchInputChanged,
                    controller: searchInputController,
                  ),
                  OverlaySearchResultsWidget(
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
                    "총 ${searchedStaff.length}개",
                    style: TextStyleConfig(size: 14).setTextStyle(),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: searchedStaff.length, // 스태프 수에 따라 아이템 수 결정
                  itemBuilder: (context, index) {
                    final Staff staff = searchedStaff[index];
                    return Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: buildStaffCards(context, staff)); // 개별 스태프 카드 생성
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

ColumnItemContainer buildStaffCards(BuildContext context, Staff staff) {
  return ColumnItemContainer(
    content: Column(
      children: [
        GestureDetector(
          onTap: () => {},
          child: Row(
            children: [
              StaffProfileWidget(imagePath: "lib/assets/images/${staff.image}"),
              const SizedBox(
                width: 10,
              ),
              Text(
                staff.name,
                style: TextStyleConfig(size: 16).setTextStyle(),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
