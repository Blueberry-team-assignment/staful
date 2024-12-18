// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../sign_up_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignUpDto _$SignUpDtoFromJson(Map<String, dynamic> json) {
  return _SignUpDto.fromJson(json);
}

/// @nodoc
mixin _$SignUpDto {
  String get id => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get businessName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get openingDate => throw _privateConstructorUsedError;

  /// Serializes this SignUpDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignUpDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpDtoCopyWith<SignUpDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpDtoCopyWith<$Res> {
  factory $SignUpDtoCopyWith(SignUpDto value, $Res Function(SignUpDto) then) =
      _$SignUpDtoCopyWithImpl<$Res, SignUpDto>;
  @useResult
  $Res call(
      {String id,
      String password,
      String businessName,
      String name,
      DateTime openingDate});
}

/// @nodoc
class _$SignUpDtoCopyWithImpl<$Res, $Val extends SignUpDto>
    implements $SignUpDtoCopyWith<$Res> {
  _$SignUpDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? password = null,
    Object? businessName = null,
    Object? name = null,
    Object? openingDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      openingDate: null == openingDate
          ? _value.openingDate
          : openingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpDtoImplCopyWith<$Res>
    implements $SignUpDtoCopyWith<$Res> {
  factory _$$SignUpDtoImplCopyWith(
          _$SignUpDtoImpl value, $Res Function(_$SignUpDtoImpl) then) =
      __$$SignUpDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String password,
      String businessName,
      String name,
      DateTime openingDate});
}

/// @nodoc
class __$$SignUpDtoImplCopyWithImpl<$Res>
    extends _$SignUpDtoCopyWithImpl<$Res, _$SignUpDtoImpl>
    implements _$$SignUpDtoImplCopyWith<$Res> {
  __$$SignUpDtoImplCopyWithImpl(
      _$SignUpDtoImpl _value, $Res Function(_$SignUpDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? password = null,
    Object? businessName = null,
    Object? name = null,
    Object? openingDate = null,
  }) {
    return _then(_$SignUpDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      openingDate: null == openingDate
          ? _value.openingDate
          : openingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpDtoImpl implements _SignUpDto {
  const _$SignUpDtoImpl(
      {required this.id,
      required this.password,
      required this.businessName,
      required this.name,
      required this.openingDate});

  factory _$SignUpDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String password;
  @override
  final String businessName;
  @override
  final String name;
  @override
  final DateTime openingDate;

  @override
  String toString() {
    return 'SignUpDto(id: $id, password: $password, businessName: $businessName, name: $name, openingDate: $openingDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.openingDate, openingDate) ||
                other.openingDate == openingDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, password, businessName, name, openingDate);

  /// Create a copy of SignUpDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpDtoImplCopyWith<_$SignUpDtoImpl> get copyWith =>
      __$$SignUpDtoImplCopyWithImpl<_$SignUpDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpDtoImplToJson(
      this,
    );
  }
}

abstract class _SignUpDto implements SignUpDto {
  const factory _SignUpDto(
      {required final String id,
      required final String password,
      required final String businessName,
      required final String name,
      required final DateTime openingDate}) = _$SignUpDtoImpl;

  factory _SignUpDto.fromJson(Map<String, dynamic> json) =
      _$SignUpDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get password;
  @override
  String get businessName;
  @override
  String get name;
  @override
  DateTime get openingDate;

  /// Create a copy of SignUpDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpDtoImplCopyWith<_$SignUpDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
