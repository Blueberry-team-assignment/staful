import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/feature/staff/staff_info_provider.dart';
import 'package:staful/domain/utils/app_styles.dart';
import 'package:image_picker/image_picker.dart';

class StaffInfoScreen extends ConsumerStatefulWidget {
  final Staff staffInfo; // 직원 정보는 필수 전달

  const StaffInfoScreen({
    super.key,
    required this.staffInfo,
  });

  @override
  ConsumerState<StaffInfoScreen> createState() => _StaffInfoScreenState();
}

class _StaffInfoScreenState extends ConsumerState<StaffInfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController memoFieldController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  bool isEditMode = false;

  @override
  void initState() {
    super.initState();

    // StaffInfo 초기화
    final notifier = ref.read(staffInfoNotifierProvider.notifier);
    notifier.loadStaffInfo(widget.staffInfo);

    // 컨트롤러 초기화
    nameController.text = widget.staffInfo.name;
    memoFieldController.text = widget.staffInfo.desc ?? "";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    memoFieldController.dispose();
    super.dispose();
  }

  // 수정 모드 토글
  void toggleEditMode() {
    setState(() {
      isEditMode = !isEditMode;
    });
  }

  // 저장 버튼 클릭
  void onSave() {
    final notifier = ref.read(staffInfoNotifierProvider.notifier);
    notifier.saveStaffInfo();

    // 저장 완료 후 보기 모드로 전환
    toggleEditMode();
  }

  // 이미지 변경 버튼 클릭
  Future<void> onTapImgChangeBtn() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final notifier = ref.read(staffInfoNotifierProvider.notifier);
      final currentStaff =
          ref.read(staffInfoNotifierProvider).editableStaffInfo;
      final updatedStaff = currentStaff?.copyWith(image: pickedFile.path);
      notifier.updateStaffInfoState(updatedStaff);
    }
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(staffInfoNotifierProvider.notifier);
    final state = ref.watch(staffInfoNotifierProvider);

    final editableStaff = state.editableStaffInfo;

    return Scaffold(
      appBar: AppBar(
        title: const Text("직원 정보"),
        actions: [
          if (!isEditMode)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: toggleEditMode, // 수정 모드 활성화
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 직원 이름 입력 필드
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "이름"),
              readOnly: !isEditMode,
              onChanged: (value) {
                notifier.updateStaffInfoState(
                  editableStaff?.copyWith(name: value),
                );
              },
            ),
            const SizedBox(height: 10),

            // 직원 메모 입력 필드
            TextField(
              controller: memoFieldController,
              decoration: const InputDecoration(labelText: "메모"),
              readOnly: !isEditMode,
              onChanged: (value) {
                notifier.updateStaffInfoState(
                  editableStaff?.copyWith(desc: value),
                );
              },
            ),
            const SizedBox(height: 20),

            // 직원 이미지 표시 및 변경
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: editableStaff?.image != null
                        ? FileImage(File(editableStaff!.image!))
                        : null,
                    child: editableStaff?.image == null
                        ? const Icon(Icons.person, size: 40)
                        : null,
                  ),
                  if (isEditMode)
                    TextButton(
                      onPressed: onTapImgChangeBtn,
                      child: const Text("사진 변경"),
                    ),
                ],
              ),
            ),
            const Spacer(),

            // 저장 버튼
            if (isEditMode)
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onSave,
                      child: const Text("저장"),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class ColumnItemContainer extends StatelessWidget {
  final Widget? content;
  final Color? color;

  const ColumnItemContainer({
    super.key,
    this.content,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: content,
    );
  }
}
