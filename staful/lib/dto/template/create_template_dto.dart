import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_template_dto.freezed.dart';
part 'create_template_dto.g.dart';

@freezed
class CreateTemplateDto with _$CreateTemplateDto {
  const factory CreateTemplateDto({
    required String name,
    required List<Map<String, dynamic>> payDetails,
    List<String>? staffIds,
  }) = _CreateTemplateDto;

  factory CreateTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$CreateTemplateDtoFromJson(json);
}
