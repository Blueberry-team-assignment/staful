import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/data/staff_repository.dart';
import 'package:staful/dto/staff/create_staff_dto.dart';
import 'package:staful/dto/staff/update_staff_dto.dart';

// family를 사용하여 각 staff에 대해 별도의 상태를 관리할 수 있습니다.
// 동일한 구조로 여러 staff에 대해 독립적으로 상태를 관리할 수 있습니다.
// autoDispose 덕분에 사용하지 않는 상태는 자동으로 정리(dispose)됩니다.
final staffInfoNotifierProvider = StateNotifierProvider.autoDispose
    .family<StaffInfoNotifier, StaffInfoState, Staff>((ref, staff) {
  final staffRepository = ref.read(staffRepositoryProvider);
  return StaffInfoNotifier(staffRepository, staff);
});

class StaffInfoNotifier extends StateNotifier<StaffInfoState> {
  final StaffInterface _staffRepository;
  final Staff _staff;

  StaffInfoNotifier(this._staffRepository, this._staff)
      : super(StaffInfoState(
          originalStaffInfo: _staff,
          editableStaffInfo: _staff.copyWith(),
        ));

  void updateEditableStaff(Staff updatedStaff) {
    state = state.copyWith(editableStaffInfo: updatedStaff);
  }

  void resetToOriginal() {
    state = state.copyWith(
      editableStaffInfo: state.originalStaffInfo?.copyWith(),
    );
  }

  void saveChanges(String uid) {
    state = state.copyWith(originalStaffInfo: state.editableStaffInfo);
    print('update staff id : ${state.editableStaffInfo?.staffId}');
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
      state = state.copyWith(originalStaffInfo: updatedStaff, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      throw Exception('Failed to update staff: $e');
    }
  }

  Future<void> createStaff({
    required String uid,
    required CreateStaffDto createStaffDto,
  }) async {
    try {
      state = state.copyWith(isLoading: true);
      final newStaff = await _staffRepository.createStaff(
          uid: uid, createStaffDto: createStaffDto);
      state = state.copyWith(originalStaffInfo: newStaff, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      throw Exception('Failed to create staff: $e');
    }
  }
}

class StaffInfoState {
  final Staff? originalStaffInfo;
  final Staff? editableStaffInfo;
  final bool isLoading;

  StaffInfoState({
    this.isLoading = false,
    this.originalStaffInfo,
    this.editableStaffInfo,
  });

  StaffInfoState copyWith({
    bool? isLoading,
    Staff? originalStaffInfo,
    Staff? editableStaffInfo,
  }) {
    return StaffInfoState(
      isLoading: isLoading ?? this.isLoading,
      originalStaffInfo: originalStaffInfo ?? this.originalStaffInfo,
      editableStaffInfo: editableStaffInfo ?? this.editableStaffInfo,
    );
  }
}
