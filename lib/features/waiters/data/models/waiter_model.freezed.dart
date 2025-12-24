// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'waiter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WaiterModel _$WaiterModelFromJson(Map<String, dynamic> json) {
  return _WaiterModel.fromJson(json);
}

/// @nodoc
mixin _$WaiterModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this WaiterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WaiterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WaiterModelCopyWith<WaiterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaiterModelCopyWith<$Res> {
  factory $WaiterModelCopyWith(
          WaiterModel value, $Res Function(WaiterModel) then) =
      _$WaiterModelCopyWithImpl<$Res, WaiterModel>;
  @useResult
  $Res call({int id, String name, String email});
}

/// @nodoc
class _$WaiterModelCopyWithImpl<$Res, $Val extends WaiterModel>
    implements $WaiterModelCopyWith<$Res> {
  _$WaiterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WaiterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaiterModelImplCopyWith<$Res>
    implements $WaiterModelCopyWith<$Res> {
  factory _$$WaiterModelImplCopyWith(
          _$WaiterModelImpl value, $Res Function(_$WaiterModelImpl) then) =
      __$$WaiterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String email});
}

/// @nodoc
class __$$WaiterModelImplCopyWithImpl<$Res>
    extends _$WaiterModelCopyWithImpl<$Res, _$WaiterModelImpl>
    implements _$$WaiterModelImplCopyWith<$Res> {
  __$$WaiterModelImplCopyWithImpl(
      _$WaiterModelImpl _value, $Res Function(_$WaiterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WaiterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$WaiterModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WaiterModelImpl implements _WaiterModel {
  const _$WaiterModelImpl(
      {required this.id, required this.name, required this.email});

  factory _$WaiterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WaiterModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'WaiterModel(id: $id, name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaiterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email);

  /// Create a copy of WaiterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WaiterModelImplCopyWith<_$WaiterModelImpl> get copyWith =>
      __$$WaiterModelImplCopyWithImpl<_$WaiterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WaiterModelImplToJson(
      this,
    );
  }
}

abstract class _WaiterModel implements WaiterModel {
  const factory _WaiterModel(
      {required final int id,
      required final String name,
      required final String email}) = _$WaiterModelImpl;

  factory _WaiterModel.fromJson(Map<String, dynamic> json) =
      _$WaiterModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;

  /// Create a copy of WaiterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WaiterModelImplCopyWith<_$WaiterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
