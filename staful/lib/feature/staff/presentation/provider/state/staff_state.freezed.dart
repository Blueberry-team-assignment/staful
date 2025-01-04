// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StaffState {
  List<StaffModel> get list => throw _privateConstructorUsedError;
  List<StaffModel> get filteredList => throw _privateConstructorUsedError;
  StaffModel get selectedStaff => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of StaffState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffStateCopyWith<StaffState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffStateCopyWith<$Res> {
  factory $StaffStateCopyWith(
          StaffState value, $Res Function(StaffState) then) =
      _$StaffStateCopyWithImpl<$Res, StaffState>;
  @useResult
  $Res call(
      {List<StaffModel> list,
      List<StaffModel> filteredList,
      StaffModel selectedStaff,
      bool isLoading});

  $StaffModelCopyWith<$Res> get selectedStaff;
}

/// @nodoc
class _$StaffStateCopyWithImpl<$Res, $Val extends StaffState>
    implements $StaffStateCopyWith<$Res> {
  _$StaffStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? filteredList = null,
    Object? selectedStaff = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<StaffModel>,
      filteredList: null == filteredList
          ? _value.filteredList
          : filteredList // ignore: cast_nullable_to_non_nullable
              as List<StaffModel>,
      selectedStaff: null == selectedStaff
          ? _value.selectedStaff
          : selectedStaff // ignore: cast_nullable_to_non_nullable
              as StaffModel,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of StaffState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffModelCopyWith<$Res> get selectedStaff {
    return $StaffModelCopyWith<$Res>(_value.selectedStaff, (value) {
      return _then(_value.copyWith(selectedStaff: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StaffStateImplCopyWith<$Res>
    implements $StaffStateCopyWith<$Res> {
  factory _$$StaffStateImplCopyWith(
          _$StaffStateImpl value, $Res Function(_$StaffStateImpl) then) =
      __$$StaffStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<StaffModel> list,
      List<StaffModel> filteredList,
      StaffModel selectedStaff,
      bool isLoading});

  @override
  $StaffModelCopyWith<$Res> get selectedStaff;
}

/// @nodoc
class __$$StaffStateImplCopyWithImpl<$Res>
    extends _$StaffStateCopyWithImpl<$Res, _$StaffStateImpl>
    implements _$$StaffStateImplCopyWith<$Res> {
  __$$StaffStateImplCopyWithImpl(
      _$StaffStateImpl _value, $Res Function(_$StaffStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? filteredList = null,
    Object? selectedStaff = null,
    Object? isLoading = null,
  }) {
    return _then(_$StaffStateImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<StaffModel>,
      filteredList: null == filteredList
          ? _value._filteredList
          : filteredList // ignore: cast_nullable_to_non_nullable
              as List<StaffModel>,
      selectedStaff: null == selectedStaff
          ? _value.selectedStaff
          : selectedStaff // ignore: cast_nullable_to_non_nullable
              as StaffModel,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StaffStateImpl implements _StaffState {
  const _$StaffStateImpl(
      {final List<StaffModel> list = const [],
      final List<StaffModel> filteredList = const [],
      this.selectedStaff = const StaffModel(
          name: "",
          workHours: TimeRangeModel(
              start: TimeOfDay(hour: 9, minute: 0),
              end: TimeOfDay(hour: 18, minute: 0))),
      this.isLoading = false})
      : _list = list,
        _filteredList = filteredList;

  final List<StaffModel> _list;
  @override
  @JsonKey()
  List<StaffModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  final List<StaffModel> _filteredList;
  @override
  @JsonKey()
  List<StaffModel> get filteredList {
    if (_filteredList is EqualUnmodifiableListView) return _filteredList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredList);
  }

  @override
  @JsonKey()
  final StaffModel selectedStaff;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'StaffState(list: $list, filteredList: $filteredList, selectedStaff: $selectedStaff, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffStateImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            const DeepCollectionEquality()
                .equals(other._filteredList, _filteredList) &&
            (identical(other.selectedStaff, selectedStaff) ||
                other.selectedStaff == selectedStaff) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_list),
      const DeepCollectionEquality().hash(_filteredList),
      selectedStaff,
      isLoading);

  /// Create a copy of StaffState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffStateImplCopyWith<_$StaffStateImpl> get copyWith =>
      __$$StaffStateImplCopyWithImpl<_$StaffStateImpl>(this, _$identity);
}

abstract class _StaffState implements StaffState {
  const factory _StaffState(
      {final List<StaffModel> list,
      final List<StaffModel> filteredList,
      final StaffModel selectedStaff,
      final bool isLoading}) = _$StaffStateImpl;

  @override
  List<StaffModel> get list;
  @override
  List<StaffModel> get filteredList;
  @override
  StaffModel get selectedStaff;
  @override
  bool get isLoading;

  /// Create a copy of StaffState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffStateImplCopyWith<_$StaffStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
