import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/presentation/provider/log_in_provider.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';
import 'package:staful/feature/staff/domain/usecases/filter_by_search_input_usecase.dart';
import 'package:staful/feature/staff/domain/usecases/staff_crud_usecase.dart';
import 'package:staful/feature/staff/presentation/provider/state/staff_state.dart';
import 'package:staful/provider/uid_provider.dart';
import 'package:staful/utils/constants.dart';

final staffNotifierProvider =
    StateNotifierProvider.autoDispose<StaffNotifier, StaffState>((ref) {
  final staffCrudUsecase = ref.watch(staffCrudUsecaseProvider);
  final uid = ref.watch(uidProvider);
  final filterBySearchInputUsecase =
      ref.watch(filterBySearchInputUsecaseProvider);
  final staffList = ref.watch(logInProvider).staffList;
  return StaffNotifier(
      staffCrudUsecase, filterBySearchInputUsecase, uid!, staffList);
});

class StaffNotifier extends StateNotifier<StaffState> {
  final StaffCrudUsecase _staffCrudUsecase;
  final FilterBySearchInputUsecase _filterBySearchInputUsecase;
  final String uid;
  final List<StaffModel> staffList;

  StaffNotifier(
    this._staffCrudUsecase,
    this._filterBySearchInputUsecase,
    this.uid,
    this.staffList,
  ) : super(const StaffState()) {
    initialize();
  }

  void initialize() {
    state = state.copyWith(
        filteredList: staffList,
        list: staffList,
        selectedStaff: StaffModel(name: "", workHours: defaultTimeRange));
  }

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

    final newStaff = await _staffCrudUsecase.createStaff(staff);

    state = state.copyWith(list: [newStaff, ...state.list]);
    setLoading(false);
  }

  Future<void> updateStaff(StaffModel staff) async {
    setLoading(true);

    final updatedStaff = await _staffCrudUsecase.updateStaff(staff);

    state = state.copyWith(
        filteredList: state.list.map((staff) {
      if (staff.id == updatedStaff.id) {
        return updatedStaff;
      }
      return staff;
    }).toList());

    setLoading(false);
  }

  Future<void> deleteStaff(String staffId) async {
    setLoading(true);

    await _staffCrudUsecase.deleteStaff(staffId);

    state = state.copyWith(
        list: state.list.where((staff) {
      return staff.id != staffId;
    }).toList());
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

  void initializeSelectedStaff(StaffModel staff) {
    state = state.copyWith(selectedStaff: staff);
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

  void setList(List<StaffModel> list) {
    state = state.copyWith(list: list, filteredList: list);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }
}
