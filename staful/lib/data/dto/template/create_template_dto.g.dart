// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_template_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateTemplateDtoImpl _$$CreateTemplateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateTemplateDtoImpl(
      name: json['name'] as String,
      payDetails: (json['payDetails'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      staffIds: (json['staffIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CreateTemplateDtoImplToJson(
        _$CreateTemplateDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'payDetails': instance.payDetails,
      'staffIds': instance.staffIds,
    };
