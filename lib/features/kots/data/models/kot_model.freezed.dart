// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KotModel _$KotModelFromJson(Map<String, dynamic> json) {
  return _KotModel.fromJson(json);
}

/// @nodoc
mixin _$KotModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'kot_number')
  int get kotNumber => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_number')
  int? get tokenNumber => throw _privateConstructorUsedError;
  KotOrderModel get order => throw _privateConstructorUsedError;
  KotTableModel? get table => throw _privateConstructorUsedError;
  KotWaiterModel? get waiter => throw _privateConstructorUsedError;
  @JsonKey(name: 'kitchen_place')
  KotPlaceModel? get kitchenPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'items_count')
  int? get itemsCount => throw _privateConstructorUsedError;
  List<KotItemModel>? get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this KotModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KotModelCopyWith<KotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KotModelCopyWith<$Res> {
  factory $KotModelCopyWith(KotModel value, $Res Function(KotModel) then) =
      _$KotModelCopyWithImpl<$Res, KotModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'kot_number') int kotNumber,
      String status,
      @JsonKey(name: 'token_number') int? tokenNumber,
      KotOrderModel order,
      KotTableModel? table,
      KotWaiterModel? waiter,
      @JsonKey(name: 'kitchen_place') KotPlaceModel? kitchenPlace,
      @JsonKey(name: 'items_count') int? itemsCount,
      List<KotItemModel>? items,
      @JsonKey(name: 'created_at') DateTime createdAt});

  $KotOrderModelCopyWith<$Res> get order;
  $KotTableModelCopyWith<$Res>? get table;
  $KotWaiterModelCopyWith<$Res>? get waiter;
  $KotPlaceModelCopyWith<$Res>? get kitchenPlace;
}

