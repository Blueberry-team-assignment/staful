import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/feature/staff/container/staff_info_screen_container.dart';
import 'package:staful/feature/staff/provider/staff_provider.dart';
import 'package:staful/feature/staff/container/staff_register_screen_container.dart';
import 'package:staful/ui/widgets/column_item_container.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/navigation_helpers.dart';
import 'package:staful/feature/staff/ui/staff_register_screen.dart';
import 'package:staful/ui/widgets/work_days_row.dart';
import 'package:staful/ui/widgets/overlay_search_results_widget.dart';
import 'package:staful/ui/widgets/simple_text_input_widget.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';
import 'package:staful/ui/widgets/submit_button_widget.dart';

class StaffScreen extends StatelessWidget {
  final List<Staff>? searchedStaff;
  final TextEditingController searchInputController;
  final ValueChanged<String> onSearchInputChanged;

  const StaffScreen({
    super.key,
    this.searchedStaff,
    required this.searchInputController,
    required this.onSearchInputChanged,
  });

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
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => openPage(
                context,
                StaffRegisterScreenContainer(
                  staff: Staff(name: "", staffId: ""),
                )),
            child: const SubmitButtonWidget(
              text: "직원 등록",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "총 ${searchedStaff?.length}명",
                style: TextStyleConfig(size: 14).setTextStyle(),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchedStaff?.length, // 스태프 수에 따라 아이템 수 결정
              itemBuilder: (context, index) {
                final Staff staff = searchedStaff![index];
                return Container(
                    key: ValueKey(staff.staffId),
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
            onTap: () {
              openPage(
                context,
                // 상태를 로컬 범위에서 분리하고 독립적으로 관리하기 위해. 상태 초기화를 보장하기 위해. 프로바이더를 재정의하거나 테스트에서 활용하기 위해.
                ProviderScope(
                  child: StaffInfoScreenContainer(staff: staff),
                ),
              );
            },
            child: Row(
              children: [
                StaffProfileWidget(
                    imagePath: staff.image != null
                        ? "lib/assets/images/${staff.image}"
                        : null),
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
            staff: staff,
            disabled: true,
          )
        ],
      ),
    );
  }
}
