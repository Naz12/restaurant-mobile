// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TableModel _$TableModelFromJson(Map<String, dynamic> json) {
  return _TableModel.fromJson(json);
}

/// @nodoc
mixin _$TableModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'table_code')
  String get tableCode => throw _privateConstructorUsedError;
  int? get capacity =>
      throw _privateConstructorUsedError; // Made nullable to handle API returning null
  @JsonKey(name: 'area_id')
  int? get areaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'area_name')
  String? get areaName => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // available, occupied
  @JsonKey(name: 'active_order')
  TableActiveOrderModel? get activeOrder => throw _privateConstructorUsedError;

  /// Serializes this TableModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableModelCopyWith<TableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableModelCopyWith<$Res> {
  factory $TableModelCopyWith(
          TableModel value, $Res Function(TableModel) then) =
      _$TableModelCopyWithImpl<$Res, TableModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'table_code') String tableCode,
      int? capacity,
      @JsonKey(name: 'area_id') int? areaId,
      @JsonKey(name: 'area_name') String? areaName,
      String status,
      @JsonKey(name: 'active_order') TableActiveOrderModel? activeOrder});

  $TableActiveOrderModelCopyWith<$Res>? get activeOrder;
}

/// @nodoc
class _$TableModelCopyWithImpl<$Res, $Val extends TableModel>
    implements $TableModelCopyWith<$Res> {
  _$TableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tableCode = null,
    Object? capacity = freezed,
    Object? areaId = freezed,
    Object? areaName = freezed,
    Object? status = null,
    Object? activeOrder = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tableCode: null == tableCode
          ? _value.tableCode
          : tableCode // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      areaId: freezed == areaId
          ? _value.areaId
          : areaId // ignore: cast_nullable_to_non_nullable
              as int?,
      areaName: freezed == areaName
          ? _value.areaName
          : areaName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      activeOrder: freezed == activeOrder
          ? _value.activeOrder
          : activeOrder // ignore: cast_nullable_to_non_nullable
              as TableActiveOrderModel?,
    ) as $Val);
  }

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableActiveOrderModelCopyWith<$Res>? get activeOrder {
    if (_value.activeOrder == null) {
      return null;
    }

    return $TableActiveOrderModelCopyWith<$Res>(_value.activeOrder!, (value) {
      return _then(_value.copyWith(activeOrder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TableModelImplCopyWith<$Res>
    implements $TableModelCopyWith<$Res> {
  factory _$$TableModelImplCopyWith(
          _$TableModelImpl value, $Res Function(_$TableModelImpl) then) =
      __$$TableModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'table_code') String tableCode,
      int? capacity,
      @JsonKey(name: 'area_id') int? areaId,
      @JsonKey(name: 'area_name') String? areaName,
      String status,
      @JsonKey(name: 'active_order') TableActiveOrderModel? activeOrder});

  @override
  $TableActiveOrderModelCopyWith<$Res>? get activeOrder;
}

/// @nodoc
class __$$TableModelImplCopyWithImpl<$Res>
    extends _$TableModelCopyWithImpl<$Res, _$TableModelImpl>
    implements _$$TableModelImplCopyWith<$Res> {
  __$$TableModelImplCopyWithImpl(
      _$TableModelImpl _value, $Res Function(_$TableModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tableCode = null,
    Object? capacity = freezed,
    Object? areaId = freezed,
    Object? areaName = freezed,
    Object? status = null,
    Object? activeOrder = freezed,
  }) {
    return _then(_$TableModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tableCode: null == tableCode
          ? _value.tableCode
          : tableCode // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      areaId: freezed == areaId
          ? _value.areaId
          : areaId // ignore: cast_nullable_to_non_nullable
              as int?,
      areaName: freezed == areaName
          ? _value.areaName
          : areaName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      activeOrder: freezed == activeOrder
          ? _value.activeOrder
          : activeOrder // ignore: cast_nullable_to_non_nullable
              as TableActiveOrderModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TableModelImpl implements _TableModel {
  const _$TableModelImpl(
      {required this.id,
      @JsonKey(name: 'table_code') required this.tableCode,
      this.capacity,
      @JsonKey(name: 'area_id') this.areaId,
      @JsonKey(name: 'area_name') this.areaName,
      required this.status,
      @JsonKey(name: 'active_order') this.activeOrder});

  factory _$TableModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'table_code')
  final String tableCode;
  @override
  final int? capacity;
// Made nullable to handle API returning null
  @override
  @JsonKey(name: 'area_id')
  final int? areaId;
  @override
  @JsonKey(name: 'area_name')
  final String? areaName;
  @override
  final String status;
// available, occupied
  @override
  @JsonKey(name: 'active_order')
  final TableActiveOrderModel? activeOrder;

  @override
  String toString() {
    return 'TableModel(id: $id, tableCode: $tableCode, capacity: $capacity, areaId: $areaId, areaName: $areaName, status: $status, activeOrder: $activeOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tableCode, tableCode) ||
                other.tableCode == tableCode) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.areaId, areaId) || other.areaId == areaId) &&
            (identical(other.areaName, areaName) ||
                other.areaName == areaName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.activeOrder, activeOrder) ||
                other.activeOrder == activeOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, tableCode, capacity, areaId,
      areaName, status, activeOrder);

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableModelImplCopyWith<_$TableModelImpl> get copyWith =>
      __$$TableModelImplCopyWithImpl<_$TableModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TableModelImplToJson(
      this,
    );
  }
}

