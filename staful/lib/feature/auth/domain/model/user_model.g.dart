// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      uid: json['uid'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      businessName: json['businessName'] as String,
      openingDate: DateTime.parse(json['openingDate'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'userId': instance.userId,
      'name': instance.name,
      'businessName': instance.businessName,
      'openingDate': instance.openingDate.toIso8601String(),
    };
