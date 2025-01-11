// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TemplateState {
  List<TemplateModel> get list => throw _privateConstructorUsedError;
  List<TemplateModel> get filteredList => throw _privateConstructorUsedError;
  TemplateModel? get selectedTemplate => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of TemplateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TemplateStateCopyWith<TemplateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateStateCopyWith<$Res> {
  factory $TemplateStateCopyWith(
          TemplateState value, $Res Function(TemplateState) then) =
      _$TemplateStateCopyWithImpl<$Res, TemplateState>;
  @useResult
  $Res call(
      {List<TemplateModel> list,
      List<TemplateModel> filteredList,
      TemplateModel? selectedTemplate,
      bool isLoading});

  $TemplateModelCopyWith<$Res>? get selectedTemplate;
}

/// @nodoc
class _$TemplateStateCopyWithImpl<$Res, $Val extends TemplateState>
    implements $TemplateStateCopyWith<$Res> {
  _$TemplateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TemplateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? filteredList = null,
    Object? selectedTemplate = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TemplateModel>,
      filteredList: null == filteredList
          ? _value.filteredList
          : filteredList // ignore: cast_nullable_to_non_nullable
              as List<TemplateModel>,
      selectedTemplate: freezed == selectedTemplate
          ? _value.selectedTemplate
          : selectedTemplate // ignore: cast_nullable_to_non_nullable
              as TemplateModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of TemplateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TemplateModelCopyWith<$Res>? get selectedTemplate {
    if (_value.selectedTemplate == null) {
      return null;
    }

    return $TemplateModelCopyWith<$Res>(_value.selectedTemplate!, (value) {
      return _then(_value.copyWith(selectedTemplate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TemplateStateImplCopyWith<$Res>
    implements $TemplateStateCopyWith<$Res> {
  factory _$$TemplateStateImplCopyWith(
          _$TemplateStateImpl value, $Res Function(_$TemplateStateImpl) then) =
      __$$TemplateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TemplateModel> list,
      List<TemplateModel> filteredList,
      TemplateModel? selectedTemplate,
      bool isLoading});

  @override
  $TemplateModelCopyWith<$Res>? get selectedTemplate;
}

/// @nodoc
class __$$TemplateStateImplCopyWithImpl<$Res>
    extends _$TemplateStateCopyWithImpl<$Res, _$TemplateStateImpl>
    implements _$$TemplateStateImplCopyWith<$Res> {
  __$$TemplateStateImplCopyWithImpl(
      _$TemplateStateImpl _value, $Res Function(_$TemplateStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TemplateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? filteredList = null,
    Object? selectedTemplate = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$TemplateStateImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TemplateModel>,
      filteredList: null == filteredList
          ? _value._filteredList
          : filteredList // ignore: cast_nullable_to_non_nullable
              as List<TemplateModel>,
      selectedTemplate: freezed == selectedTemplate
          ? _value.selectedTemplate
          : selectedTemplate // ignore: cast_nullable_to_non_nullable
              as TemplateModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TemplateStateImpl implements _TemplateState {
  const _$TemplateStateImpl(
      {final List<TemplateModel> list = const [],
      final List<TemplateModel> filteredList = const [],
      this.selectedTemplate,
      this.isLoading = false})
      : _list = list,
        _filteredList = filteredList;

  final List<TemplateModel> _list;
  @override
  @JsonKey()
  List<TemplateModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  final List<TemplateModel> _filteredList;
  @override
  @JsonKey()
  List<TemplateModel> get filteredList {
    if (_filteredList is EqualUnmodifiableListView) return _filteredList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredList);
  }

  @override
  final TemplateModel? selectedTemplate;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'TemplateState(list: $list, filteredList: $filteredList, selectedTemplate: $selectedTemplate, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateStateImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            const DeepCollectionEquality()
                .equals(other._filteredList, _filteredList) &&
            (identical(other.selectedTemplate, selectedTemplate) ||
                other.selectedTemplate == selectedTemplate) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_list),
      const DeepCollectionEquality().hash(_filteredList),
      selectedTemplate,
      isLoading);

  /// Create a copy of TemplateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateStateImplCopyWith<_$TemplateStateImpl> get copyWith =>
      __$$TemplateStateImplCopyWithImpl<_$TemplateStateImpl>(this, _$identity);
}

abstract class _TemplateState implements TemplateState {
  const factory _TemplateState(
      {final List<TemplateModel> list,
      final List<TemplateModel> filteredList,
      final TemplateModel? selectedTemplate,
      final bool isLoading}) = _$TemplateStateImpl;

  @override
  List<TemplateModel> get list;
  @override
  List<TemplateModel> get filteredList;
  @override
  TemplateModel? get selectedTemplate;
  @override
  bool get isLoading;

  /// Create a copy of TemplateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TemplateStateImplCopyWith<_$TemplateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