/// @nodoc
class _$KotModelCopyWithImpl<$Res, $Val extends KotModel>
    implements $KotModelCopyWith<$Res> {
  _$KotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kotNumber = null,
    Object? status = null,
    Object? tokenNumber = freezed,
    Object? order = null,
    Object? table = freezed,
    Object? waiter = freezed,
    Object? kitchenPlace = freezed,
    Object? itemsCount = freezed,
    Object? items = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      kotNumber: null == kotNumber
          ? _value.kotNumber
          : kotNumber // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tokenNumber: freezed == tokenNumber
          ? _value.tokenNumber
          : tokenNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as KotOrderModel,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as KotTableModel?,
      waiter: freezed == waiter
          ? _value.waiter
          : waiter // ignore: cast_nullable_to_non_nullable
              as KotWaiterModel?,
      kitchenPlace: freezed == kitchenPlace
          ? _value.kitchenPlace
          : kitchenPlace // ignore: cast_nullable_to_non_nullable
              as KotPlaceModel?,
      itemsCount: freezed == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<KotItemModel>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of KotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KotOrderModelCopyWith<$Res> get order {
    return $KotOrderModelCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }

  /// Create a copy of KotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KotTableModelCopyWith<$Res>? get table {
    if (_value.table == null) {
      return null;
    }

    return $KotTableModelCopyWith<$Res>(_value.table!, (value) {
      return _then(_value.copyWith(table: value) as $Val);
    });
  }

  /// Create a copy of KotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KotWaiterModelCopyWith<$Res>? get waiter {
    if (_value.waiter == null) {
      return null;
    }

    return $KotWaiterModelCopyWith<$Res>(_value.waiter!, (value) {
      return _then(_value.copyWith(waiter: value) as $Val);
    });
  }

  /// Create a copy of KotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KotPlaceModelCopyWith<$Res>? get kitchenPlace {
    if (_value.kitchenPlace == null) {
      return null;
    }

    return $KotPlaceModelCopyWith<$Res>(_value.kitchenPlace!, (value) {
      return _then(_value.copyWith(kitchenPlace: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KotModelImplCopyWith<$Res>
    implements $KotModelCopyWith<$Res> {
  factory _$$KotModelImplCopyWith(
          _$KotModelImpl value, $Res Function(_$KotModelImpl) then) =
      __$$KotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'kot_number') int kotNumber,
      String status,
      @JsonKey(name: 'token_number') int? tokenNumber,
      KotOrderModel order,
      KotTableModel? table,
      KotWaiterModel? waiter,
      @JsonKey(name: 'kitchen_place') KotPlaceModel? kitchenPlace,
      @JsonKey(name: 'items_count') int? itemsCount,
      List<KotItemModel>? items,
      @JsonKey(name: 'created_at') DateTime createdAt});

  @override
  $KotOrderModelCopyWith<$Res> get order;
  @override
  $KotTableModelCopyWith<$Res>? get table;
  @override
  $KotWaiterModelCopyWith<$Res>? get waiter;
  @override
  $KotPlaceModelCopyWith<$Res>? get kitchenPlace;
}

/// @nodoc
class __$$KotModelImplCopyWithImpl<$Res>
    extends _$KotModelCopyWithImpl<$Res, _$KotModelImpl>
    implements _$$KotModelImplCopyWith<$Res> {
  __$$KotModelImplCopyWithImpl(
      _$KotModelImpl _value, $Res Function(_$KotModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of KotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kotNumber = null,
    Object? status = null,
    Object? tokenNumber = freezed,
    Object? order = null,
    Object? table = freezed,
    Object? waiter = freezed,
    Object? kitchenPlace = freezed,
    Object? itemsCount = freezed,
    Object? items = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$KotModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      kotNumber: null == kotNumber
          ? _value.kotNumber
          : kotNumber // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tokenNumber: freezed == tokenNumber
          ? _value.tokenNumber
          : tokenNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as KotOrderModel,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as KotTableModel?,
      waiter: freezed == waiter
          ? _value.waiter
          : waiter // ignore: cast_nullable_to_non_nullable
              as KotWaiterModel?,
      kitchenPlace: freezed == kitchenPlace
          ? _value.kitchenPlace
          : kitchenPlace // ignore: cast_nullable_to_non_nullable
              as KotPlaceModel?,
      itemsCount: freezed == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<KotItemModel>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KotModelImpl implements _KotModel {
  const _$KotModelImpl(
      {required this.id,
      @JsonKey(name: 'kot_number') required this.kotNumber,
      required this.status,
      @JsonKey(name: 'token_number') this.tokenNumber,
      required this.order,
      this.table,
      this.waiter,
      @JsonKey(name: 'kitchen_place') this.kitchenPlace,
      @JsonKey(name: 'items_count') this.itemsCount,
      final List<KotItemModel>? items,
      @JsonKey(name: 'created_at') required this.createdAt})
      : _items = items;

  factory _$KotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KotModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'kot_number')
  final int kotNumber;
  @override
  final String status;
  @override
  @JsonKey(name: 'token_number')
  final int? tokenNumber;
  @override
  final KotOrderModel order;
  @override
  final KotTableModel? table;
  @override
  final KotWaiterModel? waiter;
  @override
  @JsonKey(name: 'kitchen_place')
  final KotPlaceModel? kitchenPlace;
  @override
  @JsonKey(name: 'items_count')
  final int? itemsCount;
  final List<KotItemModel>? _items;
  @override
  List<KotItemModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'KotModel(id: $id, kotNumber: $kotNumber, status: $status, tokenNumber: $tokenNumber, order: $order, table: $table, waiter: $waiter, kitchenPlace: $kitchenPlace, itemsCount: $itemsCount, items: $items, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KotModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kotNumber, kotNumber) ||
                other.kotNumber == kotNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tokenNumber, tokenNumber) ||
                other.tokenNumber == tokenNumber) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.waiter, waiter) || other.waiter == waiter) &&
            (identical(other.kitchenPlace, kitchenPlace) ||
                other.kitchenPlace == kitchenPlace) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      kotNumber,
      status,
      tokenNumber,
      order,
      table,
      waiter,
      kitchenPlace,
      itemsCount,
      const DeepCollectionEquality().hash(_items),
      createdAt);

  /// Create a copy of KotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KotModelImplCopyWith<_$KotModelImpl> get copyWith =>
      __$$KotModelImplCopyWithImpl<_$KotModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KotModelImplToJson(
      this,
    );
  }
}