abstract class _TableModel implements TableModel {
  const factory _TableModel(
      {required final int id,
      @JsonKey(name: 'table_code') required final String tableCode,
      final int? capacity,
      @JsonKey(name: 'area_id') final int? areaId,
      @JsonKey(name: 'area_name') final String? areaName,
      required final String status,
      @JsonKey(name: 'active_order')
      final TableActiveOrderModel? activeOrder}) = _$TableModelImpl;

  factory _TableModel.fromJson(Map<String, dynamic> json) =
      _$TableModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'table_code')
  String get tableCode;
  @override
  int? get capacity; // Made nullable to handle API returning null
  @override
  @JsonKey(name: 'area_id')
  int? get areaId;
  @override
  @JsonKey(name: 'area_name')
  String? get areaName;
  @override
  String get status; // available, occupied
  @override
  @JsonKey(name: 'active_order')
  TableActiveOrderModel? get activeOrder;

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableModelImplCopyWith<_$TableModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TableActiveOrderModel _$TableActiveOrderModelFromJson(
    Map<String, dynamic> json) {
  return _TableActiveOrderModel.fromJson(json);
}

/// @nodoc
mixin _$TableActiveOrderModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_order_number')
  String get formattedOrderNumber => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this TableActiveOrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TableActiveOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableActiveOrderModelCopyWith<TableActiveOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableActiveOrderModelCopyWith<$Res> {
  factory $TableActiveOrderModelCopyWith(TableActiveOrderModel value,
          $Res Function(TableActiveOrderModel) then) =
      _$TableActiveOrderModelCopyWithImpl<$Res, TableActiveOrderModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'order_number') String orderNumber,
      @JsonKey(name: 'formatted_order_number') String formattedOrderNumber,
      String status});
}

/// @nodoc
class _$TableActiveOrderModelCopyWithImpl<$Res,
        $Val extends TableActiveOrderModel>
    implements $TableActiveOrderModelCopyWith<$Res> {
  _$TableActiveOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableActiveOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? formattedOrderNumber = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      formattedOrderNumber: null == formattedOrderNumber
          ? _value.formattedOrderNumber
          : formattedOrderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TableActiveOrderModelImplCopyWith<$Res>
    implements $TableActiveOrderModelCopyWith<$Res> {
  factory _$$TableActiveOrderModelImplCopyWith(
          _$TableActiveOrderModelImpl value,
          $Res Function(_$TableActiveOrderModelImpl) then) =
      __$$TableActiveOrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'order_number') String orderNumber,
      @JsonKey(name: 'formatted_order_number') String formattedOrderNumber,
      String status});
}

/// @nodoc
class __$$TableActiveOrderModelImplCopyWithImpl<$Res>
    extends _$TableActiveOrderModelCopyWithImpl<$Res,
        _$TableActiveOrderModelImpl>
    implements _$$TableActiveOrderModelImplCopyWith<$Res> {
  __$$TableActiveOrderModelImplCopyWithImpl(_$TableActiveOrderModelImpl _value,
      $Res Function(_$TableActiveOrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableActiveOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? formattedOrderNumber = null,
    Object? status = null,
  }) {
    return _then(_$TableActiveOrderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      formattedOrderNumber: null == formattedOrderNumber
          ? _value.formattedOrderNumber
          : formattedOrderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TableActiveOrderModelImpl implements _TableActiveOrderModel {
  const _$TableActiveOrderModelImpl(
      {required this.id,
      @JsonKey(name: 'order_number') required this.orderNumber,
      @JsonKey(name: 'formatted_order_number')
      required this.formattedOrderNumber,
      required this.status});

  factory _$TableActiveOrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableActiveOrderModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'order_number')
  final String orderNumber;
  @override
  @JsonKey(name: 'formatted_order_number')
  final String formattedOrderNumber;
  @override
  final String status;

  @override
  String toString() {
    return 'TableActiveOrderModel(id: $id, orderNumber: $orderNumber, formattedOrderNumber: $formattedOrderNumber, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableActiveOrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.formattedOrderNumber, formattedOrderNumber) ||
                other.formattedOrderNumber == formattedOrderNumber) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, orderNumber, formattedOrderNumber, status);

  /// Create a copy of TableActiveOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableActiveOrderModelImplCopyWith<_$TableActiveOrderModelImpl>
      get copyWith => __$$TableActiveOrderModelImplCopyWithImpl<
          _$TableActiveOrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TableActiveOrderModelImplToJson(
      this,
    );
  }
}

