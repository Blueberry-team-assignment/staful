// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pay_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PayDetailModel _$PayDetailModelFromJson(Map<String, dynamic> json) {
  return _PayDetailModel.fromJson(json);
}

/// @nodoc
mixin _$PayDetailModel {
  String? get id => throw _privateConstructorUsedError;
  PayType get payType => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String? get templateId => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;

  /// Serializes this PayDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PayDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PayDetailModelCopyWith<PayDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayDetailModelCopyWith<$Res> {
  factory $PayDetailModelCopyWith(
          PayDetailModel value, $Res Function(PayDetailModel) then) =
      _$PayDetailModelCopyWithImpl<$Res, PayDetailModel>;
  @useResult
  $Res call(
      {String? id,
      PayType payType,
      String desc,
      int amount,
      String? templateId,
      bool isSelected,
      bool isVisible,
      bool isDeleted});
}

/// @nodoc
class _$PayDetailModelCopyWithImpl<$Res, $Val extends PayDetailModel>
    implements $PayDetailModelCopyWith<$Res> {
  _$PayDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PayDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? payType = null,
    Object? desc = null,
    Object? amount = null,
    Object? templateId = freezed,
    Object? isSelected = null,
    Object? isVisible = null,
    Object? isDeleted = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      payType: null == payType
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as PayType,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      templateId: freezed == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc
abstract class _$$PayDetailModelImplCopyWith<$Res>
    implements $PayDetailModelCopyWith<$Res> {
  factory _$$PayDetailModelImplCopyWith(_$PayDetailModelImpl value,
          $Res Function(_$PayDetailModelImpl) then) =
      __$$PayDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      PayType payType,
      String desc,
      int amount,
      String? templateId,
      bool isSelected,
      bool isVisible,
      bool isDeleted});
}

/// @nodoc
class __$$PayDetailModelImplCopyWithImpl<$Res>
    extends _$PayDetailModelCopyWithImpl<$Res, _$PayDetailModelImpl>
    implements _$$PayDetailModelImplCopyWith<$Res> {
  __$$PayDetailModelImplCopyWithImpl(
      _$PayDetailModelImpl _value, $Res Function(_$PayDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PayDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? payType = null,
    Object? desc = null,
    Object? amount = null,
    Object? templateId = freezed,
    Object? isSelected = null,
    Object? isVisible = null,
    Object? isDeleted = null,
  }) {
    return _then(_$PayDetailModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      payType: null == payType
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as PayType,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      templateId: freezed == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
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
class _$PayDetailModelImpl implements _PayDetailModel {
  const _$PayDetailModelImpl(
      {this.id,
      required this.payType,
      required this.desc,
      required this.amount,
      this.templateId,
      this.isSelected = false,
      this.isVisible = true,
      this.isDeleted = false});

  factory _$PayDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PayDetailModelImplFromJson(json);

  @override
  final String? id;
  @override
  final PayType payType;
  @override
  final String desc;
  @override
  final int amount;
  @override
  final String? templateId;
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
    return 'PayDetailModel(id: $id, payType: $payType, desc: $desc, amount: $amount, templateId: $templateId, isSelected: $isSelected, isVisible: $isVisible, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.payType, payType) || other.payType == payType) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, payType, desc, amount,
      templateId, isSelected, isVisible, isDeleted);

  /// Create a copy of PayDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PayDetailModelImplCopyWith<_$PayDetailModelImpl> get copyWith =>
      __$$PayDetailModelImplCopyWithImpl<_$PayDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PayDetailModelImplToJson(
      this,
    );
  }
}

abstract class _PayDetailModel implements PayDetailModel {
  const factory _PayDetailModel(
      {final String? id,
      required final PayType payType,
      required final String desc,
      required final int amount,
      final String? templateId,
      final bool isSelected,
      final bool isVisible,
      final bool isDeleted}) = _$PayDetailModelImpl;

  factory _PayDetailModel.fromJson(Map<String, dynamic> json) =
      _$PayDetailModelImpl.fromJson;

  @override
  String? get id;
  @override
  PayType get payType;
  @override
  String get desc;
  @override
  int get amount;
  @override
  String? get templateId;
  @override
  bool get isSelected;
  @override
  bool get isVisible;
  @override
  bool get isDeleted;

  /// Create a copy of PayDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PayDetailModelImplCopyWith<_$PayDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
