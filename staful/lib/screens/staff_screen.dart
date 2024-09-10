import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/dummies.dart';
import 'package:staful/widgets/%08overlay_search_results_widget.dart';
import 'package:staful/widgets/simple_text_input_widget.dart';
import 'package:staful/widgets/staff_profile_widget.dart';
import 'package:staful/widgets/submit_button_widget.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({super.key});

  @override
  _StaffScreenState createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  final TextEditingController searchInputController = TextEditingController();
  List<String> searchSuggestions =
      (staffs.map((staff) => staff["name"] as String)).toList();

  void onSearchInputChanged(String text) {
    // 검색어가 변경될 때마다 호출됨
    // print(text);
  }

  void onSuggestionSelected(String suggestion) {
    searchInputController.text = suggestion;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 100,
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "직원",
            style: TextStyleConfig(size: 24).setTextStyle(),
          ),
          const SizedBox(
            height: 30,
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
            height: 10,
          ),
          const SubmitButtonWidget(
            text: "직원 등록",
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [Text("총 n명")],
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Row(
                children: [
                  const StaffProfileWidget(imageName: "Ellipse 5.png"),
                  Text(
                    "매니저",
                    style: TextStyleConfig(size: 16).setTextStyle(),
                  )
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () => {},
                      child: const Text("일"),
                    ),
                    TextButton(
                      onPressed: () => {},
                      child: const Text("월"),
                    ),
                    TextButton(
                      onPressed: () => {},
                      child: const Text("화"),
                    ),
                    TextButton(
                      onPressed: () => {},
                      child: const Text("수"),
                    ),
                    TextButton(
                      onPressed: () => {},
                      child: const Text("목"),
                    ),
                    TextButton(
                      onPressed: () => {},
                      child: const Text("금"),
                    ),
                    TextButton(
                      onPressed: () => {},
                      child: const Text("토"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
