import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/pay_detail/domain/model/pay_detail_model.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';
import 'package:staful/feature/staff/presentation/provider/staff_provider.dart';
import 'package:staful/feature/template/domain/model/template_model.dart';
import 'package:staful/feature/template/domain/usecases/filter_pay_details_usecase.dart';
import 'package:staful/feature/template/domain/usecases/filter_templates_usecase.dart';
import 'package:staful/feature/template/domain/usecases/templates_crud_usecase.dart';
import 'package:staful/feature/template/presentation/provider/state/template_state.dart';

final templateNotifierProvider =
    StateNotifierProvider.autoDispose<TemplateNotifier, TemplateState>((ref) {
  final templateCrudUsecase = ref.watch(templateCrudUsecaseProvider);
  final filterTemplatesUsecase = ref.watch(filterTemplatesUsecaseProvider);
  final filterPayDetailsUsecase = ref.watch(filterPayDetailsUsecaseProvider);
  final staffList = ref.watch(staffNotifierProvider).list;
  return TemplateNotifier(filterTemplatesUsecase, templateCrudUsecase,
      filterPayDetailsUsecase, staffList);
});

class TemplateNotifier extends StateNotifier<TemplateState> {
  final TemplateCrudUsecase _templateCrudUsecase;
  final FilterTemplatesUsecase _filterTemplatesUsecase;
  final FilterPayDetailsUsecase _filterPayDetailsUsecase;
  final List<StaffModel> staffList;

  TemplateNotifier(
    this._filterTemplatesUsecase,
    this._templateCrudUsecase,
    this._filterPayDetailsUsecase,
    this.staffList,
  ) : super(const TemplateState()) {
    initialize();
  }

  void initialize() {
    state = state.copyWith(
      staffList: staffList,
    );
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
        filteredList: state.filteredList.map(callback).toList());

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
    final filteredList = await _filterTemplatesUsecase.execute(text: text);
    state = state.copyWith(filteredList: filteredList);
    setLoading(false);
  }

  void getFilteredPayDetailList(String text) {
    final filteredList = _filterPayDetailsUsecase.execute(
        text: text, payDetailList: state.payDetailList);
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

  void updateSelectedTemplate({required String field, required dynamic value}) {
    final selectedTemplate = state.selectedTemplate;

    final updateTemplate = selectedTemplate.copyWith(
      name: field == 'name' ? value : selectedTemplate.name,
      staffIds: field == 'staffIds' ? value : selectedTemplate.staffIds,
      payDetails: field == 'payDetails' ? value : selectedTemplate.payDetails,
      isSelected: field == 'isSelected' ? value : selectedTemplate.isSelected,
      isVisible: field == 'isVisible' ? value : selectedTemplate.isVisible,
      isDeleted: field == 'isDeleted' ? value : selectedTemplate.isDeleted,
    );

    state = state.copyWith(selectedTemplate: updateTemplate);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }
}
