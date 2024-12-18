// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../log_in_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LogInDto _$LogInDtoFromJson(Map<String, dynamic> json) {
  return _LogInDto.fromJson(json);
}

/// @nodoc
mixin _$LogInDto {
  String get id => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this LogInDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LogInDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LogInDtoCopyWith<LogInDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogInDtoCopyWith<$Res> {
  factory $LogInDtoCopyWith(LogInDto value, $Res Function(LogInDto) then) =
      _$LogInDtoCopyWithImpl<$Res, LogInDto>;
  @useResult
  $Res call({String id, String password});
}

/// @nodoc
class _$LogInDtoCopyWithImpl<$Res, $Val extends LogInDto>
    implements $LogInDtoCopyWith<$Res> {
  _$LogInDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LogInDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? password = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogInDtoImplCopyWith<$Res>
    implements $LogInDtoCopyWith<$Res> {
  factory _$$LogInDtoImplCopyWith(
          _$LogInDtoImpl value, $Res Function(_$LogInDtoImpl) then) =
      __$$LogInDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String password});
}

/// @nodoc
class __$$LogInDtoImplCopyWithImpl<$Res>
    extends _$LogInDtoCopyWithImpl<$Res, _$LogInDtoImpl>
    implements _$$LogInDtoImplCopyWith<$Res> {
  __$$LogInDtoImplCopyWithImpl(
      _$LogInDtoImpl _value, $Res Function(_$LogInDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LogInDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? password = null,
  }) {
    return _then(_$LogInDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogInDtoImpl implements _LogInDto {
  const _$LogInDtoImpl({required this.id, required this.password});

  factory _$LogInDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogInDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String password;

  @override
  String toString() {
    return 'LogInDto(id: $id, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogInDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, password);

  /// Create a copy of LogInDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogInDtoImplCopyWith<_$LogInDtoImpl> get copyWith =>
      __$$LogInDtoImplCopyWithImpl<_$LogInDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogInDtoImplToJson(
      this,
    );
  }
}

abstract class _LogInDto implements LogInDto {
  const factory _LogInDto(
      {required final String id,
      required final String password}) = _$LogInDtoImpl;

  factory _LogInDto.fromJson(Map<String, dynamic> json) =
      _$LogInDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get password;

  /// Create a copy of LogInDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogInDtoImplCopyWith<_$LogInDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
