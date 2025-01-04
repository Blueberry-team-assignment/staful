// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_range_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimeRangeModel {
  @TimeOfDayConverter()
  TimeOfDay get startTime => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay get endTime => throw _privateConstructorUsedError;

  /// Create a copy of TimeRangeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeRangeModelCopyWith<TimeRangeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeRangeModelCopyWith<$Res> {
  factory $TimeRangeModelCopyWith(
          TimeRangeModel value, $Res Function(TimeRangeModel) then) =
      _$TimeRangeModelCopyWithImpl<$Res, TimeRangeModel>;
  @useResult
  $Res call(
      {@TimeOfDayConverter() TimeOfDay startTime,
      @TimeOfDayConverter() TimeOfDay endTime});
}

/// @nodoc
class _$TimeRangeModelCopyWithImpl<$Res, $Val extends TimeRangeModel>
    implements $TimeRangeModelCopyWith<$Res> {
  _$TimeRangeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeRangeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_value.copyWith(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeRangeModelImplCopyWith<$Res>
    implements $TimeRangeModelCopyWith<$Res> {
  factory _$$TimeRangeModelImplCopyWith(_$TimeRangeModelImpl value,
          $Res Function(_$TimeRangeModelImpl) then) =
      __$$TimeRangeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimeOfDayConverter() TimeOfDay startTime,
      @TimeOfDayConverter() TimeOfDay endTime});
}

/// @nodoc
class __$$TimeRangeModelImplCopyWithImpl<$Res>
    extends _$TimeRangeModelCopyWithImpl<$Res, _$TimeRangeModelImpl>
    implements _$$TimeRangeModelImplCopyWith<$Res> {
  __$$TimeRangeModelImplCopyWithImpl(
      _$TimeRangeModelImpl _value, $Res Function(_$TimeRangeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeRangeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_$TimeRangeModelImpl(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ));
  }
}

/// @nodoc

class _$TimeRangeModelImpl implements _TimeRangeModel {
  const _$TimeRangeModelImpl(
      {@TimeOfDayConverter() required this.startTime,
      @TimeOfDayConverter() required this.endTime});

  @override
  @TimeOfDayConverter()
  final TimeOfDay startTime;
  @override
  @TimeOfDayConverter()
  final TimeOfDay endTime;

  @override
  String toString() {
    return 'TimeRangeModel(startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeRangeModelImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startTime, endTime);

  /// Create a copy of TimeRangeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeRangeModelImplCopyWith<_$TimeRangeModelImpl> get copyWith =>
      __$$TimeRangeModelImplCopyWithImpl<_$TimeRangeModelImpl>(
          this, _$identity);
}

abstract class _TimeRangeModel implements TimeRangeModel {
  const factory _TimeRangeModel(
          {@TimeOfDayConverter() required final TimeOfDay startTime,
          @TimeOfDayConverter() required final TimeOfDay endTime}) =
      _$TimeRangeModelImpl;

  @override
  @TimeOfDayConverter()
  TimeOfDay get startTime;
  @override
  @TimeOfDayConverter()
  TimeOfDay get endTime;

  /// Create a copy of TimeRangeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeRangeModelImplCopyWith<_$TimeRangeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
