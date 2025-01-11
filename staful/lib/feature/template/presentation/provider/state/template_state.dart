import 'package:staful/feature/pay_detail/domain/model/pay_detail_model.dart';
import 'package:staful/feature/staff/domain/model/staff_model.dart';
import 'package:staful/feature/template/domain/model/template_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:staful/utils/constants.dart';

part 'template_state.freezed.dart';

@freezed
class TemplateState with _$TemplateState {
  const factory TemplateState({
    @Default([]) List<TemplateModel> list,
    @Default([]) List<TemplateModel> filteredList,
    @Default(defaultTemplate) TemplateModel selectedTemplate,
    @Default([]) List<StaffModel> staffList,
    @Default(false) bool isLoading,
  }) = _TemplateState;
}
