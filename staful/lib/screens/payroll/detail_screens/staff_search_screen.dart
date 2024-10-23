import 'package:flutter/material.dart';
import 'package:staful/layouts/app_layout.dart';
import 'package:staful/models/staff_model.dart';
import 'package:staful/screens/staff/staff_info_screen.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/dummies.dart';
import 'package:staful/widgets/overlay_search_results_widget.dart';
import 'package:staful/widgets/save_cancel_footer.dart';
import 'package:staful/widgets/simple_text_input_widget.dart';
import 'package:staful/widgets/staff_profile_widget.dart';

class _SelectableStaff {
  final Staff staff;
  bool isSelected = false;
  bool isShow = true;

  _SelectableStaff({
    required this.staff,
  });

  void setSelected() {
    isSelected = !isSelected;
  }

  void setIsShow() {
    isShow = !isShow;
  }
}

final List<_SelectableStaff> selectableStaffs = List.generate(
    staffs.length, (index) => _SelectableStaff(staff: staffs[index]));

class StaffSearchScreen extends StatefulWidget {
  final String text;
  final void Function(List<Staff>) onListChange;

  const StaffSearchScreen({
    super.key,
    required this.text,
    required this.onListChange,
  });

  @override
  State<StaffSearchScreen> createState() => _StaffSearchScreenState();
}

class _StaffSearchScreenState extends State<StaffSearchScreen> {
  final TextEditingController searchInputController = TextEditingController();
  final List<String> searchSuggestions =
      staffs.map((staff) => staff.name).toList();
  late List<_SelectableStaff> searchedStaffs = selectableStaffs;

  void onSearchInputChanged(String text) {
    if (text.isEmpty) {
      setState(() {
        for (var staff in searchedStaffs) {
          staff.isShow = true;
        }
      });
    }
  }

  void onSuggestionSelected(String suggestion) {
    searchInputController.text = suggestion;
    setState(() {
      for (var staff in searchedStaffs) {
        if (suggestion == staff.staff.name) {
          staff.isShow = true;
        } else {
          staff.isShow = false;
        }
      }
    });
  }

  void handleOnTap(int idx) {
    setState(() {
      searchedStaffs[idx].setSelected();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    for (var staff in searchedStaffs) {
      staff.isShow = true;
    }
    super.dispose();
  }

  void onTapSaveBtn() {
    final List<Staff> staffs = searchedStaffs
        .where((staff) => staff.isSelected == true)
        .map((staff) => staff.staff)
        .toList();

    widget.onListChange(staffs);
  }

  void onTabUndoBtn() {
    setState(() {
      for (var staff in searchedStaffs) {
        staff.isSelected = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color lightColor = Theme.of(context).primaryColorLight;

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
                  "${widget.text} 수정",
                  style: titleStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                SimpleTextInputWidget(
                  placeHolder: "직원명을 검색하세요",
                  onChanged: onSearchInputChanged,
                  controller: searchInputController,
                ),
                OverlaySearchResultsWidget(
                  // staffSearch: false,
                  suggestions: searchSuggestions,
                  controller: searchInputController,
                  onSelect: onSuggestionSelected,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: searchedStaffs.length, // 스태프 수에 따라 아이템 수 결정
                itemBuilder: (BuildContext context, int index) {
                  final _SelectableStaff staff = searchedStaffs[index];
                  if (!staff.isShow) return const SizedBox.shrink();
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: GestureDetector(
                      onTap: () => handleOnTap(index),
                      child: ColumnItemContainer(
                        color: searchedStaffs[index].isSelected
                            ? lightColor
                            : Colors.white,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                StaffProfileWidget(
                                  imagePath:
                                      "lib/assets/images/${staff.staff.image}",
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  staff.staff.name,
                                  style:
                                      contentTextStyle.copyWith(fontSize: 16),
                                ),
                              ],
                            ),
                            Icon(
                              searchedStaffs[index].isSelected
                                  ? Icons.check_box_outlined
                                  : Icons.check_box_outline_blank_outlined,
                              color: searchedStaffs[index].isSelected
                                  ? Theme.of(context).primaryColor
                                  : Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SaveCancelFooter(
              onTabUndoBtn: onTabUndoBtn,
              onTapSaveBtn: () => {
                onTapSaveBtn(),
                Navigator.of(context).pop(),
              },
            )
          ],
        ),
      ),
    );
  }
}
