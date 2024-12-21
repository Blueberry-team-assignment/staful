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

  void toggleEditMode() {
    state = state.copyWith(isEditMode: !state.isEditMode);
  }

  void updateStaffInfoState(Staff? staffInfo) {
    if (staffInfo != null) {
      state = state.copyWith(staffInfo: staffInfo);
    }
  }

  Future<void> updateStaff(String uid, UpdateStaffDto updateStaffDto) async {
    try {
      state = state.copyWith(isLoading: true);
      final updatedStaff = await _staffRepository.updateStaff(
          uid: uid, updateStaffDto: updateStaffDto);
      state = state.copyWith(staffInfo: updatedStaff, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      throw Exception('Failed to update staff: $e');
    }
  }

  Future<void> createStaff(String uid, CreateStaffDto createStaffDto) async {
    try {
      state = state.copyWith(isLoading: true);
      final newStaff = await _staffRepository.createStaff(
          uid: uid, createStaffDto: createStaffDto);
      state = state.copyWith(staffInfo: newStaff, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      throw Exception('Failed to create staff: $e');
    }
  }
}

class StaffInfoState {
  final Staff? staffInfo;
  final bool isLoading;
  final bool isEditMode;

  StaffInfoState({
    this.isEditMode = false,
    this.isLoading = false,
    this.staffInfo,
  });

  StaffInfoState copyWith({
    bool? isEditMode,
    bool? isLoading,
    Staff? staffInfo,
  }) {
    return StaffInfoState(
      isEditMode: isEditMode ?? this.isEditMode,
      isLoading: isLoading ?? this.isLoading,
      staffInfo: staffInfo ?? this.staffInfo,
    );
  }
}
