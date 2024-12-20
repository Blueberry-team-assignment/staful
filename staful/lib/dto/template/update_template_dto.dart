import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_template_dto.freezed.dart';
part 'update_template_dto.g.dart';

@freezed
class UpdateTemplateDto with _$UpdateTemplateDto {
  const factory UpdateTemplateDto({
    String? name,
    List<Map<String, dynamic>>? payDetails,
    List<String>? staffIds,
    required String templateId,
  }) = _UpdateTemplateDto;

  factory UpdateTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateTemplateDtoFromJson(json);
}
