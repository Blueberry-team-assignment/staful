import 'package:staful/feature/template/domain/model/template_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_state.freezed.dart';

@freezed
class TemplateState with _$TemplateState {
  const factory TemplateState({
    @Default([]) List<TemplateModel> list,
    @Default([]) List<TemplateModel> filteredList,
    TemplateModel? selectedTemplate,
    @Default(false) bool isLoading,
  }) = _TemplateState;
}

