// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payroll_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PayrollModel {
  String? get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError; // y,m
  String get staffId => throw _privateConstructorUsedError;
  String get templateId => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;

  /// Create a copy of PayrollModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PayrollModelCopyWith<PayrollModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayrollModelCopyWith<$Res> {
  factory $PayrollModelCopyWith(
          PayrollModel value, $Res Function(PayrollModel) then) =
      _$PayrollModelCopyWithImpl<$Res, PayrollModel>;
  @useResult
  $Res call(
      {String? id,
      DateTime date,
      String staffId,
      String templateId,
      bool isSelected,
      bool isVisible,
      bool isDeleted});
}

/// @nodoc
class _$PayrollModelCopyWithImpl<$Res, $Val extends PayrollModel>
    implements $PayrollModelCopyWith<$Res> {
  _$PayrollModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PayrollModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? staffId = null,
    Object? templateId = null,
    Object? isSelected = null,
    Object? isVisible = null,
    Object? isDeleted = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PayrollModelImplCopyWith<$Res>
    implements $PayrollModelCopyWith<$Res> {
  factory _$$PayrollModelImplCopyWith(
          _$PayrollModelImpl value, $Res Function(_$PayrollModelImpl) then) =
      __$$PayrollModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      DateTime date,
      String staffId,
      String templateId,
      bool isSelected,
      bool isVisible,
      bool isDeleted});
}

/// @nodoc
class __$$PayrollModelImplCopyWithImpl<$Res>
    extends _$PayrollModelCopyWithImpl<$Res, _$PayrollModelImpl>
    implements _$$PayrollModelImplCopyWith<$Res> {
  __$$PayrollModelImplCopyWithImpl(
      _$PayrollModelImpl _value, $Res Function(_$PayrollModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PayrollModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? staffId = null,
    Object? templateId = null,
    Object? isSelected = null,
    Object? isVisible = null,
    Object? isDeleted = null,
  }) {
    return _then(_$PayrollModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PayrollModelImpl implements _PayrollModel {
  const _$PayrollModelImpl(
      {this.id,
      required this.date,
      required this.staffId,
      required this.templateId,
      this.isSelected = false,
      this.isVisible = true,
      this.isDeleted = false});

  @override
  final String? id;
  @override
  final DateTime date;
// y,m
  @override
  final String staffId;
  @override
  final String templateId;
  @override
  @JsonKey()
  final bool isSelected;
  @override
  @JsonKey()
  final bool isVisible;
  @override
  @JsonKey()
  final bool isDeleted;

  @override
  String toString() {
    return 'PayrollModel(id: $id, date: $date, staffId: $staffId, templateId: $templateId, isSelected: $isSelected, isVisible: $isVisible, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayrollModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, date, staffId, templateId,
      isSelected, isVisible, isDeleted);

  /// Create a copy of PayrollModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PayrollModelImplCopyWith<_$PayrollModelImpl> get copyWith =>
      __$$PayrollModelImplCopyWithImpl<_$PayrollModelImpl>(this, _$identity);
}

abstract class _PayrollModel implements PayrollModel {
  const factory _PayrollModel(
      {final String? id,
      required final DateTime date,
      required final String staffId,
      required final String templateId,
      final bool isSelected,
      final bool isVisible,
      final bool isDeleted}) = _$PayrollModelImpl;

  @override
  String? get id;
  @override
  DateTime get date; // y,m
  @override
  String get staffId;
  @override
  String get templateId;
  @override
  bool get isSelected;
  @override
  bool get isVisible;
  @override
  bool get isDeleted;

  /// Create a copy of PayrollModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PayrollModelImplCopyWith<_$PayrollModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
