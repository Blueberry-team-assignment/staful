import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/template/domain/model/template_model.dart';
import 'package:staful/feature/template/domain/usecases/filter_templates_usecase.dart';
import 'package:staful/feature/template/domain/usecases/templates_crud_usecase.dart';
import 'package:staful/feature/template/presentation/provider/state/template_state.dart';

final templateNotifierProvider =
    StateNotifierProvider<TemplateNotifier, TemplateState>((ref) {
  final templateCrudUsecase = ref.watch(templateCrudUsecaseProvider);
  final filterTemplatesUsecase = ref.watch(filterTemplatesUsecaseProvider);
  return TemplateNotifier(filterTemplatesUsecase, templateCrudUsecase);
});

class TemplateNotifier extends StateNotifier<TemplateState> {
  final TemplateCrudUsecase _templateCrudUsecase;
  final FilterTemplatesUsecase _filterTemplatesUsecase;

  TemplateNotifier(
    this._filterTemplatesUsecase,
    this._templateCrudUsecase,
  ) : super(const TemplateState());

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

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }
}
