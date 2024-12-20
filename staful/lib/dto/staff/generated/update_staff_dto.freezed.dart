// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../update_staff_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateStaffDto _$UpdateStaffDtoFromJson(Map<String, dynamic> json) {
  return _UpdateStaffDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateStaffDto {
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<String>? get workDays => throw _privateConstructorUsedError;
  Map<String, Map<String, int>>? get workHours =>
      throw _privateConstructorUsedError;
  List<String>? get workDate => throw _privateConstructorUsedError;
  int? get templateId => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  String get staffId => throw _privateConstructorUsedError;

  /// Serializes this UpdateStaffDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateStaffDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateStaffDtoCopyWith<UpdateStaffDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateStaffDtoCopyWith<$Res> {
  factory $UpdateStaffDtoCopyWith(
          UpdateStaffDto value, $Res Function(UpdateStaffDto) then) =
      _$UpdateStaffDtoCopyWithImpl<$Res, UpdateStaffDto>;
  @useResult
  $Res call(
      {String? name,
      String? image,
      List<String>? workDays,
      Map<String, Map<String, int>>? workHours,
      List<String>? workDate,
      int? templateId,
      String? desc,
      String staffId});
}

/// @nodoc
class _$UpdateStaffDtoCopyWithImpl<$Res, $Val extends UpdateStaffDto>
    implements $UpdateStaffDtoCopyWith<$Res> {
  _$UpdateStaffDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateStaffDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? image = freezed,
    Object? workDays = freezed,
    Object? workHours = freezed,
    Object? workDate = freezed,
    Object? templateId = freezed,
    Object? desc = freezed,
    Object? staffId = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
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
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateStaffDtoImplCopyWith<$Res>
    implements $UpdateStaffDtoCopyWith<$Res> {
  factory _$$UpdateStaffDtoImplCopyWith(_$UpdateStaffDtoImpl value,
          $Res Function(_$UpdateStaffDtoImpl) then) =
      __$$UpdateStaffDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? image,
      List<String>? workDays,
      Map<String, Map<String, int>>? workHours,
      List<String>? workDate,
      int? templateId,
      String? desc,
      String staffId});
}

/// @nodoc
class __$$UpdateStaffDtoImplCopyWithImpl<$Res>
    extends _$UpdateStaffDtoCopyWithImpl<$Res, _$UpdateStaffDtoImpl>
    implements _$$UpdateStaffDtoImplCopyWith<$Res> {
  __$$UpdateStaffDtoImplCopyWithImpl(
      _$UpdateStaffDtoImpl _value, $Res Function(_$UpdateStaffDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateStaffDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? image = freezed,
    Object? workDays = freezed,
    Object? workHours = freezed,
    Object? workDate = freezed,
    Object? templateId = freezed,
    Object? desc = freezed,
    Object? staffId = null,
  }) {
    return _then(_$UpdateStaffDtoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
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
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateStaffDtoImpl implements _UpdateStaffDto {
  const _$UpdateStaffDtoImpl(
      {this.name,
      this.image,
      final List<String>? workDays,
      final Map<String, Map<String, int>>? workHours,
      final List<String>? workDate,
      this.templateId,
      this.desc,
      required this.staffId})
      : _workDays = workDays,
        _workHours = workHours,
        _workDate = workDate;

  factory _$UpdateStaffDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateStaffDtoImplFromJson(json);

  @override
  final String? name;
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
  final String staffId;

  @override
  String toString() {
    return 'UpdateStaffDto(name: $name, image: $image, workDays: $workDays, workHours: $workHours, workDate: $workDate, templateId: $templateId, desc: $desc, staffId: $staffId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStaffDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._workDays, _workDays) &&
            const DeepCollectionEquality()
                .equals(other._workHours, _workHours) &&
            const DeepCollectionEquality().equals(other._workDate, _workDate) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.staffId, staffId) || other.staffId == staffId));
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
      desc,
      staffId);

  /// Create a copy of UpdateStaffDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateStaffDtoImplCopyWith<_$UpdateStaffDtoImpl> get copyWith =>
      __$$UpdateStaffDtoImplCopyWithImpl<_$UpdateStaffDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateStaffDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateStaffDto implements UpdateStaffDto {
  const factory _UpdateStaffDto(
      {final String? name,
      final String? image,
      final List<String>? workDays,
      final Map<String, Map<String, int>>? workHours,
      final List<String>? workDate,
      final int? templateId,
      final String? desc,
      required final String staffId}) = _$UpdateStaffDtoImpl;

  factory _UpdateStaffDto.fromJson(Map<String, dynamic> json) =
      _$UpdateStaffDtoImpl.fromJson;

  @override
  String? get name;
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
  @override
  String get staffId;

  /// Create a copy of UpdateStaffDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateStaffDtoImplCopyWith<_$UpdateStaffDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