abstract class _KotModel implements KotModel {
  const factory _KotModel(
          {required final int id,
          @JsonKey(name: 'kot_number') required final int kotNumber,
          required final String status,
          @JsonKey(name: 'token_number') final int? tokenNumber,
          required final KotOrderModel order,
          final KotTableModel? table,
          final KotWaiterModel? waiter,
          @JsonKey(name: 'kitchen_place') final KotPlaceModel? kitchenPlace,
          @JsonKey(name: 'items_count') final int? itemsCount,
          final List<KotItemModel>? items,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$KotModelImpl;

  factory _KotModel.fromJson(Map<String, dynamic> json) =
      _$KotModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'kot_number')
  int get kotNumber;
  @override
  String get status;
  @override
  @JsonKey(name: 'token_number')
  int? get tokenNumber;
  @override
  KotOrderModel get order;
  @override
  KotTableModel? get table;
  @override
  KotWaiterModel? get waiter;
  @override
  @JsonKey(name: 'kitchen_place')
  KotPlaceModel? get kitchenPlace;
  @override
  @JsonKey(name: 'items_count')
  int? get itemsCount;
  @override
  List<KotItemModel>? get items;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of KotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KotModelImplCopyWith<_$KotModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KotOrderModel _$KotOrderModelFromJson(Map<String, dynamic> json) {
  return _KotOrderModel.fromJson(json);
}

/// @nodoc
mixin _$KotOrderModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_order_number')
  String get formattedOrderNumber => throw _privateConstructorUsedError;

  /// Serializes this KotOrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KotOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KotOrderModelCopyWith<KotOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KotOrderModelCopyWith<$Res> {
  factory $KotOrderModelCopyWith(
          KotOrderModel value, $Res Function(KotOrderModel) then) =
      _$KotOrderModelCopyWithImpl<$Res, KotOrderModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'order_number') String orderNumber,
      @JsonKey(name: 'formatted_order_number') String formattedOrderNumber});
}

/// @nodoc
class _$KotOrderModelCopyWithImpl<$Res, $Val extends KotOrderModel>
    implements $KotOrderModelCopyWith<$Res> {
  _$KotOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KotOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? formattedOrderNumber = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KotOrderModelImplCopyWith<$Res>
    implements $KotOrderModelCopyWith<$Res> {
  factory _$$KotOrderModelImplCopyWith(
          _$KotOrderModelImpl value, $Res Function(_$KotOrderModelImpl) then) =
      __$$KotOrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'order_number') String orderNumber,
      @JsonKey(name: 'formatted_order_number') String formattedOrderNumber});
}

/// @nodoc
class __$$KotOrderModelImplCopyWithImpl<$Res>
    extends _$KotOrderModelCopyWithImpl<$Res, _$KotOrderModelImpl>
    implements _$$KotOrderModelImplCopyWith<$Res> {
  __$$KotOrderModelImplCopyWithImpl(
      _$KotOrderModelImpl _value, $Res Function(_$KotOrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of KotOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? formattedOrderNumber = null,
  }) {
    return _then(_$KotOrderModelImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KotOrderModelImpl implements _KotOrderModel {
  const _$KotOrderModelImpl(
      {required this.id,
      @JsonKey(name: 'order_number') required this.orderNumber,
      @JsonKey(name: 'formatted_order_number')
      required this.formattedOrderNumber});

  factory _$KotOrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KotOrderModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'order_number')
  final String orderNumber;
  @override
  @JsonKey(name: 'formatted_order_number')
  final String formattedOrderNumber;

  @override
  String toString() {
    return 'KotOrderModel(id: $id, orderNumber: $orderNumber, formattedOrderNumber: $formattedOrderNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KotOrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.formattedOrderNumber, formattedOrderNumber) ||
                other.formattedOrderNumber == formattedOrderNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, orderNumber, formattedOrderNumber);

  /// Create a copy of KotOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KotOrderModelImplCopyWith<_$KotOrderModelImpl> get copyWith =>
      __$$KotOrderModelImplCopyWithImpl<_$KotOrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KotOrderModelImplToJson(
      this,
    );
  }
}

abstract class _KotOrderModel implements KotOrderModel {
  const factory _KotOrderModel(
      {required final int id,
      @JsonKey(name: 'order_number') required final String orderNumber,
      @JsonKey(name: 'formatted_order_number')
      required final String formattedOrderNumber}) = _$KotOrderModelImpl;

  factory _KotOrderModel.fromJson(Map<String, dynamic> json) =
      _$KotOrderModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'order_number')
  String get orderNumber;
  @override
  @JsonKey(name: 'formatted_order_number')
  String get formattedOrderNumber;

  /// Create a copy of KotOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KotOrderModelImplCopyWith<_$KotOrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KotTableModel _$KotTableModelFromJson(Map<String, dynamic> json) {
  return _KotTableModel.fromJson(json);
}

/// @nodoc
mixin _$KotTableModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'table_code')
  String get tableCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'area_name')
  String? get areaName => throw _privateConstructorUsedError;

  /// Serializes this KotTableModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KotTableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KotTableModelCopyWith<KotTableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KotTableModelCopyWith<$Res> {
  factory $KotTableModelCopyWith(
          KotTableModel value, $Res Function(KotTableModel) then) =
      _$KotTableModelCopyWithImpl<$Res, KotTableModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'table_code') String tableCode,
      @JsonKey(name: 'area_name') String? areaName});
}

