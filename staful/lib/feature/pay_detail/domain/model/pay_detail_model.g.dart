// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PayDetailModelImpl _$$PayDetailModelImplFromJson(Map<String, dynamic> json) =>
    _$PayDetailModelImpl(
      id: json['id'] as String?,
      payType: $enumDecode(_$PayTypeEnumMap, json['payType']),
      desc: json['desc'] as String,
      amount: (json['amount'] as num).toInt(),
      templateId: json['templateId'] as String?,
      isSelected: json['isSelected'] as bool? ?? false,
      isVisible: json['isVisible'] as bool? ?? true,
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$PayDetailModelImplToJson(
        _$PayDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payType': _$PayTypeEnumMap[instance.payType]!,
      'desc': instance.desc,
      'amount': instance.amount,
      'templateId': instance.templateId,
      'isSelected': instance.isSelected,
      'isVisible': instance.isVisible,
      'isDeleted': instance.isDeleted,
    };

const _$PayTypeEnumMap = {
  PayType.hourly: 'hourly',
  PayType.fixed: 'fixed',
};
