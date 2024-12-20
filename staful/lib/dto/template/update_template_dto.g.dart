// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_template_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateTemplateDtoImpl _$$UpdateTemplateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateTemplateDtoImpl(
      name: json['name'] as String?,
      payDetails: (json['payDetails'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      staffIds: (json['staffIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      templateId: json['templateId'] as String,
    );

Map<String, dynamic> _$$UpdateTemplateDtoImplToJson(
        _$UpdateTemplateDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'payDetails': instance.payDetails,
      'staffIds': instance.staffIds,
      'templateId': instance.templateId,
    };
