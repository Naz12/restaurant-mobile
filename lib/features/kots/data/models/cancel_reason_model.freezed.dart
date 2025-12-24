// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancel_reason_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CancelReasonModel _$CancelReasonModelFromJson(Map<String, dynamic> json) {
  return _CancelReasonModel.fromJson(json);
}

/// @nodoc
mixin _$CancelReasonModel {
  int get id => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;

  /// Serializes this CancelReasonModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CancelReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CancelReasonModelCopyWith<CancelReasonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelReasonModelCopyWith<$Res> {
  factory $CancelReasonModelCopyWith(
          CancelReasonModel value, $Res Function(CancelReasonModel) then) =
      _$CancelReasonModelCopyWithImpl<$Res, CancelReasonModel>;
  @useResult
  $Res call({int id, String reason});
}

/// @nodoc
class _$CancelReasonModelCopyWithImpl<$Res, $Val extends CancelReasonModel>
    implements $CancelReasonModelCopyWith<$Res> {
  _$CancelReasonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CancelReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CancelReasonModelImplCopyWith<$Res>
    implements $CancelReasonModelCopyWith<$Res> {
  factory _$$CancelReasonModelImplCopyWith(_$CancelReasonModelImpl value,
          $Res Function(_$CancelReasonModelImpl) then) =
      __$$CancelReasonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String reason});
}

/// @nodoc
class __$$CancelReasonModelImplCopyWithImpl<$Res>
    extends _$CancelReasonModelCopyWithImpl<$Res, _$CancelReasonModelImpl>
    implements _$$CancelReasonModelImplCopyWith<$Res> {
  __$$CancelReasonModelImplCopyWithImpl(_$CancelReasonModelImpl _value,
      $Res Function(_$CancelReasonModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CancelReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reason = null,
  }) {
    return _then(_$CancelReasonModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CancelReasonModelImpl implements _CancelReasonModel {
  const _$CancelReasonModelImpl({required this.id, required this.reason});

  factory _$CancelReasonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelReasonModelImplFromJson(json);

  @override
  final int id;
  @override
  final String reason;

  @override
  String toString() {
    return 'CancelReasonModel(id: $id, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelReasonModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, reason);

  /// Create a copy of CancelReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelReasonModelImplCopyWith<_$CancelReasonModelImpl> get copyWith =>
      __$$CancelReasonModelImplCopyWithImpl<_$CancelReasonModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelReasonModelImplToJson(
      this,
    );
  }
}

abstract class _CancelReasonModel implements CancelReasonModel {
  const factory _CancelReasonModel(
      {required final int id,
      required final String reason}) = _$CancelReasonModelImpl;

  factory _CancelReasonModel.fromJson(Map<String, dynamic> json) =
      _$CancelReasonModelImpl.fromJson;

  @override
  int get id;
  @override
  String get reason;

  /// Create a copy of CancelReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelReasonModelImplCopyWith<_$CancelReasonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
