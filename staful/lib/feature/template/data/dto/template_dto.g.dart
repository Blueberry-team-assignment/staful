// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateDtoImpl _$$TemplateDtoImplFromJson(Map<String, dynamic> json) =>
    _$TemplateDtoImpl(
      name: json['name'] as String?,
      staffIds: (json['staffIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      payDetails: (json['payDetails'] as List<dynamic>?)
          ?.map(
              (e) => PayDetailDto.fromJson(e.toJson() as Map<String, dynamic>))
          .toList(),
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$$TemplateDtoImplToJson(_$TemplateDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'staffIds': instance.staffIds,
      'payDetails':
          instance.payDetails?.map((payDetail) => payDetail.toJson()).toList(),
      'isDeleted': instance.isDeleted,
    };
