import 'package:flutter/material.dart';
import 'package:staful/models/staff_model.dart';
import 'package:staful/screens/staff/staff_info_screen.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/dummies.dart';
import 'package:staful/utils/navigation_helpers.dart';
import 'package:staful/widgets/overlay_search_results_widget.dart';
import 'package:staful/widgets/simple_text_input_widget.dart';
import 'package:staful/widgets/staff_profile_widget.dart';
import 'package:staful/widgets/submit_button_widget.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({super.key});

  @override
  StaffScreenState createState() => StaffScreenState();
}

class StaffScreenState extends State<StaffScreen> {
  final TextEditingController searchInputController = TextEditingController();
  List<String> searchSuggestions = (STAFFS.map((staff) => staff.name)).toList();

  late List<Staff> searchedStaff = STAFFS;

  void onSearchInputChanged(String text) {
    // 검색어가 변경될 때마다 호출됨
    // print(text);
    if (text.isEmpty) {
      setState(() {
        searchedStaff = STAFFS;
      });
    }
  }

  void onSuggestionSelected(String suggestion) {
    searchInputController.text = suggestion;

    setState(() {
      searchedStaff =
          STAFFS.where((staff) => staff.name == suggestion).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
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
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "총 ${searchedStaff.length}명",
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
    );
  }

  ColumnItemContainer buildStaffCards(BuildContext context, Staff staff) {
    return ColumnItemContainer(
      content: Column(
        children: [
          GestureDetector(
            onTap: () => {
              openPage(
                context,
                StaffInfoScreen(
                  staffInfo: staff,
                ),
              )
            },
            child: Row(
              children: [
                StaffProfileWidget(
                    imagePath: "lib/assets/images/${staff.image}"),
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
          WorkDaysRow(
            workDays: staff.workDays,
          )
        ],
      ),
    );
  }
}

class WorkDaysRow extends StatelessWidget {
  final List<String> workDays;
  final bool disabled;

  const WorkDaysRow({
    super.key,
    required this.workDays,
    this.disabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: mapOfWorkDays.keys
          .map((key) => WorkDaysRowItem(
                text: mapOfWorkDays[key] ?? "",
                isSelected: workDays.contains(key),
                disabled: disabled,
              ))
          .toList(),
    );
  }
}

class WorkDaysRowItem extends StatefulWidget {
  final String text;
  final bool isSelected;
  final bool disabled;

  const WorkDaysRowItem({
    super.key,
    this.text = "",
    this.isSelected = false,
    required this.disabled,
  });

  @override
  State<WorkDaysRowItem> createState() => WorkDaysRowItemState();
}

class WorkDaysRowItemState extends State<WorkDaysRowItem> {
  late bool isSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = widget.isSelected;
  }

  void handleOnPressed() {
    if (widget.disabled) return;
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: handleOnPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            isSelected ? Theme.of(context).primaryColorLight : Colors.white,
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyleConfig(
            size: 16,
            color: isSelected
                ? Theme.of(context).primaryColorDark
                : Theme.of(context).disabledColor,
          ).setTextStyle(),
        ),
      ),
    );
  }
}
