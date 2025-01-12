import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/staff_info/domain/model/staff_model.dart';
import 'package:staful/feature/staff_info/presentation/provider/staff_provider.dart';
import 'package:staful/feature/payroll_template/domain/model/template_model.dart';
import 'package:staful/feature/payroll_template/domain/usecases/filter_pay_details_usecase.dart';
import 'package:staful/feature/payroll_template/domain/usecases/filter_staffs_usecase.dart';
import 'package:staful/feature/payroll_template/domain/usecases/filter_templates_usecase.dart';
import 'package:staful/feature/payroll_template/domain/usecases/templates_crud_usecase.dart';
import 'package:staful/feature/payroll_template/presentation/provider/state/template_state.dart';
import 'package:staful/utils/constants.dart';

final templateNotifierProvider =
    StateNotifierProvider<TemplateNotifier, TemplateState>((ref) {
  final templateCrudUsecase = ref.watch(templateCrudUsecaseProvider);
  final filterTemplatesUsecase = ref.watch(filterTemplatesUsecaseProvider);
  final filterPayDetailsUsecase = ref.watch(filterPayDetailsUsecaseProvider);
  final filterStaffsUsecase = ref.watch(filterStaffsUsecaseProvider);
  final staffList = ref.watch(staffNotifierProvider).list;
  return TemplateNotifier(filterTemplatesUsecase, templateCrudUsecase,
      filterPayDetailsUsecase, filterStaffsUsecase, staffList);
});

class TemplateNotifier extends StateNotifier<TemplateState> {
  final TemplateCrudUsecase _templateCrudUsecase;
  final FilterTemplatesUsecase _filterTemplatesUsecase;
  final FilterPayDetailsUsecase _filterPayDetailsUsecase;
  final FilterStaffsUsecase _filterStaffsUsecase;
  final List<StaffModel> staffList;

  TemplateNotifier(
    this._filterTemplatesUsecase,
    this._templateCrudUsecase,
    this._filterPayDetailsUsecase,
    this._filterStaffsUsecase,
    this.staffList,
  ) : super(const TemplateState()) {
    initialize();
  }

  void initialize() {
    state =
        state.copyWith(staffList: staffList, selectedTemplate: defaultTemplate);
  }

  Future<void> fetchAllTemplates() async {
    try {
      setLoading(true);
      final templates = await _templateCrudUsecase.getAllTemplates();
      state = state.copyWith(list: templates, filteredList: templates);
      setLoading(false);
    } catch (e) {
      setLoading(false);
      throw Exception(e);
    }
  }

  Future<void> createTemplate(TemplateModel template) async {
    setLoading(true);

    final newTemplate = await _templateCrudUsecase.createTemplate(template);

    state = state.copyWith(
        list: [newTemplate, ...state.list],
        filteredList: [newTemplate, ...state.filteredList]);
    setLoading(false);
  }

  Future<void> updateTemplate(TemplateModel template) async {
    setLoading(true);

    final updatedTemplate = await _templateCrudUsecase.updateTemplate(template);

    TemplateModel callback(TemplateModel template) {
      if (template.id == updatedTemplate.id) {
        return updatedTemplate;
      }
      return template;
    }

    state = state.copyWith(
      list: state.list.map(callback).toList(),
      filteredList: state.filteredList.map(callback).toList(),
      selectedTemplate: updatedTemplate,
    );

    setLoading(false);
  }

  Future<void> deleteTemplate(String templateId) async {
    setLoading(true);

    await _templateCrudUsecase.deleteTemplate(templateId);

    bool callback(TemplateModel template) {
      if (template.id == templateId) {
        return false;
      }
      return true;
    }

    state = state.copyWith(
        list: state.list.where(callback).toList(),
        filteredList: state.filteredList.where(callback).toList());
    setLoading(false);
  }

  Future<void> getFilteredList(String text) async {
    setLoading(true);
    final filteredList = await _filterTemplatesUsecase.execute(
        text: text, templateList: state.list);
    state = state.copyWith(filteredList: filteredList);
    setLoading(false);
  }

  void getFilteredStaffList(String text) {
    if (text == "" || text.isEmpty) {
      setListAllVisible();
      return;
    }
    final filteredList =
        _filterStaffsUsecase.execute(text: text, staffList: staffList);
    state = state.copyWith(staffList: filteredList);
  }

  void getFilteredPayDetailList(String text) {
    final filteredList = _filterPayDetailsUsecase.execute(
        text: text, payDetailList: state.selectedTemplate.payDetails);
    state = state.copyWith(
        selectedTemplate:
            state.selectedTemplate.copyWith(payDetails: filteredList));
  }

  void setSelectedTemplate(TemplateModel template) {
    state = state.copyWith(selectedTemplate: template);
  }

  void togglePayDetail(String name) {
    final updatedItem = state.selectedTemplate.payDetails.map((payDetail) {
      if (payDetail.desc == name) {
        return payDetail.copyWith(isSelected: !payDetail.isSelected);
      }
      return payDetail;
    }).toList();

    state = state.copyWith(
        selectedTemplate:
            state.selectedTemplate.copyWith(payDetails: updatedItem));
  }

  // staff 탭할때
  void updateSelectedStaff(String staffId) {
    final updatedStaffList = state.staffList.map((staff) {
      if (staff.id == staffId) {
        return staff.copyWith(isSelected: !staff.isSelected);
      }
      return staff;
    }).toList();

    final List<String> updatedStaffIds =
        List.from(state.selectedTemplate.staffIds);
    if (updatedStaffIds.contains(staffId)) {
      updatedStaffIds.remove(staffId);
    } else {
      updatedStaffIds.add(staffId);
    }

    state = state.copyWith(
        staffList: updatedStaffList,
        selectedTemplate:
            state.selectedTemplate.copyWith(staffIds: updatedStaffIds));
  }

  void updateAmount(String name, int amount) {
    final updatedItem = state.selectedTemplate.payDetails.map((payDetail) {
      if (payDetail.desc == name) {
        return payDetail.copyWith(amount: amount);
      }
      return payDetail;
    }).toList();

    state = state.copyWith(
        selectedTemplate:
            state.selectedTemplate.copyWith(payDetails: updatedItem));
  }

  void updateName({required String name}) {
    state = state.copyWith(
      selectedTemplate: state.selectedTemplate.copyWith(name: name),
    );
  }

  void setStaffSelected(List<String> staffIds) {
    state = state.copyWith(
        staffList: state.staffList.map((staff) {
      if (staffIds.contains(staff.id)) {
        return staff.copyWith(isSelected: true);
      }
      return staff.copyWith(isSelected: false);
    }).toList());
  }

  // 스태프리스트와 지급항목리스트 올 비지블.
  void setListAllVisible() {
    state = state.copyWith(
        staffList: state.staffList
            .map((staff) => staff.copyWith(isVisible: true))
            .toList(),
        selectedTemplate: state.selectedTemplate.copyWith(
            payDetails: state.selectedTemplate.payDetails
                .map((payDetail) => payDetail.copyWith(isVisible: true))
                .toList()));
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }
}
