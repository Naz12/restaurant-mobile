// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_order_number')
  String get formattedOrderNumber => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  OrderTableModel? get table => throw _privateConstructorUsedError;
  OrderWaiterModel? get waiter => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_pax')
  int get numberOfPax => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_total')
  double get subTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_amount')
  double get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'tip_amount')
  double get tipAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_fee')
  double get deliveryFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_tax_amount')
  double get totalTaxAmount => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_note')
  String? get orderNote => throw _privateConstructorUsedError;
  List<OrderItemModel> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'order_number') String orderNumber,
      @JsonKey(name: 'formatted_order_number') String formattedOrderNumber,
      String status,
      OrderTableModel? table,
      OrderWaiterModel? waiter,
      @JsonKey(name: 'number_of_pax') int numberOfPax,
      @JsonKey(name: 'sub_total') double subTotal,
      @JsonKey(name: 'discount_amount') double discountAmount,
      @JsonKey(name: 'tip_amount') double tipAmount,
      @JsonKey(name: 'delivery_fee') double deliveryFee,
      @JsonKey(name: 'total_tax_amount') double totalTaxAmount,
      double total,
      @JsonKey(name: 'order_note') String? orderNote,
      List<OrderItemModel> items,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  $OrderTableModelCopyWith<$Res>? get table;
  $OrderWaiterModelCopyWith<$Res>? get waiter;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? formattedOrderNumber = null,
    Object? status = null,
    Object? table = freezed,
    Object? waiter = freezed,
    Object? numberOfPax = null,
    Object? subTotal = null,
    Object? discountAmount = null,
    Object? tipAmount = null,
    Object? deliveryFee = null,
    Object? totalTaxAmount = null,
    Object? total = null,
    Object? orderNote = freezed,
    Object? items = null,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as OrderTableModel?,
      waiter: freezed == waiter
          ? _value.waiter
          : waiter // ignore: cast_nullable_to_non_nullable
              as OrderWaiterModel?,
      numberOfPax: null == numberOfPax
          ? _value.numberOfPax
          : numberOfPax // ignore: cast_nullable_to_non_nullable
              as int,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      tipAmount: null == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalTaxAmount: null == totalTaxAmount
          ? _value.totalTaxAmount
          : totalTaxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      orderNote: freezed == orderNote
          ? _value.orderNote
          : orderNote // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderTableModelCopyWith<$Res>? get table {
    if (_value.table == null) {
      return null;
    }

    return $OrderTableModelCopyWith<$Res>(_value.table!, (value) {
      return _then(_value.copyWith(table: value) as $Val);
    });
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderWaiterModelCopyWith<$Res>? get waiter {
    if (_value.waiter == null) {
      return null;
    }

    return $OrderWaiterModelCopyWith<$Res>(_value.waiter!, (value) {
      return _then(_value.copyWith(waiter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'order_number') String orderNumber,
      @JsonKey(name: 'formatted_order_number') String formattedOrderNumber,
      String status,
      OrderTableModel? table,
      OrderWaiterModel? waiter,
      @JsonKey(name: 'number_of_pax') int numberOfPax,
      @JsonKey(name: 'sub_total') double subTotal,
      @JsonKey(name: 'discount_amount') double discountAmount,
      @JsonKey(name: 'tip_amount') double tipAmount,
      @JsonKey(name: 'delivery_fee') double deliveryFee,
      @JsonKey(name: 'total_tax_amount') double totalTaxAmount,
      double total,
      @JsonKey(name: 'order_note') String? orderNote,
      List<OrderItemModel> items,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  @override
  $OrderTableModelCopyWith<$Res>? get table;
  @override
  $OrderWaiterModelCopyWith<$Res>? get waiter;
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? formattedOrderNumber = null,
    Object? status = null,
    Object? table = freezed,
    Object? waiter = freezed,
    Object? numberOfPax = null,
    Object? subTotal = null,
    Object? discountAmount = null,
    Object? tipAmount = null,
    Object? deliveryFee = null,
    Object? totalTaxAmount = null,
    Object? total = null,
    Object? orderNote = freezed,
    Object? items = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$OrderModelImpl(
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
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as OrderTableModel?,
      waiter: freezed == waiter
          ? _value.waiter
          : waiter // ignore: cast_nullable_to_non_nullable
              as OrderWaiterModel?,
      numberOfPax: null == numberOfPax
          ? _value.numberOfPax
          : numberOfPax // ignore: cast_nullable_to_non_nullable
              as int,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      tipAmount: null == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalTaxAmount: null == totalTaxAmount
          ? _value.totalTaxAmount
          : totalTaxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      orderNote: freezed == orderNote
          ? _value.orderNote
          : orderNote // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl implements _OrderModel {
  const _$OrderModelImpl(
      {required this.id,
      @JsonKey(name: 'order_number') required this.orderNumber,
      @JsonKey(name: 'formatted_order_number')
      required this.formattedOrderNumber,
      required this.status,
      this.table,
      this.waiter,
      @JsonKey(name: 'number_of_pax') required this.numberOfPax,
      @JsonKey(name: 'sub_total') required this.subTotal,
      @JsonKey(name: 'discount_amount') required this.discountAmount,
      @JsonKey(name: 'tip_amount') required this.tipAmount,
      @JsonKey(name: 'delivery_fee') required this.deliveryFee,
      @JsonKey(name: 'total_tax_amount') required this.totalTaxAmount,
      required this.total,
      @JsonKey(name: 'order_note') this.orderNote,
      required final List<OrderItemModel> items,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : _items = items;

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

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
  final OrderTableModel? table;
  @override
  final OrderWaiterModel? waiter;
  @override
  @JsonKey(name: 'number_of_pax')
  final int numberOfPax;
  @override
  @JsonKey(name: 'sub_total')
  final double subTotal;
  @override
  @JsonKey(name: 'discount_amount')
  final double discountAmount;
  @override
  @JsonKey(name: 'tip_amount')
  final double tipAmount;
  @override
  @JsonKey(name: 'delivery_fee')
  final double deliveryFee;
  @override
  @JsonKey(name: 'total_tax_amount')
  final double totalTaxAmount;
  @override
  final double total;
  @override
  @JsonKey(name: 'order_note')
  final String? orderNote;
  final List<OrderItemModel> _items;
  @override
  List<OrderItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'OrderModel(id: $id, orderNumber: $orderNumber, formattedOrderNumber: $formattedOrderNumber, status: $status, table: $table, waiter: $waiter, numberOfPax: $numberOfPax, subTotal: $subTotal, discountAmount: $discountAmount, tipAmount: $tipAmount, deliveryFee: $deliveryFee, totalTaxAmount: $totalTaxAmount, total: $total, orderNote: $orderNote, items: $items, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.formattedOrderNumber, formattedOrderNumber) ||
                other.formattedOrderNumber == formattedOrderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.waiter, waiter) || other.waiter == waiter) &&
            (identical(other.numberOfPax, numberOfPax) ||
                other.numberOfPax == numberOfPax) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.tipAmount, tipAmount) ||
                other.tipAmount == tipAmount) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.totalTaxAmount, totalTaxAmount) ||
                other.totalTaxAmount == totalTaxAmount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.orderNote, orderNote) ||
                other.orderNote == orderNote) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderNumber,
      formattedOrderNumber,
      status,
      table,
      waiter,
      numberOfPax,
      subTotal,
      discountAmount,
      tipAmount,
      deliveryFee,
      totalTaxAmount,
      total,
      orderNote,
      const DeepCollectionEquality().hash(_items),
      createdAt,
      updatedAt);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {required final int id,
      @JsonKey(name: 'order_number') required final String orderNumber,
      @JsonKey(name: 'formatted_order_number')
      required final String formattedOrderNumber,
      required final String status,
      final OrderTableModel? table,
      final OrderWaiterModel? waiter,
      @JsonKey(name: 'number_of_pax') required final int numberOfPax,
      @JsonKey(name: 'sub_total') required final double subTotal,
      @JsonKey(name: 'discount_amount') required final double discountAmount,
      @JsonKey(name: 'tip_amount') required final double tipAmount,
      @JsonKey(name: 'delivery_fee') required final double deliveryFee,
      @JsonKey(name: 'total_tax_amount') required final double totalTaxAmount,
      required final double total,
      @JsonKey(name: 'order_note') final String? orderNote,
      required final List<OrderItemModel> items,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at')
      required final DateTime updatedAt}) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

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
  @override
  OrderTableModel? get table;
  @override
  OrderWaiterModel? get waiter;
  @override
  @JsonKey(name: 'number_of_pax')
  int get numberOfPax;
  @override
  @JsonKey(name: 'sub_total')
  double get subTotal;
  @override
  @JsonKey(name: 'discount_amount')
  double get discountAmount;
  @override
  @JsonKey(name: 'tip_amount')
  double get tipAmount;
  @override
  @JsonKey(name: 'delivery_fee')
  double get deliveryFee;
  @override
  @JsonKey(name: 'total_tax_amount')
  double get totalTaxAmount;
  @override
  double get total;
  @override
  @JsonKey(name: 'order_note')
  String? get orderNote;
  @override
  List<OrderItemModel> get items;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderTableModel _$OrderTableModelFromJson(Map<String, dynamic> json) {
  return _OrderTableModel.fromJson(json);
}

