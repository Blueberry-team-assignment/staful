// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pay_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PayDetailDto _$PayDetailDtoFromJson(Map<String, dynamic> json) {
  return _PayDetailDto.fromJson(json);
}

/// @nodoc
mixin _$PayDetailDto {
  String? get id => throw _privateConstructorUsedError;
  PayTypeDto get payType => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  /// Serializes this PayDetailDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PayDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PayDetailDtoCopyWith<PayDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayDetailDtoCopyWith<$Res> {
  factory $PayDetailDtoCopyWith(
          PayDetailDto value, $Res Function(PayDetailDto) then) =
      _$PayDetailDtoCopyWithImpl<$Res, PayDetailDto>;
  @useResult
  $Res call({String? id, PayTypeDto payType, String desc, int amount});
}

/// @nodoc
class _$PayDetailDtoCopyWithImpl<$Res, $Val extends PayDetailDto>
    implements $PayDetailDtoCopyWith<$Res> {
  _$PayDetailDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PayDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? payType = null,
    Object? desc = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      payType: null == payType
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as PayTypeDto,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PayDetailDtoImplCopyWith<$Res>
    implements $PayDetailDtoCopyWith<$Res> {
  factory _$$PayDetailDtoImplCopyWith(
          _$PayDetailDtoImpl value, $Res Function(_$PayDetailDtoImpl) then) =
      __$$PayDetailDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, PayTypeDto payType, String desc, int amount});
}

/// @nodoc
class __$$PayDetailDtoImplCopyWithImpl<$Res>
    extends _$PayDetailDtoCopyWithImpl<$Res, _$PayDetailDtoImpl>
    implements _$$PayDetailDtoImplCopyWith<$Res> {
  __$$PayDetailDtoImplCopyWithImpl(
      _$PayDetailDtoImpl _value, $Res Function(_$PayDetailDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PayDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? payType = null,
    Object? desc = null,
    Object? amount = null,
  }) {
    return _then(_$PayDetailDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      payType: null == payType
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as PayTypeDto,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PayDetailDtoImpl implements _PayDetailDto {
  const _$PayDetailDtoImpl(
      {this.id,
      required this.payType,
      required this.desc,
      required this.amount});

  factory _$PayDetailDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PayDetailDtoImplFromJson(json);

  @override
  final String? id;
  @override
  final PayTypeDto payType;
  @override
  final String desc;
  @override
  final int amount;

  @override
  String toString() {
    return 'PayDetailDto(id: $id, payType: $payType, desc: $desc, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayDetailDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.payType, payType) || other.payType == payType) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, payType, desc, amount);

  /// Create a copy of PayDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PayDetailDtoImplCopyWith<_$PayDetailDtoImpl> get copyWith =>
      __$$PayDetailDtoImplCopyWithImpl<_$PayDetailDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PayDetailDtoImplToJson(
      this,
    );
  }
}

abstract class _PayDetailDto implements PayDetailDto {
  const factory _PayDetailDto(
      {final String? id,
      required final PayTypeDto payType,
      required final String desc,
      required final int amount}) = _$PayDetailDtoImpl;

  factory _PayDetailDto.fromJson(Map<String, dynamic> json) =
      _$PayDetailDtoImpl.fromJson;

  @override
  String? get id;
  @override
  PayTypeDto get payType;
  @override
  String get desc;
  @override
  int get amount;

  /// Create a copy of PayDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PayDetailDtoImplCopyWith<_$PayDetailDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
