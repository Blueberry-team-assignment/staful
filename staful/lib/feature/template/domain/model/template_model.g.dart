// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateModelImpl _$$TemplateModelImplFromJson(Map<String, dynamic> json) =>
    _$TemplateModelImpl(
      id: json['id'] as String?,
      staffIds: (json['staffIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      name: json['name'] as String,
      payDetails: (json['payDetails'] as List<dynamic>)
          .map((e) => PayDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSelected: json['isSelected'] as bool? ?? false,
      isVisible: json['isVisible'] as bool? ?? true,
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$TemplateModelImplToJson(_$TemplateModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'staffIds': instance.staffIds,
      'name': instance.name,
      'payDetails': instance.payDetails,
      'isSelected': instance.isSelected,
      'isVisible': instance.isVisible,
      'isDeleted': instance.isDeleted,
    };
