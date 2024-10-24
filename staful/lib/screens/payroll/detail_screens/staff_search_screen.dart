import 'package:flutter/material.dart';
import 'package:staful/layouts/app_layout.dart';
import 'package:staful/models/staff_model.dart';
import 'package:staful/screens/staff/staff_info_screen.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/dummies.dart';
import 'package:staful/widgets/confirmation_dialog.dart';
import 'package:staful/widgets/overlay_search_results_widget.dart';
import 'package:staful/widgets/save_cancel_footer.dart';
import 'package:staful/widgets/simple_text_input_widget.dart';
import 'package:staful/widgets/staff_profile_widget.dart';



class StaffSearchScreen extends StatefulWidget {
  final String text;
  // final void Function(List<Staff>) onListChange;
  final List<Staff> staffList;

  const StaffSearchScreen({
    super.key,
    required this.text,
    // required this.onListChange,
    required this.staffList,
  });

  @override
  State<StaffSearchScreen> createState() => _StaffSearchScreenState();
}

class _StaffSearchScreenState extends State<StaffSearchScreen> {
  final TextEditingController searchInputController = TextEditingController();
  late List<SelectableStaff> selectableStaffs = [];

  @override
  void initState() {
    super.initState();
    _initializeSelectableStaffs();
  }

  void _initializeSelectableStaffs() {
    final selectedStaffNames =
        widget.staffList.map((staff) => staff.name).toSet();

    selectableStaffs = STAFFS
        .map((staff) => SelectableStaff(
              staff: staff,
              isSelected: selectedStaffNames.contains(staff.name),
            ))
        .toList();
  }

  void _onSearchInputChanged(String text) {
    setState(() {
      if (text.isEmpty) {
        _showAllStaffs();
      } else {
        _filterStaffsByName(text);
      }
    });
  }

  void _showAllStaffs() {
    for (var staff in selectableStaffs) {
      staff.toggleVisibility(true);
    }
  }

  void _filterStaffsByName(String name) {
    for (var staff in selectableStaffs) {
      staff.toggleVisibility(staff.staff.name.contains(name));
    }
  }

  void _onSuggestionSelected(String suggestion) {
    searchInputController.text = suggestion;
    setState(() {
      _filterStaffsByName(suggestion);
    });
  }

  void _handleStaffTap(int index) {
    setState(() {
      selectableStaffs[index].toggleSelected();
    });
  }

  void _onTapSaveBtn(BuildContext context) {
    final List<Staff> selectedStaffs = selectableStaffs
        .where((staff) => staff.isSelected)
        .map((staff) => staff.staff)
        .toList();

    // widget.onListChange(selectedStaffs);
    Navigator.of(context).pop(selectedStaffs);
  }

  void _onTabUndoBtn(BuildContext context) {
    Navigator.of(context).pop();
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
            _buildHeader(),
            const SizedBox(height: 20),
            _buildSearchInput(),
            const SizedBox(height: 10),
            Expanded(child: _buildStaffList(lightColor)),
            SaveCancelFooter(
              onTabUndoBtn: () => _onTabUndoBtn(context),
              onTapSaveBtn: () => ConfirmationDialog.show(
                context: context,
                onConfirm: () => _onTapSaveBtn(context),
                message: "정상적으로 추가되었습니다",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${widget.text} 수정",
          style: titleStyle,
        ),
      ],
    );
  }

  Widget _buildSearchInput() {
    return Stack(
      children: [
        SimpleTextInputWidget(
          placeHolder: "직원명을 검색하세요",
          onChanged: _onSearchInputChanged,
          controller: searchInputController,
        ),
        OverlaySearchResultsWidget(
          suggestions: STAFFS.map((staff) => staff.name).toList(),
          controller: searchInputController,
          onSelect: _onSuggestionSelected,
        ),
      ],
    );
  }

  Widget _buildStaffList(Color lightColor) {
    return ListView.builder(
      itemCount: selectableStaffs.length,
      itemBuilder: (context, index) {
        final staff = selectableStaffs[index];
        if (!staff.isShown) return const SizedBox.shrink();

        return GestureDetector(
          onTap: () => _handleStaffTap(index),
          child: ColumnItemContainer(
            color: staff.isSelected ? lightColor : Colors.white,
            content: _buildStaffRow(staff),
          ),
        );
      },
    );
  }

  Widget _buildStaffRow(SelectableStaff staff) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            StaffProfileWidget(
                imagePath: "lib/assets/images/${staff.staff.image}"),
            const SizedBox(width: 10),
            Text(
              staff.staff.name,
              style: contentTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
        Icon(
          staff.isSelected
              ? Icons.check_box_outlined
              : Icons.check_box_outline_blank_outlined,
          color:
              staff.isSelected ? Theme.of(context).primaryColor : Colors.black,
        )
      ],
    );
  }
}
