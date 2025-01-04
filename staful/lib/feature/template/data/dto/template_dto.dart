import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:staful/feature/pay_detail/domain/model/pay_detail_model.dart';

part 'template_dto.freezed.dart';
part 'template_dto.g.dart';

@freezed
class TemplateDto with _$TemplateDto {
  const factory TemplateDto({
    String? name,
    List<String>? staffIds,
    List<PayDetailModel>? payDetails, // PayDetailDto 사용
    bool? isDeleted,
  }) = _TemplateDto;

  factory TemplateDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateDtoFromJson(json);
}

