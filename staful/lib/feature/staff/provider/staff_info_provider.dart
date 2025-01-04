import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/feature/staff/data/repositories/staff_repository.dart';
import 'package:staful/data/dto/staff/create_staff_dto.dart';
import 'package:staful/data/dto/staff/update_staff_dto.dart';
import 'package:staful/feature/staff/provider/staff_provider.dart';

// family를 사용하여 각 staff에 대해 별도의 상태를 관리할 수 있습니다.
// 동일한 구조로 여러 staff에 대해 독립적으로 상태를 관리할 수 있습니다.
// autoDispose 덕분에 사용하지 않는 상태는 자동으로 정리(dispose)됩니다.
final staffInfoNotifierProvider = StateNotifierProvider.autoDispose
    .family<StaffInfoNotifier, StaffInfoState, Staff>((ref, staff) {
  final staffRepository = ref.read(staffRepositoryProvider);
  return StaffInfoNotifier(staffRepository, staff, ref);
});

class StaffInfoNotifier extends StateNotifier<StaffInfoState> {
  final StaffInterface _staffRepository;
  final Staff _staff;
  final Ref _ref;

  StaffInfoNotifier(
    this._staffRepository,
    this._staff,
    this._ref,
  ) : super(StaffInfoState(
          originalStaffInfo: _staff,
          editableStaffInfo: _staff.copyWith(),
          createdStaffInfo: _staff.copyWith(),
        ));

  void updateEditableStaff(Staff updatedStaff) {
    state = state.copyWith(editableStaffInfo: updatedStaff);
  }

  void updateCreatedStaff(Staff createdStaff) {
    state = state.copyWith(createdStaffInfo: createdStaff);
  }

  void resetToOriginal() {
    state = state.copyWith(
      editableStaffInfo: state.originalStaffInfo?.copyWith(),
    );
  }

  void saveChanges(String uid) {
    state = state.copyWith(originalStaffInfo: state.editableStaffInfo);

    final updateStaffDto = UpdateStaffDto(
      staffId: state.editableStaffInfo!.staffId,
      name: state.editableStaffInfo?.name,
      desc: state.editableStaffInfo?.desc,
      workDays: state.editableStaffInfo?.workDays,
      workHours: {
        "start": {
          "hour": state.editableStaffInfo!.workHours!.startTime.hour,
          "minute": state.editableStaffInfo!.workHours!.startTime.minute,
        },
        "end": {
          "hour": state.editableStaffInfo!.workHours!.endTime.hour,
          "minute": state.editableStaffInfo!.workHours!.endTime.minute,
        },
      },
      image: state.editableStaffInfo?.image,
    );
    updateStaff(uid: uid, updateStaffDto: updateStaffDto);
  }

  Future<void> updateStaff({
    required String uid,
    required UpdateStaffDto updateStaffDto,
  }) async {
    try {
      state = state.copyWith(isLoading: true);
      final updatedStaff = await _staffRepository.updateStaff(
          uid: uid, updateStaffDto: updateStaffDto);

      // sync staffList
      final staffNotifier = _ref.read(staffNotifierProvider.notifier);
      staffNotifier.state = staffNotifier.state.copyWith(
        staffList: staffNotifier.state.staffList?.map((staff) {
          return staff.staffId == updatedStaff.staffId ? updatedStaff : staff;
        }).toList(),
      );
      state = state.copyWith(originalStaffInfo: updatedStaff, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      throw Exception('Failed to update staff: $e');
    }
  }

  Future<void> createStaff({
    required String uid,
    required Staff staff,
  }) async {
    try {
      state = state.copyWith(createdStaffInfo: staff, isLoading: true);
      final createStaffDto = CreateStaffDto(
        name: state.createdStaffInfo!.name,
        image: state.createdStaffInfo?.image,
        workDays: state.createdStaffInfo?.workDays,
        workHours: state.createdStaffInfo?.workHours != null
            ? {
                "start": {
                  "hour": state.createdStaffInfo!.workHours!.startTime.hour,
                  "minute": state.createdStaffInfo!.workHours!.startTime.minute,
                },
                "end": {
                  "hour": state.createdStaffInfo!.workHours!.endTime.hour,
                  "minute": state.createdStaffInfo!.workHours!.endTime.minute,
                },
              }
            : null,
        desc: state.createdStaffInfo?.desc ?? "",
      );
      final newStaff = await _staffRepository.createStaff(
          uid: uid, createStaffDto: createStaffDto);

      // sync staffList
      final staffNotifier = _ref.read(staffNotifierProvider.notifier);
      staffNotifier.state = staffNotifier.state.copyWith(
        staffList: [newStaff, ...?staffNotifier.state.staffList],
      );
      state = state.copyWith(createdStaffInfo: newStaff, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      throw Exception('Failed to create staff: $e');
    }
  }

  Future<void> deleteStaff(String uid, String staffId) async {
    try {
      state = state.copyWith(isLoading: true);
      await _staffRepository.deleteStaff(uid: uid, staffId: staffId);
      print('deleted staff id : $staffId');

      // sync staffList
      final staffNotifier = _ref.read(staffNotifierProvider.notifier);
      staffNotifier.state = staffNotifier.state.copyWith(
        staffList: staffNotifier.state.staffList
            ?.where((staff) => staff.staffId != staffId)
            .toList(),
      );
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      throw Exception('Failed to delete staff: $e');
    }
  }
}

class StaffInfoState {
  final Staff? originalStaffInfo;
  final Staff? editableStaffInfo;
  final Staff? createdStaffInfo;
  final bool isLoading;

  StaffInfoState({
    this.isLoading = false,
    this.originalStaffInfo,
    this.editableStaffInfo,
    this.createdStaffInfo,
  });

  StaffInfoState copyWith({
    bool? isLoading,
    Staff? originalStaffInfo,
    Staff? editableStaffInfo,
    Staff? createdStaffInfo,
  }) {
    return StaffInfoState(
      isLoading: isLoading ?? this.isLoading,
      originalStaffInfo: originalStaffInfo ?? this.originalStaffInfo,
      editableStaffInfo: editableStaffInfo ?? this.editableStaffInfo,
      createdStaffInfo: createdStaffInfo ?? this.createdStaffInfo,
    );
  }
}
