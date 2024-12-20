// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../create_staff_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateStaffDto _$CreateStaffDtoFromJson(Map<String, dynamic> json) {
  return _CreateStaffDto.fromJson(json);
}

/// @nodoc
mixin _$CreateStaffDto {
  String get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<String>? get workDays => throw _privateConstructorUsedError;
  Map<String, Map<String, int>>? get workHours =>
      throw _privateConstructorUsedError;
  List<String>? get workDate => throw _privateConstructorUsedError;
  int? get templateId => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;

  /// Serializes this CreateStaffDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateStaffDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateStaffDtoCopyWith<CreateStaffDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateStaffDtoCopyWith<$Res> {
  factory $CreateStaffDtoCopyWith(
          CreateStaffDto value, $Res Function(CreateStaffDto) then) =
      _$CreateStaffDtoCopyWithImpl<$Res, CreateStaffDto>;
  @useResult
  $Res call(
      {String name,
      String? image,
      List<String>? workDays,
      Map<String, Map<String, int>>? workHours,
      List<String>? workDate,
      int? templateId,
      String? desc});
}

/// @nodoc
class _$CreateStaffDtoCopyWithImpl<$Res, $Val extends CreateStaffDto>
    implements $CreateStaffDtoCopyWith<$Res> {
  _$CreateStaffDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateStaffDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = freezed,
    Object? workDays = freezed,
    Object? workHours = freezed,
    Object? workDate = freezed,
    Object? templateId = freezed,
    Object? desc = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      workDays: freezed == workDays
          ? _value.workDays
          : workDays // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      workHours: freezed == workHours
          ? _value.workHours
          : workHours // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int>>?,
      workDate: freezed == workDate
          ? _value.workDate
          : workDate // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      templateId: freezed == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as int?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateStaffDtoImplCopyWith<$Res>
    implements $CreateStaffDtoCopyWith<$Res> {
  factory _$$CreateStaffDtoImplCopyWith(_$CreateStaffDtoImpl value,
          $Res Function(_$CreateStaffDtoImpl) then) =
      __$$CreateStaffDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? image,
      List<String>? workDays,
      Map<String, Map<String, int>>? workHours,
      List<String>? workDate,
      int? templateId,
      String? desc});
}

/// @nodoc
class __$$CreateStaffDtoImplCopyWithImpl<$Res>
    extends _$CreateStaffDtoCopyWithImpl<$Res, _$CreateStaffDtoImpl>
    implements _$$CreateStaffDtoImplCopyWith<$Res> {
  __$$CreateStaffDtoImplCopyWithImpl(
      _$CreateStaffDtoImpl _value, $Res Function(_$CreateStaffDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateStaffDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = freezed,
    Object? workDays = freezed,
    Object? workHours = freezed,
    Object? workDate = freezed,
    Object? templateId = freezed,
    Object? desc = freezed,
  }) {
    return _then(_$CreateStaffDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      workDays: freezed == workDays
          ? _value._workDays
          : workDays // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      workHours: freezed == workHours
          ? _value._workHours
          : workHours // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int>>?,
      workDate: freezed == workDate
          ? _value._workDate
          : workDate // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      templateId: freezed == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as int?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateStaffDtoImpl implements _CreateStaffDto {
  const _$CreateStaffDtoImpl(
      {required this.name,
      this.image,
      final List<String>? workDays,
      final Map<String, Map<String, int>>? workHours,
      final List<String>? workDate,
      this.templateId,
      this.desc})
      : _workDays = workDays,
        _workHours = workHours,
        _workDate = workDate;

  factory _$CreateStaffDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateStaffDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String? image;
  final List<String>? _workDays;
  @override
  List<String>? get workDays {
    final value = _workDays;
    if (value == null) return null;
    if (_workDays is EqualUnmodifiableListView) return _workDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, Map<String, int>>? _workHours;
  @override
  Map<String, Map<String, int>>? get workHours {
    final value = _workHours;
    if (value == null) return null;
    if (_workHours is EqualUnmodifiableMapView) return _workHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<String>? _workDate;
  @override
  List<String>? get workDate {
    final value = _workDate;
    if (value == null) return null;
    if (_workDate is EqualUnmodifiableListView) return _workDate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? templateId;
  @override
  final String? desc;

  @override
  String toString() {
    return 'CreateStaffDto(name: $name, image: $image, workDays: $workDays, workHours: $workHours, workDate: $workDate, templateId: $templateId, desc: $desc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateStaffDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._workDays, _workDays) &&
            const DeepCollectionEquality()
                .equals(other._workHours, _workHours) &&
            const DeepCollectionEquality().equals(other._workDate, _workDate) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.desc, desc) || other.desc == desc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      image,
      const DeepCollectionEquality().hash(_workDays),
      const DeepCollectionEquality().hash(_workHours),
      const DeepCollectionEquality().hash(_workDate),
      templateId,
      desc);

  /// Create a copy of CreateStaffDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateStaffDtoImplCopyWith<_$CreateStaffDtoImpl> get copyWith =>
      __$$CreateStaffDtoImplCopyWithImpl<_$CreateStaffDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateStaffDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateStaffDto implements CreateStaffDto {
  const factory _CreateStaffDto(
      {required final String name,
      final String? image,
      final List<String>? workDays,
      final Map<String, Map<String, int>>? workHours,
      final List<String>? workDate,
      final int? templateId,
      final String? desc}) = _$CreateStaffDtoImpl;

  factory _CreateStaffDto.fromJson(Map<String, dynamic> json) =
      _$CreateStaffDtoImpl.fromJson;

  @override
  String get name;
  @override
  String? get image;
  @override
  List<String>? get workDays;
  @override
  Map<String, Map<String, int>>? get workHours;
  @override
  List<String>? get workDate;
  @override
  int? get templateId;
  @override
  String? get desc;

  /// Create a copy of CreateStaffDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateStaffDtoImplCopyWith<_$CreateStaffDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
