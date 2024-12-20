// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_template_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateTemplateDto _$CreateTemplateDtoFromJson(Map<String, dynamic> json) {
  return _CreateTemplateDto.fromJson(json);
}

/// @nodoc
mixin _$CreateTemplateDto {
  String get name => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get payDetails =>
      throw _privateConstructorUsedError;
  List<String>? get staffIds => throw _privateConstructorUsedError;

  /// Serializes this CreateTemplateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateTemplateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTemplateDtoCopyWith<CreateTemplateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTemplateDtoCopyWith<$Res> {
  factory $CreateTemplateDtoCopyWith(
          CreateTemplateDto value, $Res Function(CreateTemplateDto) then) =
      _$CreateTemplateDtoCopyWithImpl<$Res, CreateTemplateDto>;
  @useResult
  $Res call(
      {String name,
      List<Map<String, dynamic>> payDetails,
      List<String>? staffIds});
}

/// @nodoc
class _$CreateTemplateDtoCopyWithImpl<$Res, $Val extends CreateTemplateDto>
    implements $CreateTemplateDtoCopyWith<$Res> {
  _$CreateTemplateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateTemplateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? payDetails = null,
    Object? staffIds = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      payDetails: null == payDetails
          ? _value.payDetails
          : payDetails // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      staffIds: freezed == staffIds
          ? _value.staffIds
          : staffIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTemplateDtoImplCopyWith<$Res>
    implements $CreateTemplateDtoCopyWith<$Res> {
  factory _$$CreateTemplateDtoImplCopyWith(_$CreateTemplateDtoImpl value,
          $Res Function(_$CreateTemplateDtoImpl) then) =
      __$$CreateTemplateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<Map<String, dynamic>> payDetails,
      List<String>? staffIds});
}

/// @nodoc
class __$$CreateTemplateDtoImplCopyWithImpl<$Res>
    extends _$CreateTemplateDtoCopyWithImpl<$Res, _$CreateTemplateDtoImpl>
    implements _$$CreateTemplateDtoImplCopyWith<$Res> {
  __$$CreateTemplateDtoImplCopyWithImpl(_$CreateTemplateDtoImpl _value,
      $Res Function(_$CreateTemplateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateTemplateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? payDetails = null,
    Object? staffIds = freezed,
  }) {
    return _then(_$CreateTemplateDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      payDetails: null == payDetails
          ? _value._payDetails
          : payDetails // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      staffIds: freezed == staffIds
          ? _value._staffIds
          : staffIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTemplateDtoImpl implements _CreateTemplateDto {
  const _$CreateTemplateDtoImpl(
      {required this.name,
      required final List<Map<String, dynamic>> payDetails,
      final List<String>? staffIds})
      : _payDetails = payDetails,
        _staffIds = staffIds;

  factory _$CreateTemplateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTemplateDtoImplFromJson(json);

  @override
  final String name;
  final List<Map<String, dynamic>> _payDetails;
  @override
  List<Map<String, dynamic>> get payDetails {
    if (_payDetails is EqualUnmodifiableListView) return _payDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payDetails);
  }

  final List<String>? _staffIds;
  @override
  List<String>? get staffIds {
    final value = _staffIds;
    if (value == null) return null;
    if (_staffIds is EqualUnmodifiableListView) return _staffIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CreateTemplateDto(name: $name, payDetails: $payDetails, staffIds: $staffIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTemplateDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._payDetails, _payDetails) &&
            const DeepCollectionEquality().equals(other._staffIds, _staffIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_payDetails),
      const DeepCollectionEquality().hash(_staffIds));

  /// Create a copy of CreateTemplateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTemplateDtoImplCopyWith<_$CreateTemplateDtoImpl> get copyWith =>
      __$$CreateTemplateDtoImplCopyWithImpl<_$CreateTemplateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTemplateDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateTemplateDto implements CreateTemplateDto {
  const factory _CreateTemplateDto(
      {required final String name,
      required final List<Map<String, dynamic>> payDetails,
      final List<String>? staffIds}) = _$CreateTemplateDtoImpl;

  factory _CreateTemplateDto.fromJson(Map<String, dynamic> json) =
      _$CreateTemplateDtoImpl.fromJson;

  @override
  String get name;
  @override
  List<Map<String, dynamic>> get payDetails;
  @override
  List<String>? get staffIds;

  /// Create a copy of CreateTemplateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTemplateDtoImplCopyWith<_$CreateTemplateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
