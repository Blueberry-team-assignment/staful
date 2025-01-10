import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/template/domain/model/template_model.dart';
import 'package:staful/feature/template/domain/usecases/filter_templates_usecase.dart';
import 'package:staful/feature/template/domain/usecases/templates_crud_usecase.dart';
import 'package:staful/feature/template/presentation/provider/template_state.dart';

final templateNotifierProvider =
    StateNotifierProvider.autoDispose<TemplateNotifier, TemplateState>((ref) {
  final templateCrudUsecase = ref.read(templateCrudUsecaseProvider);
  final filterTemplatesUsecase = ref.read(filterTemplatesUsecaseProvider);
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
      state = state.copyWith(list: templates);
      setLoading(false);
    } catch (e) {
      setLoading(false);
      throw Exception(e);
    }
  }

  Future<void> getFilteredList(String text) async {
    setLoading(true);
    final filteredList = await _filterTemplatesUsecase.execute(text: text);
    state = state.copyWith(filteredList: filteredList);
    setLoading(false);
  }

  void setList(List<TemplateModel> list) {
    state = state.copyWith(filteredList: list, list: list);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }
}