/// @nodoc
mixin _$OrderTableModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'table_code')
  String get tableCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'area_name')
  String? get areaName => throw _privateConstructorUsedError;

  /// Serializes this OrderTableModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderTableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderTableModelCopyWith<OrderTableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTableModelCopyWith<$Res> {
  factory $OrderTableModelCopyWith(
          OrderTableModel value, $Res Function(OrderTableModel) then) =
      _$OrderTableModelCopyWithImpl<$Res, OrderTableModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'table_code') String tableCode,
      @JsonKey(name: 'area_name') String? areaName});
}

/// @nodoc
class _$OrderTableModelCopyWithImpl<$Res, $Val extends OrderTableModel>
    implements $OrderTableModelCopyWith<$Res> {
  _$OrderTableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderTableModel
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
abstract class _$$OrderTableModelImplCopyWith<$Res>
    implements $OrderTableModelCopyWith<$Res> {
  factory _$$OrderTableModelImplCopyWith(_$OrderTableModelImpl value,
          $Res Function(_$OrderTableModelImpl) then) =
      __$$OrderTableModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'table_code') String tableCode,
      @JsonKey(name: 'area_name') String? areaName});
}

/// @nodoc
class __$$OrderTableModelImplCopyWithImpl<$Res>
    extends _$OrderTableModelCopyWithImpl<$Res, _$OrderTableModelImpl>
    implements _$$OrderTableModelImplCopyWith<$Res> {
  __$$OrderTableModelImplCopyWithImpl(
      _$OrderTableModelImpl _value, $Res Function(_$OrderTableModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderTableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tableCode = null,
    Object? areaName = freezed,
  }) {
    return _then(_$OrderTableModelImpl(
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
class _$OrderTableModelImpl implements _OrderTableModel {
  const _$OrderTableModelImpl(
      {required this.id,
      @JsonKey(name: 'table_code') required this.tableCode,
      @JsonKey(name: 'area_name') this.areaName});

  factory _$OrderTableModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderTableModelImplFromJson(json);

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
    return 'OrderTableModel(id: $id, tableCode: $tableCode, areaName: $areaName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTableModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tableCode, tableCode) ||
                other.tableCode == tableCode) &&
            (identical(other.areaName, areaName) ||
                other.areaName == areaName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, tableCode, areaName);

  /// Create a copy of OrderTableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTableModelImplCopyWith<_$OrderTableModelImpl> get copyWith =>
      __$$OrderTableModelImplCopyWithImpl<_$OrderTableModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderTableModelImplToJson(
      this,
    );
  }
}

abstract class _OrderTableModel implements OrderTableModel {
  const factory _OrderTableModel(
          {required final int id,
          @JsonKey(name: 'table_code') required final String tableCode,
          @JsonKey(name: 'area_name') final String? areaName}) =
      _$OrderTableModelImpl;

  factory _OrderTableModel.fromJson(Map<String, dynamic> json) =
      _$OrderTableModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'table_code')
  String get tableCode;
  @override
  @JsonKey(name: 'area_name')
  String? get areaName;

  /// Create a copy of OrderTableModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderTableModelImplCopyWith<_$OrderTableModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderWaiterModel _$OrderWaiterModelFromJson(Map<String, dynamic> json) {
  return _OrderWaiterModel.fromJson(json);
}

/// @nodoc
mixin _$OrderWaiterModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this OrderWaiterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderWaiterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderWaiterModelCopyWith<OrderWaiterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderWaiterModelCopyWith<$Res> {
  factory $OrderWaiterModelCopyWith(
          OrderWaiterModel value, $Res Function(OrderWaiterModel) then) =
      _$OrderWaiterModelCopyWithImpl<$Res, OrderWaiterModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$OrderWaiterModelCopyWithImpl<$Res, $Val extends OrderWaiterModel>
    implements $OrderWaiterModelCopyWith<$Res> {
  _$OrderWaiterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderWaiterModel
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
abstract class _$$OrderWaiterModelImplCopyWith<$Res>
    implements $OrderWaiterModelCopyWith<$Res> {
  factory _$$OrderWaiterModelImplCopyWith(_$OrderWaiterModelImpl value,
          $Res Function(_$OrderWaiterModelImpl) then) =
      __$$OrderWaiterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$OrderWaiterModelImplCopyWithImpl<$Res>
    extends _$OrderWaiterModelCopyWithImpl<$Res, _$OrderWaiterModelImpl>
    implements _$$OrderWaiterModelImplCopyWith<$Res> {
  __$$OrderWaiterModelImplCopyWithImpl(_$OrderWaiterModelImpl _value,
      $Res Function(_$OrderWaiterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderWaiterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$OrderWaiterModelImpl(
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
class _$OrderWaiterModelImpl implements _OrderWaiterModel {
  const _$OrderWaiterModelImpl({required this.id, required this.name});

  factory _$OrderWaiterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderWaiterModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'OrderWaiterModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderWaiterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of OrderWaiterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderWaiterModelImplCopyWith<_$OrderWaiterModelImpl> get copyWith =>
      __$$OrderWaiterModelImplCopyWithImpl<_$OrderWaiterModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderWaiterModelImplToJson(
      this,
    );
  }
}

abstract class _OrderWaiterModel implements OrderWaiterModel {
  const factory _OrderWaiterModel(
      {required final int id,
      required final String name}) = _$OrderWaiterModelImpl;

  factory _OrderWaiterModel.fromJson(Map<String, dynamic> json) =
      _$OrderWaiterModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of OrderWaiterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderWaiterModelImplCopyWith<_$OrderWaiterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) {
  return _OrderItemModel.fromJson(json);
}

/// @nodoc
mixin _$OrderItemModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'menu_item')
  MenuItemBasicModel get menuItem => throw _privateConstructorUsedError;
  MenuItemVariationModel? get variation => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  List<ModifierOptionModel> get modifiers => throw _privateConstructorUsedError;

  /// Serializes this OrderItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemModelCopyWith<OrderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemModelCopyWith<$Res> {
  factory $OrderItemModelCopyWith(
          OrderItemModel value, $Res Function(OrderItemModel) then) =
      _$OrderItemModelCopyWithImpl<$Res, OrderItemModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'menu_item') MenuItemBasicModel menuItem,
      MenuItemVariationModel? variation,
      int quantity,
      double price,
      double amount,
      String? note,
      List<ModifierOptionModel> modifiers});

  $MenuItemBasicModelCopyWith<$Res> get menuItem;
  $MenuItemVariationModelCopyWith<$Res>? get variation;
}

/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res, $Val extends OrderItemModel>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuItem = null,
    Object? variation = freezed,
    Object? quantity = null,
    Object? price = null,
    Object? amount = null,
    Object? note = freezed,
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
              as MenuItemBasicModel,
      variation: freezed == variation
          ? _value.variation
          : variation // ignore: cast_nullable_to_non_nullable
              as MenuItemVariationModel?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiers: null == modifiers
          ? _value.modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<ModifierOptionModel>,
    ) as $Val);
  }

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuItemBasicModelCopyWith<$Res> get menuItem {
    return $MenuItemBasicModelCopyWith<$Res>(_value.menuItem, (value) {
      return _then(_value.copyWith(menuItem: value) as $Val);
    });
  }

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuItemVariationModelCopyWith<$Res>? get variation {
    if (_value.variation == null) {
      return null;
    }

    return $MenuItemVariationModelCopyWith<$Res>(_value.variation!, (value) {
      return _then(_value.copyWith(variation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderItemModelImplCopyWith<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  factory _$$OrderItemModelImplCopyWith(_$OrderItemModelImpl value,
          $Res Function(_$OrderItemModelImpl) then) =
      __$$OrderItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'menu_item') MenuItemBasicModel menuItem,
      MenuItemVariationModel? variation,
      int quantity,
      double price,
      double amount,
      String? note,
      List<ModifierOptionModel> modifiers});

  @override
  $MenuItemBasicModelCopyWith<$Res> get menuItem;
  @override
  $MenuItemVariationModelCopyWith<$Res>? get variation;
}

/// @nodoc
class __$$OrderItemModelImplCopyWithImpl<$Res>
    extends _$OrderItemModelCopyWithImpl<$Res, _$OrderItemModelImpl>
    implements _$$OrderItemModelImplCopyWith<$Res> {
  __$$OrderItemModelImplCopyWithImpl(
      _$OrderItemModelImpl _value, $Res Function(_$OrderItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuItem = null,
    Object? variation = freezed,
    Object? quantity = null,
    Object? price = null,
    Object? amount = null,
    Object? note = freezed,
    Object? modifiers = null,
  }) {
    return _then(_$OrderItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      menuItem: null == menuItem
          ? _value.menuItem
          : menuItem // ignore: cast_nullable_to_non_nullable
              as MenuItemBasicModel,
      variation: freezed == variation
          ? _value.variation
          : variation // ignore: cast_nullable_to_non_nullable
              as MenuItemVariationModel?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiers: null == modifiers
          ? _value._modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<ModifierOptionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemModelImpl implements _OrderItemModel {
  const _$OrderItemModelImpl(
      {required this.id,
      @JsonKey(name: 'menu_item') required this.menuItem,
      this.variation,
      required this.quantity,
      required this.price,
      required this.amount,
      this.note,
      required final List<ModifierOptionModel> modifiers})
      : _modifiers = modifiers;

  factory _$OrderItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'menu_item')
  final MenuItemBasicModel menuItem;
  @override
  final MenuItemVariationModel? variation;
  @override
  final int quantity;
  @override
  final double price;
  @override
  final double amount;
  @override
  final String? note;
  final List<ModifierOptionModel> _modifiers;
  @override
  List<ModifierOptionModel> get modifiers {
    if (_modifiers is EqualUnmodifiableListView) return _modifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modifiers);
  }

  @override
  String toString() {
    return 'OrderItemModel(id: $id, menuItem: $menuItem, variation: $variation, quantity: $quantity, price: $price, amount: $amount, note: $note, modifiers: $modifiers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.menuItem, menuItem) ||
                other.menuItem == menuItem) &&
            (identical(other.variation, variation) ||
                other.variation == variation) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality()
                .equals(other._modifiers, _modifiers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      menuItem,
      variation,
      quantity,
      price,
      amount,
      note,
      const DeepCollectionEquality().hash(_modifiers));

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      __$$OrderItemModelImplCopyWithImpl<_$OrderItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemModelImplToJson(
      this,
    );
  }
}

abstract class _OrderItemModel implements OrderItemModel {
  const factory _OrderItemModel(
      {required final int id,
      @JsonKey(name: 'menu_item') required final MenuItemBasicModel menuItem,
      final MenuItemVariationModel? variation,
      required final int quantity,
      required final double price,
      required final double amount,
      final String? note,
      required final List<ModifierOptionModel>
          modifiers}) = _$OrderItemModelImpl;

  factory _OrderItemModel.fromJson(Map<String, dynamic> json) =
      _$OrderItemModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'menu_item')
  MenuItemBasicModel get menuItem;
  @override
  MenuItemVariationModel? get variation;
  @override
  int get quantity;
  @override
  double get price;
  @override
  double get amount;
  @override
  String? get note;
  @override
  List<ModifierOptionModel> get modifiers;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuItemBasicModel _$MenuItemBasicModelFromJson(Map<String, dynamic> json) {
  return _MenuItemBasicModel.fromJson(json);
}

/// @nodoc
mixin _$MenuItemBasicModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this MenuItemBasicModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuItemBasicModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuItemBasicModelCopyWith<MenuItemBasicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemBasicModelCopyWith<$Res> {
  factory $MenuItemBasicModelCopyWith(
          MenuItemBasicModel value, $Res Function(MenuItemBasicModel) then) =
      _$MenuItemBasicModelCopyWithImpl<$Res, MenuItemBasicModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$MenuItemBasicModelCopyWithImpl<$Res, $Val extends MenuItemBasicModel>
    implements $MenuItemBasicModelCopyWith<$Res> {
  _$MenuItemBasicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuItemBasicModel
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
abstract class _$$MenuItemBasicModelImplCopyWith<$Res>
    implements $MenuItemBasicModelCopyWith<$Res> {
  factory _$$MenuItemBasicModelImplCopyWith(_$MenuItemBasicModelImpl value,
          $Res Function(_$MenuItemBasicModelImpl) then) =
      __$$MenuItemBasicModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$MenuItemBasicModelImplCopyWithImpl<$Res>
    extends _$MenuItemBasicModelCopyWithImpl<$Res, _$MenuItemBasicModelImpl>
    implements _$$MenuItemBasicModelImplCopyWith<$Res> {
  __$$MenuItemBasicModelImplCopyWithImpl(_$MenuItemBasicModelImpl _value,
      $Res Function(_$MenuItemBasicModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuItemBasicModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$MenuItemBasicModelImpl(
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
class _$MenuItemBasicModelImpl implements _MenuItemBasicModel {
  const _$MenuItemBasicModelImpl({required this.id, required this.name});

  factory _$MenuItemBasicModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemBasicModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'MenuItemBasicModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemBasicModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of MenuItemBasicModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemBasicModelImplCopyWith<_$MenuItemBasicModelImpl> get copyWith =>
      __$$MenuItemBasicModelImplCopyWithImpl<_$MenuItemBasicModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemBasicModelImplToJson(
      this,
    );
  }
}

abstract class _MenuItemBasicModel implements MenuItemBasicModel {
  const factory _MenuItemBasicModel(
      {required final int id,
      required final String name}) = _$MenuItemBasicModelImpl;

  factory _MenuItemBasicModel.fromJson(Map<String, dynamic> json) =
      _$MenuItemBasicModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of MenuItemBasicModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemBasicModelImplCopyWith<_$MenuItemBasicModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuItemVariationModel _$MenuItemVariationModelFromJson(
    Map<String, dynamic> json) {
  return _MenuItemVariationModel.fromJson(json);
}

/// @nodoc
mixin _$MenuItemVariationModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this MenuItemVariationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuItemVariationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuItemVariationModelCopyWith<MenuItemVariationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemVariationModelCopyWith<$Res> {
  factory $MenuItemVariationModelCopyWith(MenuItemVariationModel value,
          $Res Function(MenuItemVariationModel) then) =
      _$MenuItemVariationModelCopyWithImpl<$Res, MenuItemVariationModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$MenuItemVariationModelCopyWithImpl<$Res,
        $Val extends MenuItemVariationModel>
    implements $MenuItemVariationModelCopyWith<$Res> {
  _$MenuItemVariationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuItemVariationModel
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
abstract class _$$MenuItemVariationModelImplCopyWith<$Res>
    implements $MenuItemVariationModelCopyWith<$Res> {
  factory _$$MenuItemVariationModelImplCopyWith(
          _$MenuItemVariationModelImpl value,
          $Res Function(_$MenuItemVariationModelImpl) then) =
      __$$MenuItemVariationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$MenuItemVariationModelImplCopyWithImpl<$Res>
    extends _$MenuItemVariationModelCopyWithImpl<$Res,
        _$MenuItemVariationModelImpl>
    implements _$$MenuItemVariationModelImplCopyWith<$Res> {
  __$$MenuItemVariationModelImplCopyWithImpl(
      _$MenuItemVariationModelImpl _value,
      $Res Function(_$MenuItemVariationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuItemVariationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$MenuItemVariationModelImpl(
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
class _$MenuItemVariationModelImpl implements _MenuItemVariationModel {
  const _$MenuItemVariationModelImpl({required this.id, required this.name});

  factory _$MenuItemVariationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemVariationModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'MenuItemVariationModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemVariationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of MenuItemVariationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemVariationModelImplCopyWith<_$MenuItemVariationModelImpl>
      get copyWith => __$$MenuItemVariationModelImplCopyWithImpl<
          _$MenuItemVariationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemVariationModelImplToJson(
      this,
    );
  }
}

abstract class _MenuItemVariationModel implements MenuItemVariationModel {
  const factory _MenuItemVariationModel(
      {required final int id,
      required final String name}) = _$MenuItemVariationModelImpl;

  factory _MenuItemVariationModel.fromJson(Map<String, dynamic> json) =
      _$MenuItemVariationModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of MenuItemVariationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemVariationModelImplCopyWith<_$MenuItemVariationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ModifierOptionModel _$ModifierOptionModelFromJson(Map<String, dynamic> json) {
  return _ModifierOptionModel.fromJson(json);
}

/// @nodoc
mixin _$ModifierOptionModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  /// Serializes this ModifierOptionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ModifierOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModifierOptionModelCopyWith<ModifierOptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifierOptionModelCopyWith<$Res> {
  factory $ModifierOptionModelCopyWith(
          ModifierOptionModel value, $Res Function(ModifierOptionModel) then) =
      _$ModifierOptionModelCopyWithImpl<$Res, ModifierOptionModel>;
  @useResult
  $Res call({int id, String name, double price});
}

/// @nodoc
class _$ModifierOptionModelCopyWithImpl<$Res, $Val extends ModifierOptionModel>
    implements $ModifierOptionModelCopyWith<$Res> {
  _$ModifierOptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModifierOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
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
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModifierOptionModelImplCopyWith<$Res>
    implements $ModifierOptionModelCopyWith<$Res> {
  factory _$$ModifierOptionModelImplCopyWith(_$ModifierOptionModelImpl value,
          $Res Function(_$ModifierOptionModelImpl) then) =
      __$$ModifierOptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, double price});
}

/// @nodoc
class __$$ModifierOptionModelImplCopyWithImpl<$Res>
    extends _$ModifierOptionModelCopyWithImpl<$Res, _$ModifierOptionModelImpl>
    implements _$$ModifierOptionModelImplCopyWith<$Res> {
  __$$ModifierOptionModelImplCopyWithImpl(_$ModifierOptionModelImpl _value,
      $Res Function(_$ModifierOptionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ModifierOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_$ModifierOptionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModifierOptionModelImpl implements _ModifierOptionModel {
  const _$ModifierOptionModelImpl(
      {required this.id, required this.name, required this.price});

  factory _$ModifierOptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModifierOptionModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double price;

  @override
  String toString() {
    return 'ModifierOptionModel(id: $id, name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifierOptionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price);

  /// Create a copy of ModifierOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifierOptionModelImplCopyWith<_$ModifierOptionModelImpl> get copyWith =>
      __$$ModifierOptionModelImplCopyWithImpl<_$ModifierOptionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModifierOptionModelImplToJson(
      this,
    );
  }
}

abstract class _ModifierOptionModel implements ModifierOptionModel {
  const factory _ModifierOptionModel(
      {required final int id,
      required final String name,
      required final double price}) = _$ModifierOptionModelImpl;

  factory _ModifierOptionModel.fromJson(Map<String, dynamic> json) =
      _$ModifierOptionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double get price;

  /// Create a copy of ModifierOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModifierOptionModelImplCopyWith<_$ModifierOptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
