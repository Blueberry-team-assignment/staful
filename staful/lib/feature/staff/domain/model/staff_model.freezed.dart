// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StaffModel _$StaffModelFromJson(Map<String, dynamic> json) {
  return _StaffModel.fromJson(json);
}

/// @nodoc
mixin _$StaffModel {
  String? get id => throw _privateConstructorUsedError;
  String? get templateId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<String> get workDays => throw _privateConstructorUsedError;
  TimeRangeModel get workHours => throw _privateConstructorUsedError;
  List<ScheduleModel> get workSchedules => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;

  /// Serializes this StaffModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StaffModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffModelCopyWith<StaffModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffModelCopyWith<$Res> {
  factory $StaffModelCopyWith(
          StaffModel value, $Res Function(StaffModel) then) =
      _$StaffModelCopyWithImpl<$Res, StaffModel>;
  @useResult
  $Res call(
      {String? id,
      String? templateId,
      String name,
      String? image,
      List<String> workDays,
      TimeRangeModel workHours,
      List<ScheduleModel> workSchedules,
      String? desc,
      bool isSelected,
      bool isVisible,
      bool isDeleted});

  $TimeRangeModelCopyWith<$Res> get workHours;
}

/// @nodoc
class _$StaffModelCopyWithImpl<$Res, $Val extends StaffModel>
    implements $StaffModelCopyWith<$Res> {
  _$StaffModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? templateId = freezed,
    Object? name = null,
    Object? image = freezed,
    Object? workDays = null,
    Object? workHours = null,
    Object? workSchedules = null,
    Object? desc = freezed,
    Object? isSelected = null,
    Object? isVisible = null,
    Object? isDeleted = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      templateId: freezed == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      workDays: null == workDays
          ? _value.workDays
          : workDays // ignore: cast_nullable_to_non_nullable
              as List<String>,
      workHours: null == workHours
          ? _value.workHours
          : workHours // ignore: cast_nullable_to_non_nullable
              as TimeRangeModel,
      workSchedules: null == workSchedules
          ? _value.workSchedules
          : workSchedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModel>,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
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

  /// Create a copy of StaffModel
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
abstract class _$$StaffModelImplCopyWith<$Res>
    implements $StaffModelCopyWith<$Res> {
  factory _$$StaffModelImplCopyWith(
          _$StaffModelImpl value, $Res Function(_$StaffModelImpl) then) =
      __$$StaffModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? templateId,
      String name,
      String? image,
      List<String> workDays,
      TimeRangeModel workHours,
      List<ScheduleModel> workSchedules,
      String? desc,
      bool isSelected,
      bool isVisible,
      bool isDeleted});

  @override
  $TimeRangeModelCopyWith<$Res> get workHours;
}

/// @nodoc
class __$$StaffModelImplCopyWithImpl<$Res>
    extends _$StaffModelCopyWithImpl<$Res, _$StaffModelImpl>
    implements _$$StaffModelImplCopyWith<$Res> {
  __$$StaffModelImplCopyWithImpl(
      _$StaffModelImpl _value, $Res Function(_$StaffModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? templateId = freezed,
    Object? name = null,
    Object? image = freezed,
    Object? workDays = null,
    Object? workHours = null,
    Object? workSchedules = null,
    Object? desc = freezed,
    Object? isSelected = null,
    Object? isVisible = null,
    Object? isDeleted = null,
  }) {
    return _then(_$StaffModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      templateId: freezed == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      workDays: null == workDays
          ? _value._workDays
          : workDays // ignore: cast_nullable_to_non_nullable
              as List<String>,
      workHours: null == workHours
          ? _value.workHours
          : workHours // ignore: cast_nullable_to_non_nullable
              as TimeRangeModel,
      workSchedules: null == workSchedules
          ? _value._workSchedules
          : workSchedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModel>,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
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
@JsonSerializable()
class _$StaffModelImpl implements _StaffModel {
  const _$StaffModelImpl(
      {this.id,
      this.templateId,
      required this.name,
      this.image,
      final List<String> workDays = const [],
      required this.workHours,
      final List<ScheduleModel> workSchedules = const [],
      this.desc,
      this.isSelected = false,
      this.isVisible = true,
      this.isDeleted = false})
      : _workDays = workDays,
        _workSchedules = workSchedules;

  factory _$StaffModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaffModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? templateId;
  @override
  final String name;
  @override
  final String? image;
  final List<String> _workDays;
  @override
  @JsonKey()
  List<String> get workDays {
    if (_workDays is EqualUnmodifiableListView) return _workDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workDays);
  }

  @override
  final TimeRangeModel workHours;
  final List<ScheduleModel> _workSchedules;
  @override
  @JsonKey()
  List<ScheduleModel> get workSchedules {
    if (_workSchedules is EqualUnmodifiableListView) return _workSchedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workSchedules);
  }

  @override
  final String? desc;
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
    return 'StaffModel(id: $id, templateId: $templateId, name: $name, image: $image, workDays: $workDays, workHours: $workHours, workSchedules: $workSchedules, desc: $desc, isSelected: $isSelected, isVisible: $isVisible, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._workDays, _workDays) &&
            (identical(other.workHours, workHours) ||
                other.workHours == workHours) &&
            const DeepCollectionEquality()
                .equals(other._workSchedules, _workSchedules) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      templateId,
      name,
      image,
      const DeepCollectionEquality().hash(_workDays),
      workHours,
      const DeepCollectionEquality().hash(_workSchedules),
      desc,
      isSelected,
      isVisible,
      isDeleted);

  /// Create a copy of StaffModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffModelImplCopyWith<_$StaffModelImpl> get copyWith =>
      __$$StaffModelImplCopyWithImpl<_$StaffModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaffModelImplToJson(
      this,
    );
  }
}

abstract class _StaffModel implements StaffModel {
  const factory _StaffModel(
      {final String? id,
      final String? templateId,
      required final String name,
      final String? image,
      final List<String> workDays,
      required final TimeRangeModel workHours,
      final List<ScheduleModel> workSchedules,
      final String? desc,
      final bool isSelected,
      final bool isVisible,
      final bool isDeleted}) = _$StaffModelImpl;

  factory _StaffModel.fromJson(Map<String, dynamic> json) =
      _$StaffModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get templateId;
  @override
  String get name;
  @override
  String? get image;
  @override
  List<String> get workDays;
  @override
  TimeRangeModel get workHours;
  @override
  List<ScheduleModel> get workSchedules;
  @override
  String? get desc;
  @override
  bool get isSelected;
  @override
  bool get isVisible;
  @override
  bool get isDeleted;

  /// Create a copy of StaffModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffModelImplCopyWith<_$StaffModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