/// @nodoc
class _$KotTableModelCopyWithImpl<$Res, $Val extends KotTableModel>
    implements $KotTableModelCopyWith<$Res> {
  _$KotTableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KotTableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tableCode = null,
    Object? areaName = freezed,
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
      areaName: freezed == areaName
          ? _value.areaName
          : areaName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KotTableModelImplCopyWith<$Res>
    implements $KotTableModelCopyWith<$Res> {
  factory _$$KotTableModelImplCopyWith(
          _$KotTableModelImpl value, $Res Function(_$KotTableModelImpl) then) =
      __$$KotTableModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'table_code') String tableCode,
      @JsonKey(name: 'area_name') String? areaName});
}

/// @nodoc
class __$$KotTableModelImplCopyWithImpl<$Res>
    extends _$KotTableModelCopyWithImpl<$Res, _$KotTableModelImpl>
    implements _$$KotTableModelImplCopyWith<$Res> {
  __$$KotTableModelImplCopyWithImpl(
      _$KotTableModelImpl _value, $Res Function(_$KotTableModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of KotTableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tableCode = null,
    Object? areaName = freezed,
  }) {
    return _then(_$KotTableModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tableCode: null == tableCode
          ? _value.tableCode
          : tableCode // ignore: cast_nullable_to_non_nullable
              as String,
      areaName: freezed == areaName
          ? _value.areaName
          : areaName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KotTableModelImpl implements _KotTableModel {
  const _$KotTableModelImpl(
      {required this.id,
      @JsonKey(name: 'table_code') required this.tableCode,
      @JsonKey(name: 'area_name') this.areaName});

  factory _$KotTableModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KotTableModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'table_code')
  final String tableCode;
  @override
  @JsonKey(name: 'area_name')
  final String? areaName;

  @override
  String toString() {
    return 'KotTableModel(id: $id, tableCode: $tableCode, areaName: $areaName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KotTableModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tableCode, tableCode) ||
                other.tableCode == tableCode) &&
            (identical(other.areaName, areaName) ||
                other.areaName == areaName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, tableCode, areaName);

  /// Create a copy of KotTableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KotTableModelImplCopyWith<_$KotTableModelImpl> get copyWith =>
      __$$KotTableModelImplCopyWithImpl<_$KotTableModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KotTableModelImplToJson(
      this,
    );
  }
}

abstract class _KotTableModel implements KotTableModel {
  const factory _KotTableModel(
          {required final int id,
          @JsonKey(name: 'table_code') required final String tableCode,
          @JsonKey(name: 'area_name') final String? areaName}) =
      _$KotTableModelImpl;

  factory _KotTableModel.fromJson(Map<String, dynamic> json) =
      _$KotTableModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'table_code')
  String get tableCode;
  @override
  @JsonKey(name: 'area_name')
  String? get areaName;

  /// Create a copy of KotTableModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KotTableModelImplCopyWith<_$KotTableModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KotWaiterModel _$KotWaiterModelFromJson(Map<String, dynamic> json) {
  return _KotWaiterModel.fromJson(json);
}

