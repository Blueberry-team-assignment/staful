// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleDto _$ScheduleDtoFromJson(Map<String, dynamic> json) {
  return _ScheduleDto.fromJson(json);
}

/// @nodoc
mixin _$ScheduleDto {
  String get staffId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  TimeRangeModel get workHours => throw _privateConstructorUsedError;

  /// Serializes this ScheduleDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleDtoCopyWith<ScheduleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleDtoCopyWith<$Res> {
  factory $ScheduleDtoCopyWith(
          ScheduleDto value, $Res Function(ScheduleDto) then) =
      _$ScheduleDtoCopyWithImpl<$Res, ScheduleDto>;
  @useResult
  $Res call({String staffId, DateTime date, TimeRangeModel workHours});

  $TimeRangeModelCopyWith<$Res> get workHours;
}

/// @nodoc
class _$ScheduleDtoCopyWithImpl<$Res, $Val extends ScheduleDto>
    implements $ScheduleDtoCopyWith<$Res> {
  _$ScheduleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
    Object? date = null,
    Object? workHours = null,
  }) {
    return _then(_value.copyWith(
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workHours: null == workHours
          ? _value.workHours
          : workHours // ignore: cast_nullable_to_non_nullable
              as TimeRangeModel,
    ) as $Val);
  }

  /// Create a copy of ScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeRangeModelCopyWith<$Res> get workHours {
    return $TimeRangeModelCopyWith<$Res>(_value.workHours, (value) {
      return _then(_value.copyWith(workHours: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScheduleDtoImplCopyWith<$Res>
    implements $ScheduleDtoCopyWith<$Res> {
  factory _$$ScheduleDtoImplCopyWith(
          _$ScheduleDtoImpl value, $Res Function(_$ScheduleDtoImpl) then) =
      __$$ScheduleDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String staffId, DateTime date, TimeRangeModel workHours});

  @override
  $TimeRangeModelCopyWith<$Res> get workHours;
}

/// @nodoc
class __$$ScheduleDtoImplCopyWithImpl<$Res>
    extends _$ScheduleDtoCopyWithImpl<$Res, _$ScheduleDtoImpl>
    implements _$$ScheduleDtoImplCopyWith<$Res> {
  __$$ScheduleDtoImplCopyWithImpl(
      _$ScheduleDtoImpl _value, $Res Function(_$ScheduleDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
    Object? date = null,
    Object? workHours = null,
  }) {
    return _then(_$ScheduleDtoImpl(
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workHours: null == workHours
          ? _value.workHours
          : workHours // ignore: cast_nullable_to_non_nullable
              as TimeRangeModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleDtoImpl implements _ScheduleDto {
  const _$ScheduleDtoImpl(
      {required this.staffId, required this.date, required this.workHours});

  factory _$ScheduleDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleDtoImplFromJson(json);

  @override
  final String staffId;
  @override
  final DateTime date;
  @override
  final TimeRangeModel workHours;

  @override
  String toString() {
    return 'ScheduleDto(staffId: $staffId, date: $date, workHours: $workHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleDtoImpl &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.workHours, workHours) ||
                other.workHours == workHours));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, staffId, date, workHours);

  /// Create a copy of ScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleDtoImplCopyWith<_$ScheduleDtoImpl> get copyWith =>
      __$$ScheduleDtoImplCopyWithImpl<_$ScheduleDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleDtoImplToJson(
      this,
    );
  }
}

abstract class _ScheduleDto implements ScheduleDto {
  const factory _ScheduleDto(
      {required final String staffId,
      required final DateTime date,
      required final TimeRangeModel workHours}) = _$ScheduleDtoImpl;

  factory _ScheduleDto.fromJson(Map<String, dynamic> json) =
      _$ScheduleDtoImpl.fromJson;

  @override
  String get staffId;
  @override
  DateTime get date;
  @override
  TimeRangeModel get workHours;

  /// Create a copy of ScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleDtoImplCopyWith<_$ScheduleDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
