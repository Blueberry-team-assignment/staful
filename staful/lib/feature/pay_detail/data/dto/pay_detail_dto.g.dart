// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PayDetailDtoImpl _$$PayDetailDtoImplFromJson(Map<String, dynamic> json) =>
    _$PayDetailDtoImpl(
      id: json['id'] as String?,
      payType: $enumDecode(_$PayTypeDtoEnumMap, json['payType']),
      desc: json['desc'] as String,
      amount: (json['amount'] as num).toInt(),
      isSelected: json['isSelected'] as bool,
    );

Map<String, dynamic> _$$PayDetailDtoImplToJson(_$PayDetailDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payType': _$PayTypeDtoEnumMap[instance.payType]!,
      'desc': instance.desc,
      'amount': instance.amount,
      'isSelected': instance.isSelected,
    };

const _$PayTypeDtoEnumMap = {
  PayTypeDto.hourly: 'hourly',
  PayTypeDto.fixed: 'fixed',
};
