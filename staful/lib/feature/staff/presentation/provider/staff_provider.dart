import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';
import 'package:staful/feature/staff/domain/usecases/filter_by_search_input_usecase.dart';
import 'package:staful/feature/staff/domain/usecases/staff_crud_usecase.dart';
import 'package:staful/feature/staff/presentation/provider/state/staff_state.dart';
import 'package:staful/utils/constants.dart';

final staffNotifierProvider =
    StateNotifierProvider.autoDispose<StaffNotifier, StaffState>((ref) {
  final staffCrudUsecase = ref.watch(staffCrudUsecaseProvider);
  final filterBySearchInputUsecase =
      ref.watch(filterBySearchInputUsecaseProvider);

  return StaffNotifier(staffCrudUsecase, filterBySearchInputUsecase);
});

class StaffNotifier extends StateNotifier<StaffState> {
  final StaffCrudUsecase _staffCrudUsecase;
  final FilterBySearchInputUsecase _filterBySearchInputUsecase;

  StaffNotifier(
    this._staffCrudUsecase,
    this._filterBySearchInputUsecase,
  ) : super(const StaffState());

  Future<void> fetchAllStaffs() async {
    try {
      setLoading(true);
      final staffs = await _staffCrudUsecase.getAllStaffs();

      state = state.copyWith(list: staffs, filteredList: staffs);
      setLoading(false);
    } catch (e) {
      setLoading(false);
      throw Exception(e);
    }
  }

  Future<void> createStaff(StaffModel staff) async {
    setLoading(true);

    final newStaff = await _staffCrudUsecase.createStaff(staff);

    state = state.copyWith(
        list: [newStaff, ...state.list],
        filteredList: [newStaff, ...state.filteredList]);
    setLoading(false);
  }

  Future<void> updateStaff(StaffModel staff) async {
    setLoading(true);

    final updatedStaff = await _staffCrudUsecase.updateStaff(staff);

    StaffModel callback(StaffModel staff) {
      if (staff.id == updatedStaff.id) {
        return updatedStaff;
      }
      return staff;
    }

    state = state.copyWith(
        list: state.list.map(callback).toList(),
        filteredList: state.filteredList.map(callback).toList());

    setLoading(false);
  }

  Future<void> deleteStaff(String staffId) async {
    setLoading(true);

    await _staffCrudUsecase.deleteStaff(staffId);

    bool callback(StaffModel staff) {
      if (staff.id == staffId) {
        return false;
      }
      return true;
    }

    state = state.copyWith(
        list: state.list.where(callback).toList(),
        filteredList: state.filteredList.where(callback).toList());
    setLoading(false);
  }

  void resetChange(StaffModel staff) {
    state = state.copyWith(selectedStaff: staff);
  }

  Future<void> getFilteredBySearchInputList(String text) async {
    setLoading(true);
    final filteredList = await _filterBySearchInputUsecase.execute(text: text);
    state = state.copyWith(filteredList: filteredList);
    setLoading(false);
  }

  void initializeSelectedStaff(StaffModel? staff) {
    final selectedStaff =
        staff ?? StaffModel(name: "", workHours: defaultTimeRange);
    state = state.copyWith(selectedStaff: selectedStaff);
  }

  void updateSelectedStaff({required String field, required dynamic value}) {
    final selectedStaff = state.selectedStaff;

    final updatedStaff = selectedStaff.copyWith(
      name: field == 'name' ? value : selectedStaff.name,
      templateId: field == 'templateId' ? value : selectedStaff.templateId,
      image: field == 'image' ? value : selectedStaff.image,
      workDays: field == 'workDays' ? value : selectedStaff.workDays,
      workHours: field == 'workHours' ? value : selectedStaff.workHours,
      modifiedWorkSchedule: field == 'modifiedWorkSchedule'
          ? value
          : selectedStaff.modifiedWorkSchedule,
      desc: field == 'desc' ? value : selectedStaff.desc,
      isSelected: field == 'isSelected' ? value : selectedStaff.isSelected,
      isVisible: field == 'isVisible' ? value : selectedStaff.isVisible,
      isDeleted: field == 'isDeleted' ? value : selectedStaff.isDeleted,
    );

    state = state.copyWith(selectedStaff: updatedStaff);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }
}
