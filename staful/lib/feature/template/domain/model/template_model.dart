import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:staful/feature/pay_detail/domain/model/pay_detail_model.dart';

part 'template_model.freezed.dart';
part 'template_model.g.dart';

@freezed
class TemplateModel with _$TemplateModel {
  const factory TemplateModel({
    String? id,
    @Default([]) List<String> staffIds,
    required String name,
    required List<PayDetailModel> payDetails,
    @Default(false) bool isSelected,
    @Default(true) bool isVisible,
    @Default(false) bool isDeleted,
  }) = _TemplateModel;

  factory TemplateModel.fromJson(Map<String, dynamic> json) =>
      _$TemplateModelFromJson(json);
}