abstract class _TableActiveOrderModel implements TableActiveOrderModel {
  const factory _TableActiveOrderModel(
      {required final int id,
      @JsonKey(name: 'order_number') required final String orderNumber,
      @JsonKey(name: 'formatted_order_number')
      required final String formattedOrderNumber,
      required final String status}) = _$TableActiveOrderModelImpl;

  factory _TableActiveOrderModel.fromJson(Map<String, dynamic> json) =
      _$TableActiveOrderModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'order_number')
  String get orderNumber;
  @override
  @JsonKey(name: 'formatted_order_number')
  String get formattedOrderNumber;
  @override
  String get status;

  /// Create a copy of TableActiveOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableActiveOrderModelImplCopyWith<_$TableActiveOrderModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TableAreaModel _$TableAreaModelFromJson(Map<String, dynamic> json) {
  return _TableAreaModel.fromJson(json);
}

/// @nodoc
mixin _$TableAreaModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'area_name')
  String get areaName => throw _privateConstructorUsedError;
  @JsonKey(name: 'tables_count')
  int get tablesCount => throw _privateConstructorUsedError;

  /// Serializes this TableAreaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TableAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableAreaModelCopyWith<TableAreaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableAreaModelCopyWith<$Res> {
  factory $TableAreaModelCopyWith(
          TableAreaModel value, $Res Function(TableAreaModel) then) =
      _$TableAreaModelCopyWithImpl<$Res, TableAreaModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'area_name') String areaName,
      @JsonKey(name: 'tables_count') int tablesCount});
}

/// @nodoc
class _$TableAreaModelCopyWithImpl<$Res, $Val extends TableAreaModel>
    implements $TableAreaModelCopyWith<$Res> {
  _$TableAreaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? areaName = null,
    Object? tablesCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      areaName: null == areaName
          ? _value.areaName
          : areaName // ignore: cast_nullable_to_non_nullable
              as String,
      tablesCount: null == tablesCount
          ? _value.tablesCount
          : tablesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TableAreaModelImplCopyWith<$Res>
    implements $TableAreaModelCopyWith<$Res> {
  factory _$$TableAreaModelImplCopyWith(_$TableAreaModelImpl value,
          $Res Function(_$TableAreaModelImpl) then) =
      __$$TableAreaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'area_name') String areaName,
      @JsonKey(name: 'tables_count') int tablesCount});
}

/// @nodoc
class __$$TableAreaModelImplCopyWithImpl<$Res>
    extends _$TableAreaModelCopyWithImpl<$Res, _$TableAreaModelImpl>
    implements _$$TableAreaModelImplCopyWith<$Res> {
  __$$TableAreaModelImplCopyWithImpl(
      _$TableAreaModelImpl _value, $Res Function(_$TableAreaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? areaName = null,
    Object? tablesCount = null,
  }) {
    return _then(_$TableAreaModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      areaName: null == areaName
          ? _value.areaName
          : areaName // ignore: cast_nullable_to_non_nullable
              as String,
      tablesCount: null == tablesCount
          ? _value.tablesCount
          : tablesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TableAreaModelImpl implements _TableAreaModel {
  const _$TableAreaModelImpl(
      {required this.id,
      @JsonKey(name: 'area_name') required this.areaName,
      @JsonKey(name: 'tables_count') this.tablesCount = 0});

  factory _$TableAreaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableAreaModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'area_name')
  final String areaName;
  @override
  @JsonKey(name: 'tables_count')
  final int tablesCount;

  @override
  String toString() {
    return 'TableAreaModel(id: $id, areaName: $areaName, tablesCount: $tablesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableAreaModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.areaName, areaName) ||
                other.areaName == areaName) &&
            (identical(other.tablesCount, tablesCount) ||
                other.tablesCount == tablesCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, areaName, tablesCount);

  /// Create a copy of TableAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableAreaModelImplCopyWith<_$TableAreaModelImpl> get copyWith =>
      __$$TableAreaModelImplCopyWithImpl<_$TableAreaModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TableAreaModelImplToJson(
      this,
    );
  }
}

abstract class _TableAreaModel implements TableAreaModel {
  const factory _TableAreaModel(
          {required final int id,
          @JsonKey(name: 'area_name') required final String areaName,
          @JsonKey(name: 'tables_count') final int tablesCount}) =
      _$TableAreaModelImpl;

  factory _TableAreaModel.fromJson(Map<String, dynamic> json) =
      _$TableAreaModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'area_name')
  String get areaName;
  @override
  @JsonKey(name: 'tables_count')
  int get tablesCount;

  /// Create a copy of TableAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableAreaModelImplCopyWith<_$TableAreaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
