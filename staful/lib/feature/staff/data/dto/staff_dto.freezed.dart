// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StaffDto _$StaffDtoFromJson(Map<String, dynamic> json) {
  return _StaffDto.fromJson(json);
}

/// @nodoc
mixin _$StaffDto {
  String? get name => throw _privateConstructorUsedError;
  String? get templateId => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<String>? get workDays => throw _privateConstructorUsedError;
  TimeRangeModel? get workHours => throw _privateConstructorUsedError;
  List<ScheduleModel>? get workSchedules => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;

  /// Serializes this StaffDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StaffDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffDtoCopyWith<StaffDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffDtoCopyWith<$Res> {
  factory $StaffDtoCopyWith(StaffDto value, $Res Function(StaffDto) then) =
      _$StaffDtoCopyWithImpl<$Res, StaffDto>;
  @useResult
  $Res call(
      {String? name,
      String? templateId,
      String? image,
      List<String>? workDays,
      TimeRangeModel? workHours,
      List<ScheduleModel>? workSchedules,
      String? desc,
      bool? isDeleted});

  $TimeRangeModelCopyWith<$Res>? get workHours;
}

/// @nodoc
class _$StaffDtoCopyWithImpl<$Res, $Val extends StaffDto>
    implements $StaffDtoCopyWith<$Res> {
  _$StaffDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? templateId = freezed,
    Object? image = freezed,
    Object? workDays = freezed,
    Object? workHours = freezed,
    Object? workSchedules = freezed,
    Object? desc = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      templateId: freezed == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
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
              as TimeRangeModel?,
      workSchedules: freezed == workSchedules
          ? _value.workSchedules
          : workSchedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModel>?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of StaffDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeRangeModelCopyWith<$Res>? get workHours {
    if (_value.workHours == null) {
      return null;
    }

    return $TimeRangeModelCopyWith<$Res>(_value.workHours!, (value) {
      return _then(_value.copyWith(workHours: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StaffDtoImplCopyWith<$Res>
    implements $StaffDtoCopyWith<$Res> {
  factory _$$StaffDtoImplCopyWith(
          _$StaffDtoImpl value, $Res Function(_$StaffDtoImpl) then) =
      __$$StaffDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? templateId,
      String? image,
      List<String>? workDays,
      TimeRangeModel? workHours,
      List<ScheduleModel>? workSchedules,
      String? desc,
      bool? isDeleted});

  @override
  $TimeRangeModelCopyWith<$Res>? get workHours;
}

/// @nodoc
class __$$StaffDtoImplCopyWithImpl<$Res>
    extends _$StaffDtoCopyWithImpl<$Res, _$StaffDtoImpl>
    implements _$$StaffDtoImplCopyWith<$Res> {
  __$$StaffDtoImplCopyWithImpl(
      _$StaffDtoImpl _value, $Res Function(_$StaffDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? templateId = freezed,
    Object? image = freezed,
    Object? workDays = freezed,
    Object? workHours = freezed,
    Object? workSchedules = freezed,
    Object? desc = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_$StaffDtoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      templateId: freezed == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
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
          ? _value.workHours
          : workHours // ignore: cast_nullable_to_non_nullable
              as TimeRangeModel?,
      workSchedules: freezed == workSchedules
          ? _value._workSchedules
          : workSchedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModel>?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StaffDtoImpl implements _StaffDto {
  const _$StaffDtoImpl(
      {this.name,
      this.templateId,
      this.image,
      final List<String>? workDays,
      this.workHours,
      final List<ScheduleModel>? workSchedules,
      this.desc,
      this.isDeleted})
      : _workDays = workDays,
        _workSchedules = workSchedules;

  factory _$StaffDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaffDtoImplFromJson(json);

  @override
  final String? name;
  @override
  final String? templateId;
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

  @override
  final TimeRangeModel? workHours;
  final List<ScheduleModel>? _workSchedules;
  @override
  List<ScheduleModel>? get workSchedules {
    final value = _workSchedules;
    if (value == null) return null;
    if (_workSchedules is EqualUnmodifiableListView) return _workSchedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? desc;
  @override
  final bool? isDeleted;

  @override
  String toString() {
    return 'StaffDto(name: $name, templateId: $templateId, image: $image, workDays: $workDays, workHours: $workHours, workSchedules: $workSchedules, desc: $desc, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._workDays, _workDays) &&
            (identical(other.workHours, workHours) ||
                other.workHours == workHours) &&
            const DeepCollectionEquality()
                .equals(other._workSchedules, _workSchedules) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      templateId,
      image,
      const DeepCollectionEquality().hash(_workDays),
      workHours,
      const DeepCollectionEquality().hash(_workSchedules),
      desc,
      isDeleted);

  /// Create a copy of StaffDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffDtoImplCopyWith<_$StaffDtoImpl> get copyWith =>
      __$$StaffDtoImplCopyWithImpl<_$StaffDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaffDtoImplToJson(
      this,
    );
  }
}

abstract class _StaffDto implements StaffDto {
  const factory _StaffDto(
      {final String? name,
      final String? templateId,
      final String? image,
      final List<String>? workDays,
      final TimeRangeModel? workHours,
      final List<ScheduleModel>? workSchedules,
      final String? desc,
      final bool? isDeleted}) = _$StaffDtoImpl;

  factory _StaffDto.fromJson(Map<String, dynamic> json) =
      _$StaffDtoImpl.fromJson;

  @override
  String? get name;
  @override
  String? get templateId;
  @override
  String? get image;
  @override
  List<String>? get workDays;
  @override
  TimeRangeModel? get workHours;
  @override
  List<ScheduleModel>? get workSchedules;
  @override
  String? get desc;
  @override
  bool? get isDeleted;

  /// Create a copy of StaffDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffDtoImplCopyWith<_$StaffDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
