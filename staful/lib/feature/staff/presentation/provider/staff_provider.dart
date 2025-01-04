import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';
import 'package:staful/feature/staff/domain/usecases/filter_by_date_usecase.dart';
import 'package:staful/feature/staff/domain/usecases/filter_by_search_input_usecase.dart';
import 'package:staful/feature/staff/domain/usecases/staff_crud_usecase.dart';
import 'package:staful/feature/staff/presentation/provider/state/staff_state.dart';

final staffNotifierProvider =
    StateNotifierProvider.autoDispose<StaffNotifier, StaffState>((ref) {
  final staffCrudUsecase = ref.watch(staffCrudUsecaseProvider);
  final filterByDateUsecase = ref.watch(filterByDateUsecaseProvider);
  final filterBySearchInputUsecase =
      ref.watch(filterBySearchInputUsecaseProvider);
  return StaffNotifier(
      staffCrudUsecase, filterByDateUsecase, filterBySearchInputUsecase);
});

class StaffNotifier extends StateNotifier<StaffState> {
  final StaffCrudUsecase _staffCrudUsecase;
  final FilterByDateUsecase _filterByDateUsecase;
  final FilterBySearchInputUsecase _filterBySearchInputUsecase;

  StaffNotifier(
    this._staffCrudUsecase,
    this._filterByDateUsecase,
    this._filterBySearchInputUsecase,
  ) : super(const StaffState());

  Future<void> fetchAllStaffs() async {
    try {
      setLoading(true);
      final staffs = await _staffCrudUsecase.getAllStaffs();

      state = state.copyWith(list: staffs);
      setLoading(false);
    } catch (e) {
      setLoading(false);
      throw Exception(e);
    }
  }

  Future<void> createStaff(StaffModel staff) async {
    setLoading(true);

    await _staffCrudUsecase.createStaff(staff);
    setLoading(false);
  }

  Future<void> getFilteredByDateList(DateTime date) async {
    setLoading(true);
    final filteredList = await _filterByDateUsecase.execute(selectedDay: date);
    state = state.copyWith(filteredList: filteredList);
    setLoading(false);
  }

  Future<void> getFilteredBySearchInputList(String text) async {
    setLoading(true);
    final filteredList = await _filterBySearchInputUsecase.execute(text: text);
    state = state.copyWith(filteredList: filteredList);
    setLoading(false);
  }

  void updateWorkDays({
    required String staffId,
    required List<String> workDays,
  }) {
    final updatedList = state.list.map((staff) {
      if (staff.id == staffId) {
        return staff.copyWith(workDays: workDays);
      }
      return staff;
    }).toList();

    state = state.copyWith(list: updatedList);
  }

  void updateSelectedStaff({required String field, required dynamic value}) {
    final selectedStaff = state.selectedStaff;

    if (selectedStaff == null) return;

    final updatedStaff = selectedStaff.copyWith(
      name: field == 'name' ? value : selectedStaff.name,
      templateId: field == 'templateId' ? value : selectedStaff.templateId,
      image: field == 'image' ? value : selectedStaff.image,
      workDays: field == 'workDays' ? value : selectedStaff.workDays,
      workHours: field == 'workHours' ? value : selectedStaff.workHours,
      workSchedules:
          field == 'workSchedules' ? value : selectedStaff.workSchedules,
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
