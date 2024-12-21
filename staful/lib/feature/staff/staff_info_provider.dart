import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/data/staff_repository.dart';
import 'package:staful/dto/staff/create_staff_dto.dart';
import 'package:staful/dto/staff/update_staff_dto.dart';

final staffInfoNotifierProvider =
    StateNotifierProvider.autoDispose<StaffInfoNotifier, StaffInfoState>((ref) {
  final staffRepository = ref.read(staffRepositoryProvider);
  return StaffInfoNotifier(staffRepository);
});

class StaffInfoNotifier extends StateNotifier<StaffInfoState> {
  final StaffInterface _staffRepository;

  StaffInfoNotifier(this._staffRepository) : super(StaffInfoState());

  void loadStaffInfo(Staff staff) {
    state = state.copyWith(
        originalStaffInfo: staff, editableStaffInfo: staff.copyWith());
  }

  void updateStaffInfoState(Staff? staffInfo) {
    state = state.copyWith(editableStaffInfo: staffInfo);
  }

  void saveStaffInfo() {
    state = state.copyWith(originalStaffInfo: state.editableStaffInfo);
    // 서버 업데이트 로직 추가
  }

  void resetEditableStaff() {
    state =
        state.copyWith(editableStaffInfo: state.originalStaffInfo!.copyWith());
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