/// @nodoc
mixin _$KotWaiterModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this KotWaiterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KotWaiterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KotWaiterModelCopyWith<KotWaiterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KotWaiterModelCopyWith<$Res> {
  factory $KotWaiterModelCopyWith(
          KotWaiterModel value, $Res Function(KotWaiterModel) then) =
      _$KotWaiterModelCopyWithImpl<$Res, KotWaiterModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$KotWaiterModelCopyWithImpl<$Res, $Val extends KotWaiterModel>
    implements $KotWaiterModelCopyWith<$Res> {
  _$KotWaiterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KotWaiterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KotWaiterModelImplCopyWith<$Res>
    implements $KotWaiterModelCopyWith<$Res> {
  factory _$$KotWaiterModelImplCopyWith(_$KotWaiterModelImpl value,
          $Res Function(_$KotWaiterModelImpl) then) =
      __$$KotWaiterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$KotWaiterModelImplCopyWithImpl<$Res>
    extends _$KotWaiterModelCopyWithImpl<$Res, _$KotWaiterModelImpl>
    implements _$$KotWaiterModelImplCopyWith<$Res> {
  __$$KotWaiterModelImplCopyWithImpl(
      _$KotWaiterModelImpl _value, $Res Function(_$KotWaiterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of KotWaiterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$KotWaiterModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KotWaiterModelImpl implements _KotWaiterModel {
  const _$KotWaiterModelImpl({required this.id, required this.name});

  factory _$KotWaiterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KotWaiterModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'KotWaiterModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KotWaiterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of KotWaiterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KotWaiterModelImplCopyWith<_$KotWaiterModelImpl> get copyWith =>
      __$$KotWaiterModelImplCopyWithImpl<_$KotWaiterModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KotWaiterModelImplToJson(
      this,
    );
  }
}

abstract class _KotWaiterModel implements KotWaiterModel {
  const factory _KotWaiterModel(
      {required final int id,
      required final String name}) = _$KotWaiterModelImpl;

  factory _KotWaiterModel.fromJson(Map<String, dynamic> json) =
      _$KotWaiterModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of KotWaiterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KotWaiterModelImplCopyWith<_$KotWaiterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KotPlaceModel _$KotPlaceModelFromJson(Map<String, dynamic> json) {
  return _KotPlaceModel.fromJson(json);
}

/// @nodoc
mixin _$KotPlaceModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this KotPlaceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KotPlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KotPlaceModelCopyWith<KotPlaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KotPlaceModelCopyWith<$Res> {
  factory $KotPlaceModelCopyWith(
          KotPlaceModel value, $Res Function(KotPlaceModel) then) =
      _$KotPlaceModelCopyWithImpl<$Res, KotPlaceModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$KotPlaceModelCopyWithImpl<$Res, $Val extends KotPlaceModel>
    implements $KotPlaceModelCopyWith<$Res> {
  _$KotPlaceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KotPlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KotPlaceModelImplCopyWith<$Res>
    implements $KotPlaceModelCopyWith<$Res> {
  factory _$$KotPlaceModelImplCopyWith(
          _$KotPlaceModelImpl value, $Res Function(_$KotPlaceModelImpl) then) =
      __$$KotPlaceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$KotPlaceModelImplCopyWithImpl<$Res>
    extends _$KotPlaceModelCopyWithImpl<$Res, _$KotPlaceModelImpl>
    implements _$$KotPlaceModelImplCopyWith<$Res> {
  __$$KotPlaceModelImplCopyWithImpl(
      _$KotPlaceModelImpl _value, $Res Function(_$KotPlaceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of KotPlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$KotPlaceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KotPlaceModelImpl implements _KotPlaceModel {
  const _$KotPlaceModelImpl({required this.id, required this.name});

  factory _$KotPlaceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KotPlaceModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'KotPlaceModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KotPlaceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of KotPlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KotPlaceModelImplCopyWith<_$KotPlaceModelImpl> get copyWith =>
      __$$KotPlaceModelImplCopyWithImpl<_$KotPlaceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KotPlaceModelImplToJson(
      this,
    );
  }
}

abstract class _KotPlaceModel implements KotPlaceModel {
  const factory _KotPlaceModel(
      {required final int id,
      required final String name}) = _$KotPlaceModelImpl;

  factory _KotPlaceModel.fromJson(Map<String, dynamic> json) =
      _$KotPlaceModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of KotPlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KotPlaceModelImplCopyWith<_$KotPlaceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KotItemModel _$KotItemModelFromJson(Map<String, dynamic> json) {
  return _KotItemModel.fromJson(json);
}

/// @nodoc
mixin _$KotItemModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'menu_item')
  KotMenuItemBasicModel get menuItem => throw _privateConstructorUsedError;
  KotMenuItemVariationModel? get variation =>
      throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<KotModifierOptionModel> get modifiers =>
      throw _privateConstructorUsedError;

  /// Serializes this KotItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KotItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KotItemModelCopyWith<KotItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KotItemModelCopyWith<$Res> {
  factory $KotItemModelCopyWith(
          KotItemModel value, $Res Function(KotItemModel) then) =
      _$KotItemModelCopyWithImpl<$Res, KotItemModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'menu_item') KotMenuItemBasicModel menuItem,
      KotMenuItemVariationModel? variation,
      int quantity,
      String? note,
      String status,
      List<KotModifierOptionModel> modifiers});

  $KotMenuItemBasicModelCopyWith<$Res> get menuItem;
  $KotMenuItemVariationModelCopyWith<$Res>? get variation;
}

/// @nodoc
class _$KotItemModelCopyWithImpl<$Res, $Val extends KotItemModel>
    implements $KotItemModelCopyWith<$Res> {
  _$KotItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KotItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuItem = null,
    Object? variation = freezed,
    Object? quantity = null,
    Object? note = freezed,
    Object? status = null,
    Object? modifiers = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      menuItem: null == menuItem
          ? _value.menuItem
          : menuItem // ignore: cast_nullable_to_non_nullable
              as KotMenuItemBasicModel,
      variation: freezed == variation
          ? _value.variation
          : variation // ignore: cast_nullable_to_non_nullable
              as KotMenuItemVariationModel?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      modifiers: null == modifiers
          ? _value.modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<KotModifierOptionModel>,
    ) as $Val);
  }

  /// Create a copy of KotItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KotMenuItemBasicModelCopyWith<$Res> get menuItem {
    return $KotMenuItemBasicModelCopyWith<$Res>(_value.menuItem, (value) {
      return _then(_value.copyWith(menuItem: value) as $Val);
    });
  }

  /// Create a copy of KotItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KotMenuItemVariationModelCopyWith<$Res>? get variation {
    if (_value.variation == null) {
      return null;
    }

    return $KotMenuItemVariationModelCopyWith<$Res>(_value.variation!, (value) {
      return _then(_value.copyWith(variation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KotItemModelImplCopyWith<$Res>
    implements $KotItemModelCopyWith<$Res> {
  factory _$$KotItemModelImplCopyWith(
          _$KotItemModelImpl value, $Res Function(_$KotItemModelImpl) then) =
      __$$KotItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'menu_item') KotMenuItemBasicModel menuItem,
      KotMenuItemVariationModel? variation,
      int quantity,
      String? note,
      String status,
      List<KotModifierOptionModel> modifiers});

  @override
  $KotMenuItemBasicModelCopyWith<$Res> get menuItem;
  @override
  $KotMenuItemVariationModelCopyWith<$Res>? get variation;
}

/// @nodoc
class __$$KotItemModelImplCopyWithImpl<$Res>
    extends _$KotItemModelCopyWithImpl<$Res, _$KotItemModelImpl>
    implements _$$KotItemModelImplCopyWith<$Res> {
  __$$KotItemModelImplCopyWithImpl(
      _$KotItemModelImpl _value, $Res Function(_$KotItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of KotItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuItem = null,
    Object? variation = freezed,
    Object? quantity = null,
    Object? note = freezed,
    Object? status = null,
    Object? modifiers = null,
  }) {
    return _then(_$KotItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      menuItem: null == menuItem
          ? _value.menuItem
          : menuItem // ignore: cast_nullable_to_non_nullable
              as KotMenuItemBasicModel,
      variation: freezed == variation
          ? _value.variation
          : variation // ignore: cast_nullable_to_non_nullable
              as KotMenuItemVariationModel?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      modifiers: null == modifiers
          ? _value._modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<KotModifierOptionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KotItemModelImpl implements _KotItemModel {
  const _$KotItemModelImpl(
      {required this.id,
      @JsonKey(name: 'menu_item') required this.menuItem,
      this.variation,
      required this.quantity,
      this.note,
      required this.status,
      required final List<KotModifierOptionModel> modifiers})
      : _modifiers = modifiers;

  factory _$KotItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KotItemModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'menu_item')
  final KotMenuItemBasicModel menuItem;
  @override
  final KotMenuItemVariationModel? variation;
  @override
  final int quantity;
  @override
  final String? note;
  @override
  final String status;
  final List<KotModifierOptionModel> _modifiers;
  @override
  List<KotModifierOptionModel> get modifiers {
    if (_modifiers is EqualUnmodifiableListView) return _modifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modifiers);
  }

  @override
  String toString() {
    return 'KotItemModel(id: $id, menuItem: $menuItem, variation: $variation, quantity: $quantity, note: $note, status: $status, modifiers: $modifiers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KotItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.menuItem, menuItem) ||
                other.menuItem == menuItem) &&
            (identical(other.variation, variation) ||
                other.variation == variation) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._modifiers, _modifiers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, menuItem, variation,
      quantity, note, status, const DeepCollectionEquality().hash(_modifiers));

  /// Create a copy of KotItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KotItemModelImplCopyWith<_$KotItemModelImpl> get copyWith =>
      __$$KotItemModelImplCopyWithImpl<_$KotItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KotItemModelImplToJson(
      this,
    );
  }
}

abstract class _KotItemModel implements KotItemModel {
  const factory _KotItemModel(
      {required final int id,
      @JsonKey(name: 'menu_item') required final KotMenuItemBasicModel menuItem,
      final KotMenuItemVariationModel? variation,
      required final int quantity,
      final String? note,
      required final String status,
      required final List<KotModifierOptionModel>
          modifiers}) = _$KotItemModelImpl;

  factory _KotItemModel.fromJson(Map<String, dynamic> json) =
      _$KotItemModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'menu_item')
  KotMenuItemBasicModel get menuItem;
  @override
  KotMenuItemVariationModel? get variation;
  @override
  int get quantity;
  @override
  String? get note;
  @override
  String get status;
  @override
  List<KotModifierOptionModel> get modifiers;

  /// Create a copy of KotItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KotItemModelImplCopyWith<_$KotItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KotMenuItemBasicModel _$KotMenuItemBasicModelFromJson(
    Map<String, dynamic> json) {
  return _KotMenuItemBasicModel.fromJson(json);
}

/// @nodoc
mixin _$KotMenuItemBasicModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this KotMenuItemBasicModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KotMenuItemBasicModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KotMenuItemBasicModelCopyWith<KotMenuItemBasicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KotMenuItemBasicModelCopyWith<$Res> {
  factory $KotMenuItemBasicModelCopyWith(KotMenuItemBasicModel value,
          $Res Function(KotMenuItemBasicModel) then) =
      _$KotMenuItemBasicModelCopyWithImpl<$Res, KotMenuItemBasicModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$KotMenuItemBasicModelCopyWithImpl<$Res,
        $Val extends KotMenuItemBasicModel>
    implements $KotMenuItemBasicModelCopyWith<$Res> {
  _$KotMenuItemBasicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KotMenuItemBasicModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KotMenuItemBasicModelImplCopyWith<$Res>
    implements $KotMenuItemBasicModelCopyWith<$Res> {
  factory _$$KotMenuItemBasicModelImplCopyWith(
          _$KotMenuItemBasicModelImpl value,
          $Res Function(_$KotMenuItemBasicModelImpl) then) =
      __$$KotMenuItemBasicModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$KotMenuItemBasicModelImplCopyWithImpl<$Res>
    extends _$KotMenuItemBasicModelCopyWithImpl<$Res,
        _$KotMenuItemBasicModelImpl>
    implements _$$KotMenuItemBasicModelImplCopyWith<$Res> {
  __$$KotMenuItemBasicModelImplCopyWithImpl(_$KotMenuItemBasicModelImpl _value,
      $Res Function(_$KotMenuItemBasicModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of KotMenuItemBasicModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$KotMenuItemBasicModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KotMenuItemBasicModelImpl implements _KotMenuItemBasicModel {
  const _$KotMenuItemBasicModelImpl({required this.id, required this.name});

  factory _$KotMenuItemBasicModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KotMenuItemBasicModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'KotMenuItemBasicModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KotMenuItemBasicModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of KotMenuItemBasicModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KotMenuItemBasicModelImplCopyWith<_$KotMenuItemBasicModelImpl>
      get copyWith => __$$KotMenuItemBasicModelImplCopyWithImpl<
          _$KotMenuItemBasicModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KotMenuItemBasicModelImplToJson(
      this,
    );
  }
}

abstract class _KotMenuItemBasicModel implements KotMenuItemBasicModel {
  const factory _KotMenuItemBasicModel(
      {required final int id,
      required final String name}) = _$KotMenuItemBasicModelImpl;

  factory _KotMenuItemBasicModel.fromJson(Map<String, dynamic> json) =
      _$KotMenuItemBasicModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of KotMenuItemBasicModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KotMenuItemBasicModelImplCopyWith<_$KotMenuItemBasicModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

KotMenuItemVariationModel _$KotMenuItemVariationModelFromJson(
    Map<String, dynamic> json) {
  return _KotMenuItemVariationModel.fromJson(json);
}

/// @nodoc
mixin _$KotMenuItemVariationModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this KotMenuItemVariationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KotMenuItemVariationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KotMenuItemVariationModelCopyWith<KotMenuItemVariationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KotMenuItemVariationModelCopyWith<$Res> {
  factory $KotMenuItemVariationModelCopyWith(KotMenuItemVariationModel value,
          $Res Function(KotMenuItemVariationModel) then) =
      _$KotMenuItemVariationModelCopyWithImpl<$Res, KotMenuItemVariationModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$KotMenuItemVariationModelCopyWithImpl<$Res,
        $Val extends KotMenuItemVariationModel>
    implements $KotMenuItemVariationModelCopyWith<$Res> {
  _$KotMenuItemVariationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KotMenuItemVariationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KotMenuItemVariationModelImplCopyWith<$Res>
    implements $KotMenuItemVariationModelCopyWith<$Res> {
  factory _$$KotMenuItemVariationModelImplCopyWith(
          _$KotMenuItemVariationModelImpl value,
          $Res Function(_$KotMenuItemVariationModelImpl) then) =
      __$$KotMenuItemVariationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$KotMenuItemVariationModelImplCopyWithImpl<$Res>
    extends _$KotMenuItemVariationModelCopyWithImpl<$Res,
        _$KotMenuItemVariationModelImpl>
    implements _$$KotMenuItemVariationModelImplCopyWith<$Res> {
  __$$KotMenuItemVariationModelImplCopyWithImpl(
      _$KotMenuItemVariationModelImpl _value,
      $Res Function(_$KotMenuItemVariationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of KotMenuItemVariationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$KotMenuItemVariationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KotMenuItemVariationModelImpl implements _KotMenuItemVariationModel {
  const _$KotMenuItemVariationModelImpl({required this.id, required this.name});

  factory _$KotMenuItemVariationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KotMenuItemVariationModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'KotMenuItemVariationModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KotMenuItemVariationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of KotMenuItemVariationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KotMenuItemVariationModelImplCopyWith<_$KotMenuItemVariationModelImpl>
      get copyWith => __$$KotMenuItemVariationModelImplCopyWithImpl<
          _$KotMenuItemVariationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KotMenuItemVariationModelImplToJson(
      this,
    );
  }
}

abstract class _KotMenuItemVariationModel implements KotMenuItemVariationModel {
  const factory _KotMenuItemVariationModel(
      {required final int id,
      required final String name}) = _$KotMenuItemVariationModelImpl;

  factory _KotMenuItemVariationModel.fromJson(Map<String, dynamic> json) =
      _$KotMenuItemVariationModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of KotMenuItemVariationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KotMenuItemVariationModelImplCopyWith<_$KotMenuItemVariationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

KotModifierOptionModel _$KotModifierOptionModelFromJson(
    Map<String, dynamic> json) {
  return _KotModifierOptionModel.fromJson(json);
}

/// @nodoc
mixin _$KotModifierOptionModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this KotModifierOptionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KotModifierOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KotModifierOptionModelCopyWith<KotModifierOptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KotModifierOptionModelCopyWith<$Res> {
  factory $KotModifierOptionModelCopyWith(KotModifierOptionModel value,
          $Res Function(KotModifierOptionModel) then) =
      _$KotModifierOptionModelCopyWithImpl<$Res, KotModifierOptionModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$KotModifierOptionModelCopyWithImpl<$Res,
        $Val extends KotModifierOptionModel>
    implements $KotModifierOptionModelCopyWith<$Res> {
  _$KotModifierOptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KotModifierOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KotModifierOptionModelImplCopyWith<$Res>
    implements $KotModifierOptionModelCopyWith<$Res> {
  factory _$$KotModifierOptionModelImplCopyWith(
          _$KotModifierOptionModelImpl value,
          $Res Function(_$KotModifierOptionModelImpl) then) =
      __$$KotModifierOptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$KotModifierOptionModelImplCopyWithImpl<$Res>
    extends _$KotModifierOptionModelCopyWithImpl<$Res,
        _$KotModifierOptionModelImpl>
    implements _$$KotModifierOptionModelImplCopyWith<$Res> {
  __$$KotModifierOptionModelImplCopyWithImpl(
      _$KotModifierOptionModelImpl _value,
      $Res Function(_$KotModifierOptionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of KotModifierOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$KotModifierOptionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KotModifierOptionModelImpl implements _KotModifierOptionModel {
  const _$KotModifierOptionModelImpl({required this.id, required this.name});

  factory _$KotModifierOptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KotModifierOptionModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'KotModifierOptionModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KotModifierOptionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of KotModifierOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KotModifierOptionModelImplCopyWith<_$KotModifierOptionModelImpl>
      get copyWith => __$$KotModifierOptionModelImplCopyWithImpl<
          _$KotModifierOptionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KotModifierOptionModelImplToJson(
      this,
    );
  }
}

abstract class _KotModifierOptionModel implements KotModifierOptionModel {
  const factory _KotModifierOptionModel(
      {required final int id,
      required final String name}) = _$KotModifierOptionModelImpl;

  factory _KotModifierOptionModel.fromJson(Map<String, dynamic> json) =
      _$KotModifierOptionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of KotModifierOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KotModifierOptionModelImplCopyWith<_$KotModifierOptionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
