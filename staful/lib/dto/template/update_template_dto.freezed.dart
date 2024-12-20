// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_template_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateTemplateDto _$UpdateTemplateDtoFromJson(Map<String, dynamic> json) {
  return _UpdateTemplateDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateTemplateDto {
  String? get name => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get payDetails =>
      throw _privateConstructorUsedError;
  List<String>? get staffIds => throw _privateConstructorUsedError;
  String get templateId => throw _privateConstructorUsedError;

  /// Serializes this UpdateTemplateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateTemplateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateTemplateDtoCopyWith<UpdateTemplateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTemplateDtoCopyWith<$Res> {
  factory $UpdateTemplateDtoCopyWith(
          UpdateTemplateDto value, $Res Function(UpdateTemplateDto) then) =
      _$UpdateTemplateDtoCopyWithImpl<$Res, UpdateTemplateDto>;
  @useResult
  $Res call(
      {String? name,
      List<Map<String, dynamic>>? payDetails,
      List<String>? staffIds,
      String templateId});
}

/// @nodoc
class _$UpdateTemplateDtoCopyWithImpl<$Res, $Val extends UpdateTemplateDto>
    implements $UpdateTemplateDtoCopyWith<$Res> {
  _$UpdateTemplateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateTemplateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? payDetails = freezed,
    Object? staffIds = freezed,
    Object? templateId = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      payDetails: freezed == payDetails
          ? _value.payDetails
          : payDetails // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      staffIds: freezed == staffIds
          ? _value.staffIds
          : staffIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateTemplateDtoImplCopyWith<$Res>
    implements $UpdateTemplateDtoCopyWith<$Res> {
  factory _$$UpdateTemplateDtoImplCopyWith(_$UpdateTemplateDtoImpl value,
          $Res Function(_$UpdateTemplateDtoImpl) then) =
      __$$UpdateTemplateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      List<Map<String, dynamic>>? payDetails,
      List<String>? staffIds,
      String templateId});
}

/// @nodoc
class __$$UpdateTemplateDtoImplCopyWithImpl<$Res>
    extends _$UpdateTemplateDtoCopyWithImpl<$Res, _$UpdateTemplateDtoImpl>
    implements _$$UpdateTemplateDtoImplCopyWith<$Res> {
  __$$UpdateTemplateDtoImplCopyWithImpl(_$UpdateTemplateDtoImpl _value,
      $Res Function(_$UpdateTemplateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateTemplateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? payDetails = freezed,
    Object? staffIds = freezed,
    Object? templateId = null,
  }) {
    return _then(_$UpdateTemplateDtoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      payDetails: freezed == payDetails
          ? _value._payDetails
          : payDetails // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      staffIds: freezed == staffIds
          ? _value._staffIds
          : staffIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateTemplateDtoImpl implements _UpdateTemplateDto {
  const _$UpdateTemplateDtoImpl(
      {this.name,
      final List<Map<String, dynamic>>? payDetails,
      final List<String>? staffIds,
      required this.templateId})
      : _payDetails = payDetails,
        _staffIds = staffIds;

  factory _$UpdateTemplateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateTemplateDtoImplFromJson(json);

  @override
  final String? name;
  final List<Map<String, dynamic>>? _payDetails;
  @override
  List<Map<String, dynamic>>? get payDetails {
    final value = _payDetails;
    if (value == null) return null;
    if (_payDetails is EqualUnmodifiableListView) return _payDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
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
  final String templateId;

  @override
  String toString() {
    return 'UpdateTemplateDto(name: $name, payDetails: $payDetails, staffIds: $staffIds, templateId: $templateId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTemplateDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._payDetails, _payDetails) &&
            const DeepCollectionEquality().equals(other._staffIds, _staffIds) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_payDetails),
      const DeepCollectionEquality().hash(_staffIds),
      templateId);

  /// Create a copy of UpdateTemplateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTemplateDtoImplCopyWith<_$UpdateTemplateDtoImpl> get copyWith =>
      __$$UpdateTemplateDtoImplCopyWithImpl<_$UpdateTemplateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateTemplateDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateTemplateDto implements UpdateTemplateDto {
  const factory _UpdateTemplateDto(
      {final String? name,
      final List<Map<String, dynamic>>? payDetails,
      final List<String>? staffIds,
      required final String templateId}) = _$UpdateTemplateDtoImpl;

  factory _UpdateTemplateDto.fromJson(Map<String, dynamic> json) =
      _$UpdateTemplateDtoImpl.fromJson;

  @override
  String? get name;
  @override
  List<Map<String, dynamic>>? get payDetails;
  @override
  List<String>? get staffIds;
  @override
  String get templateId;

  /// Create a copy of UpdateTemplateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTemplateDtoImplCopyWith<_$UpdateTemplateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
