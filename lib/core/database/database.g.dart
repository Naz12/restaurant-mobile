// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _serverIdMeta =
      const VerificationMeta('serverId');
  @override
  late final GeneratedColumn<int> serverId = GeneratedColumn<int>(
      'server_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tempIdMeta = const VerificationMeta('tempId');
  @override
  late final GeneratedColumn<String> tempId = GeneratedColumn<String>(
      'temp_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tableIdMeta =
      const VerificationMeta('tableId');
  @override
  late final GeneratedColumn<int> tableId = GeneratedColumn<int>(
      'table_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _orderTypeIdMeta =
      const VerificationMeta('orderTypeId');
  @override
  late final GeneratedColumn<int> orderTypeId = GeneratedColumn<int>(
      'order_type_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _waiterIdMeta =
      const VerificationMeta('waiterId');
  @override
  late final GeneratedColumn<int> waiterId = GeneratedColumn<int>(
      'waiter_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _orderNumberMeta =
      const VerificationMeta('orderNumber');
  @override
  late final GeneratedColumn<String> orderNumber = GeneratedColumn<String>(
      'order_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        serverId,
        tempId,
        tableId,
        orderTypeId,
        waiterId,
        orderNumber,
        status,
        total,
        createdAt,
        updatedAt,
        synced
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('server_id')) {
      context.handle(_serverIdMeta,
          serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta));
    }
    if (data.containsKey('temp_id')) {
      context.handle(_tempIdMeta,
          tempId.isAcceptableOrUnknown(data['temp_id']!, _tempIdMeta));
    }
    if (data.containsKey('table_id')) {
      context.handle(_tableIdMeta,
          tableId.isAcceptableOrUnknown(data['table_id']!, _tableIdMeta));
    }
    if (data.containsKey('order_type_id')) {
      context.handle(
          _orderTypeIdMeta,
          orderTypeId.isAcceptableOrUnknown(
              data['order_type_id']!, _orderTypeIdMeta));
    } else if (isInserting) {
      context.missing(_orderTypeIdMeta);
    }
    if (data.containsKey('waiter_id')) {
      context.handle(_waiterIdMeta,
          waiterId.isAcceptableOrUnknown(data['waiter_id']!, _waiterIdMeta));
    }
    if (data.containsKey('order_number')) {
      context.handle(
          _orderNumberMeta,
          orderNumber.isAcceptableOrUnknown(
              data['order_number']!, _orderNumberMeta));
    } else if (isInserting) {
      context.missing(_orderNumberMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Order(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      serverId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}server_id']),
      tempId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}temp_id']),
      tableId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}table_id']),
      orderTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_type_id'])!,
      waiterId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}waiter_id']),
      orderNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_number'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
    );
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(attachedDatabase, alias);
  }
}

class Order extends DataClass implements Insertable<Order> {
  final int id;
  final int? serverId;
  final String? tempId;
  final int? tableId;
  final int orderTypeId;
  final int? waiterId;
  final String orderNumber;
  final String status;
  final double total;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool synced;
  const Order(
      {required this.id,
      this.serverId,
      this.tempId,
      this.tableId,
      required this.orderTypeId,
      this.waiterId,
      required this.orderNumber,
      required this.status,
      required this.total,
      required this.createdAt,
      required this.updatedAt,
      required this.synced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<int>(serverId);
    }
    if (!nullToAbsent || tempId != null) {
      map['temp_id'] = Variable<String>(tempId);
    }
    if (!nullToAbsent || tableId != null) {
      map['table_id'] = Variable<int>(tableId);
    }
    map['order_type_id'] = Variable<int>(orderTypeId);
    if (!nullToAbsent || waiterId != null) {
      map['waiter_id'] = Variable<int>(waiterId);
    }
    map['order_number'] = Variable<String>(orderNumber);
    map['status'] = Variable<String>(status);
    map['total'] = Variable<double>(total);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synced'] = Variable<bool>(synced);
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: Value(id),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
      tempId:
          tempId == null && nullToAbsent ? const Value.absent() : Value(tempId),
      tableId: tableId == null && nullToAbsent
          ? const Value.absent()
          : Value(tableId),
      orderTypeId: Value(orderTypeId),
      waiterId: waiterId == null && nullToAbsent
          ? const Value.absent()
          : Value(waiterId),
      orderNumber: Value(orderNumber),
      status: Value(status),
      total: Value(total),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synced: Value(synced),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Order(
      id: serializer.fromJson<int>(json['id']),
      serverId: serializer.fromJson<int?>(json['serverId']),
      tempId: serializer.fromJson<String?>(json['tempId']),
      tableId: serializer.fromJson<int?>(json['tableId']),
      orderTypeId: serializer.fromJson<int>(json['orderTypeId']),
      waiterId: serializer.fromJson<int?>(json['waiterId']),
      orderNumber: serializer.fromJson<String>(json['orderNumber']),
      status: serializer.fromJson<String>(json['status']),
      total: serializer.fromJson<double>(json['total']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serverId': serializer.toJson<int?>(serverId),
      'tempId': serializer.toJson<String?>(tempId),
      'tableId': serializer.toJson<int?>(tableId),
      'orderTypeId': serializer.toJson<int>(orderTypeId),
      'waiterId': serializer.toJson<int?>(waiterId),
      'orderNumber': serializer.toJson<String>(orderNumber),
      'status': serializer.toJson<String>(status),
      'total': serializer.toJson<double>(total),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  Order copyWith(
          {int? id,
          Value<int?> serverId = const Value.absent(),
          Value<String?> tempId = const Value.absent(),
          Value<int?> tableId = const Value.absent(),
          int? orderTypeId,
          Value<int?> waiterId = const Value.absent(),
          String? orderNumber,
          String? status,
          double? total,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? synced}) =>
      Order(
        id: id ?? this.id,
        serverId: serverId.present ? serverId.value : this.serverId,
        tempId: tempId.present ? tempId.value : this.tempId,
        tableId: tableId.present ? tableId.value : this.tableId,
        orderTypeId: orderTypeId ?? this.orderTypeId,
        waiterId: waiterId.present ? waiterId.value : this.waiterId,
        orderNumber: orderNumber ?? this.orderNumber,
        status: status ?? this.status,
        total: total ?? this.total,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        synced: synced ?? this.synced,
      );
  Order copyWithCompanion(OrdersCompanion data) {
    return Order(
      id: data.id.present ? data.id.value : this.id,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      tempId: data.tempId.present ? data.tempId.value : this.tempId,
      tableId: data.tableId.present ? data.tableId.value : this.tableId,
      orderTypeId:
          data.orderTypeId.present ? data.orderTypeId.value : this.orderTypeId,
      waiterId: data.waiterId.present ? data.waiterId.value : this.waiterId,
      orderNumber:
          data.orderNumber.present ? data.orderNumber.value : this.orderNumber,
      status: data.status.present ? data.status.value : this.status,
      total: data.total.present ? data.total.value : this.total,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      synced: data.synced.present ? data.synced.value : this.synced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('id: $id, ')
          ..write('serverId: $serverId, ')
          ..write('tempId: $tempId, ')
          ..write('tableId: $tableId, ')
          ..write('orderTypeId: $orderTypeId, ')
          ..write('waiterId: $waiterId, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('status: $status, ')
          ..write('total: $total, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, serverId, tempId, tableId, orderTypeId,
      waiterId, orderNumber, status, total, createdAt, updatedAt, synced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          other.id == this.id &&
          other.serverId == this.serverId &&
          other.tempId == this.tempId &&
          other.tableId == this.tableId &&
          other.orderTypeId == this.orderTypeId &&
          other.waiterId == this.waiterId &&
          other.orderNumber == this.orderNumber &&
          other.status == this.status &&
          other.total == this.total &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synced == this.synced);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<int> id;
  final Value<int?> serverId;
  final Value<String?> tempId;
  final Value<int?> tableId;
  final Value<int> orderTypeId;
  final Value<int?> waiterId;
  final Value<String> orderNumber;
  final Value<String> status;
  final Value<double> total;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> synced;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.serverId = const Value.absent(),
    this.tempId = const Value.absent(),
    this.tableId = const Value.absent(),
    this.orderTypeId = const Value.absent(),
    this.waiterId = const Value.absent(),
    this.orderNumber = const Value.absent(),
    this.status = const Value.absent(),
    this.total = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synced = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    this.serverId = const Value.absent(),
    this.tempId = const Value.absent(),
    this.tableId = const Value.absent(),
    required int orderTypeId,
    this.waiterId = const Value.absent(),
    required String orderNumber,
    required String status,
    required double total,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.synced = const Value.absent(),
  })  : orderTypeId = Value(orderTypeId),
        orderNumber = Value(orderNumber),
        status = Value(status),
        total = Value(total),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Order> custom({
    Expression<int>? id,
    Expression<int>? serverId,
    Expression<String>? tempId,
    Expression<int>? tableId,
    Expression<int>? orderTypeId,
    Expression<int>? waiterId,
    Expression<String>? orderNumber,
    Expression<String>? status,
    Expression<double>? total,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? synced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serverId != null) 'server_id': serverId,
      if (tempId != null) 'temp_id': tempId,
      if (tableId != null) 'table_id': tableId,
      if (orderTypeId != null) 'order_type_id': orderTypeId,
      if (waiterId != null) 'waiter_id': waiterId,
      if (orderNumber != null) 'order_number': orderNumber,
      if (status != null) 'status': status,
      if (total != null) 'total': total,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synced != null) 'synced': synced,
    });
  }

  OrdersCompanion copyWith(
      {Value<int>? id,
      Value<int?>? serverId,
      Value<String?>? tempId,
      Value<int?>? tableId,
      Value<int>? orderTypeId,
      Value<int?>? waiterId,
      Value<String>? orderNumber,
      Value<String>? status,
      Value<double>? total,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? synced}) {
    return OrdersCompanion(
      id: id ?? this.id,
      serverId: serverId ?? this.serverId,
      tempId: tempId ?? this.tempId,
      tableId: tableId ?? this.tableId,
      orderTypeId: orderTypeId ?? this.orderTypeId,
      waiterId: waiterId ?? this.waiterId,
      orderNumber: orderNumber ?? this.orderNumber,
      status: status ?? this.status,
      total: total ?? this.total,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synced: synced ?? this.synced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<int>(serverId.value);
    }
    if (tempId.present) {
      map['temp_id'] = Variable<String>(tempId.value);
    }
    if (tableId.present) {
      map['table_id'] = Variable<int>(tableId.value);
    }
    if (orderTypeId.present) {
      map['order_type_id'] = Variable<int>(orderTypeId.value);
    }
    if (waiterId.present) {
      map['waiter_id'] = Variable<int>(waiterId.value);
    }
    if (orderNumber.present) {
      map['order_number'] = Variable<String>(orderNumber.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('serverId: $serverId, ')
          ..write('tempId: $tempId, ')
          ..write('tableId: $tableId, ')
          ..write('orderTypeId: $orderTypeId, ')
          ..write('waiterId: $waiterId, ')
          ..write('orderNumber: $orderNumber, ')
          ..write('status: $status, ')
          ..write('total: $total, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }
}

class $OrderItemsTable extends OrderItems
    with TableInfo<$OrderItemsTable, OrderItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _menuItemIdMeta =
      const VerificationMeta('menuItemId');
  @override
  late final GeneratedColumn<int> menuItemId = GeneratedColumn<int>(
      'menu_item_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, orderId, menuItemId, quantity, price, amount, note, synced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_items';
  @override
  VerificationContext validateIntegrity(Insertable<OrderItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('menu_item_id')) {
      context.handle(
          _menuItemIdMeta,
          menuItemId.isAcceptableOrUnknown(
              data['menu_item_id']!, _menuItemIdMeta));
    } else if (isInserting) {
      context.missing(_menuItemIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id'])!,
      menuItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}menu_item_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
    );
  }

  @override
  $OrderItemsTable createAlias(String alias) {
    return $OrderItemsTable(attachedDatabase, alias);
  }
}

class OrderItem extends DataClass implements Insertable<OrderItem> {
  final int id;
  final int orderId;
  final int menuItemId;
  final int quantity;
  final double price;
  final double amount;
  final String? note;
  final bool synced;
  const OrderItem(
      {required this.id,
      required this.orderId,
      required this.menuItemId,
      required this.quantity,
      required this.price,
      required this.amount,
      this.note,
      required this.synced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_id'] = Variable<int>(orderId);
    map['menu_item_id'] = Variable<int>(menuItemId);
    map['quantity'] = Variable<int>(quantity);
    map['price'] = Variable<double>(price);
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['synced'] = Variable<bool>(synced);
    return map;
  }

  OrderItemsCompanion toCompanion(bool nullToAbsent) {
    return OrderItemsCompanion(
      id: Value(id),
      orderId: Value(orderId),
      menuItemId: Value(menuItemId),
      quantity: Value(quantity),
      price: Value(price),
      amount: Value(amount),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      synced: Value(synced),
    );
  }

  factory OrderItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderItem(
      id: serializer.fromJson<int>(json['id']),
      orderId: serializer.fromJson<int>(json['orderId']),
      menuItemId: serializer.fromJson<int>(json['menuItemId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      price: serializer.fromJson<double>(json['price']),
      amount: serializer.fromJson<double>(json['amount']),
      note: serializer.fromJson<String?>(json['note']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderId': serializer.toJson<int>(orderId),
      'menuItemId': serializer.toJson<int>(menuItemId),
      'quantity': serializer.toJson<int>(quantity),
      'price': serializer.toJson<double>(price),
      'amount': serializer.toJson<double>(amount),
      'note': serializer.toJson<String?>(note),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  OrderItem copyWith(
          {int? id,
          int? orderId,
          int? menuItemId,
          int? quantity,
          double? price,
          double? amount,
          Value<String?> note = const Value.absent(),
          bool? synced}) =>
      OrderItem(
        id: id ?? this.id,
        orderId: orderId ?? this.orderId,
        menuItemId: menuItemId ?? this.menuItemId,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        amount: amount ?? this.amount,
        note: note.present ? note.value : this.note,
        synced: synced ?? this.synced,
      );
  OrderItem copyWithCompanion(OrderItemsCompanion data) {
    return OrderItem(
      id: data.id.present ? data.id.value : this.id,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      menuItemId:
          data.menuItemId.present ? data.menuItemId.value : this.menuItemId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      price: data.price.present ? data.price.value : this.price,
      amount: data.amount.present ? data.amount.value : this.amount,
      note: data.note.present ? data.note.value : this.note,
      synced: data.synced.present ? data.synced.value : this.synced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderItem(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('menuItemId: $menuItemId, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('amount: $amount, ')
          ..write('note: $note, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, orderId, menuItemId, quantity, price, amount, note, synced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItem &&
          other.id == this.id &&
          other.orderId == this.orderId &&
          other.menuItemId == this.menuItemId &&
          other.quantity == this.quantity &&
          other.price == this.price &&
          other.amount == this.amount &&
          other.note == this.note &&
          other.synced == this.synced);
}

class OrderItemsCompanion extends UpdateCompanion<OrderItem> {
  final Value<int> id;
  final Value<int> orderId;
  final Value<int> menuItemId;
  final Value<int> quantity;
  final Value<double> price;
  final Value<double> amount;
  final Value<String?> note;
  final Value<bool> synced;
  const OrderItemsCompanion({
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.menuItemId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
    this.amount = const Value.absent(),
    this.note = const Value.absent(),
    this.synced = const Value.absent(),
  });
  OrderItemsCompanion.insert({
    this.id = const Value.absent(),
    required int orderId,
    required int menuItemId,
    required int quantity,
    required double price,
    required double amount,
    this.note = const Value.absent(),
    this.synced = const Value.absent(),
  })  : orderId = Value(orderId),
        menuItemId = Value(menuItemId),
        quantity = Value(quantity),
        price = Value(price),
        amount = Value(amount);
  static Insertable<OrderItem> custom({
    Expression<int>? id,
    Expression<int>? orderId,
    Expression<int>? menuItemId,
    Expression<int>? quantity,
    Expression<double>? price,
    Expression<double>? amount,
    Expression<String>? note,
    Expression<bool>? synced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderId != null) 'order_id': orderId,
      if (menuItemId != null) 'menu_item_id': menuItemId,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (amount != null) 'amount': amount,
      if (note != null) 'note': note,
      if (synced != null) 'synced': synced,
    });
  }

  OrderItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? orderId,
      Value<int>? menuItemId,
      Value<int>? quantity,
      Value<double>? price,
      Value<double>? amount,
      Value<String?>? note,
      Value<bool>? synced}) {
    return OrderItemsCompanion(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      menuItemId: menuItemId ?? this.menuItemId,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      synced: synced ?? this.synced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (menuItemId.present) {
      map['menu_item_id'] = Variable<int>(menuItemId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemsCompanion(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('menuItemId: $menuItemId, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('amount: $amount, ')
          ..write('note: $note, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }
}

class $KotsTable extends Kots with TableInfo<$KotsTable, Kot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _serverIdMeta =
      const VerificationMeta('serverId');
  @override
  late final GeneratedColumn<int> serverId = GeneratedColumn<int>(
      'server_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tempIdMeta = const VerificationMeta('tempId');
  @override
  late final GeneratedColumn<String> tempId = GeneratedColumn<String>(
      'temp_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _kotNumberMeta =
      const VerificationMeta('kotNumber');
  @override
  late final GeneratedColumn<int> kotNumber = GeneratedColumn<int>(
      'kot_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        serverId,
        tempId,
        orderId,
        kotNumber,
        status,
        createdAt,
        updatedAt,
        synced
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'kots';
  @override
  VerificationContext validateIntegrity(Insertable<Kot> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('server_id')) {
      context.handle(_serverIdMeta,
          serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta));
    }
    if (data.containsKey('temp_id')) {
      context.handle(_tempIdMeta,
          tempId.isAcceptableOrUnknown(data['temp_id']!, _tempIdMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('kot_number')) {
      context.handle(_kotNumberMeta,
          kotNumber.isAcceptableOrUnknown(data['kot_number']!, _kotNumberMeta));
    } else if (isInserting) {
      context.missing(_kotNumberMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Kot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Kot(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      serverId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}server_id']),
      tempId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}temp_id']),
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id'])!,
      kotNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kot_number'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
    );
  }

  @override
  $KotsTable createAlias(String alias) {
    return $KotsTable(attachedDatabase, alias);
  }
}

class Kot extends DataClass implements Insertable<Kot> {
  final int id;
  final int? serverId;
  final String? tempId;
  final int orderId;
  final int kotNumber;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool synced;
  const Kot(
      {required this.id,
      this.serverId,
      this.tempId,
      required this.orderId,
      required this.kotNumber,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      required this.synced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<int>(serverId);
    }
    if (!nullToAbsent || tempId != null) {
      map['temp_id'] = Variable<String>(tempId);
    }
    map['order_id'] = Variable<int>(orderId);
    map['kot_number'] = Variable<int>(kotNumber);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synced'] = Variable<bool>(synced);
    return map;
  }

  KotsCompanion toCompanion(bool nullToAbsent) {
    return KotsCompanion(
      id: Value(id),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
      tempId:
          tempId == null && nullToAbsent ? const Value.absent() : Value(tempId),
      orderId: Value(orderId),
      kotNumber: Value(kotNumber),
      status: Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synced: Value(synced),
    );
  }

  factory Kot.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Kot(
      id: serializer.fromJson<int>(json['id']),
      serverId: serializer.fromJson<int?>(json['serverId']),
      tempId: serializer.fromJson<String?>(json['tempId']),
      orderId: serializer.fromJson<int>(json['orderId']),
      kotNumber: serializer.fromJson<int>(json['kotNumber']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serverId': serializer.toJson<int?>(serverId),
      'tempId': serializer.toJson<String?>(tempId),
      'orderId': serializer.toJson<int>(orderId),
      'kotNumber': serializer.toJson<int>(kotNumber),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  Kot copyWith(
          {int? id,
          Value<int?> serverId = const Value.absent(),
          Value<String?> tempId = const Value.absent(),
          int? orderId,
          int? kotNumber,
          String? status,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? synced}) =>
      Kot(
        id: id ?? this.id,
        serverId: serverId.present ? serverId.value : this.serverId,
        tempId: tempId.present ? tempId.value : this.tempId,
        orderId: orderId ?? this.orderId,
        kotNumber: kotNumber ?? this.kotNumber,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        synced: synced ?? this.synced,
      );
  Kot copyWithCompanion(KotsCompanion data) {
    return Kot(
      id: data.id.present ? data.id.value : this.id,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      tempId: data.tempId.present ? data.tempId.value : this.tempId,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      kotNumber: data.kotNumber.present ? data.kotNumber.value : this.kotNumber,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      synced: data.synced.present ? data.synced.value : this.synced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Kot(')
          ..write('id: $id, ')
          ..write('serverId: $serverId, ')
          ..write('tempId: $tempId, ')
          ..write('orderId: $orderId, ')
          ..write('kotNumber: $kotNumber, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, serverId, tempId, orderId, kotNumber,
      status, createdAt, updatedAt, synced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Kot &&
          other.id == this.id &&
          other.serverId == this.serverId &&
          other.tempId == this.tempId &&
          other.orderId == this.orderId &&
          other.kotNumber == this.kotNumber &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synced == this.synced);
}

class KotsCompanion extends UpdateCompanion<Kot> {
  final Value<int> id;
  final Value<int?> serverId;
  final Value<String?> tempId;
  final Value<int> orderId;
  final Value<int> kotNumber;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> synced;
  const KotsCompanion({
    this.id = const Value.absent(),
    this.serverId = const Value.absent(),
    this.tempId = const Value.absent(),
    this.orderId = const Value.absent(),
    this.kotNumber = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synced = const Value.absent(),
  });
  KotsCompanion.insert({
    this.id = const Value.absent(),
    this.serverId = const Value.absent(),
    this.tempId = const Value.absent(),
    required int orderId,
    required int kotNumber,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.synced = const Value.absent(),
  })  : orderId = Value(orderId),
        kotNumber = Value(kotNumber),
        status = Value(status),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Kot> custom({
    Expression<int>? id,
    Expression<int>? serverId,
    Expression<String>? tempId,
    Expression<int>? orderId,
    Expression<int>? kotNumber,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? synced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serverId != null) 'server_id': serverId,
      if (tempId != null) 'temp_id': tempId,
      if (orderId != null) 'order_id': orderId,
      if (kotNumber != null) 'kot_number': kotNumber,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synced != null) 'synced': synced,
    });
  }

  KotsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? serverId,
      Value<String?>? tempId,
      Value<int>? orderId,
      Value<int>? kotNumber,
      Value<String>? status,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? synced}) {
    return KotsCompanion(
      id: id ?? this.id,
      serverId: serverId ?? this.serverId,
      tempId: tempId ?? this.tempId,
      orderId: orderId ?? this.orderId,
      kotNumber: kotNumber ?? this.kotNumber,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synced: synced ?? this.synced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<int>(serverId.value);
    }
    if (tempId.present) {
      map['temp_id'] = Variable<String>(tempId.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (kotNumber.present) {
      map['kot_number'] = Variable<int>(kotNumber.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KotsCompanion(')
          ..write('id: $id, ')
          ..write('serverId: $serverId, ')
          ..write('tempId: $tempId, ')
          ..write('orderId: $orderId, ')
          ..write('kotNumber: $kotNumber, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }
}

class $PaymentsTable extends Payments with TableInfo<$PaymentsTable, Payment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _serverIdMeta =
      const VerificationMeta('serverId');
  @override
  late final GeneratedColumn<int> serverId = GeneratedColumn<int>(
      'server_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tempIdMeta = const VerificationMeta('tempId');
  @override
  late final GeneratedColumn<String> tempId = GeneratedColumn<String>(
      'temp_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, serverId, tempId, orderId, paymentMethod, amount, createdAt, synced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payments';
  @override
  VerificationContext validateIntegrity(Insertable<Payment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('server_id')) {
      context.handle(_serverIdMeta,
          serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta));
    }
    if (data.containsKey('temp_id')) {
      context.handle(_tempIdMeta,
          tempId.isAcceptableOrUnknown(data['temp_id']!, _tempIdMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Payment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Payment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      serverId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}server_id']),
      tempId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}temp_id']),
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
    );
  }

  @override
  $PaymentsTable createAlias(String alias) {
    return $PaymentsTable(attachedDatabase, alias);
  }
}

class Payment extends DataClass implements Insertable<Payment> {
  final int id;
  final int? serverId;
  final String? tempId;
  final int orderId;
  final String paymentMethod;
  final double amount;
  final DateTime createdAt;
  final bool synced;
  const Payment(
      {required this.id,
      this.serverId,
      this.tempId,
      required this.orderId,
      required this.paymentMethod,
      required this.amount,
      required this.createdAt,
      required this.synced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<int>(serverId);
    }
    if (!nullToAbsent || tempId != null) {
      map['temp_id'] = Variable<String>(tempId);
    }
    map['order_id'] = Variable<int>(orderId);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['amount'] = Variable<double>(amount);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['synced'] = Variable<bool>(synced);
    return map;
  }

  PaymentsCompanion toCompanion(bool nullToAbsent) {
    return PaymentsCompanion(
      id: Value(id),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
      tempId:
          tempId == null && nullToAbsent ? const Value.absent() : Value(tempId),
      orderId: Value(orderId),
      paymentMethod: Value(paymentMethod),
      amount: Value(amount),
      createdAt: Value(createdAt),
      synced: Value(synced),
    );
  }

  factory Payment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Payment(
      id: serializer.fromJson<int>(json['id']),
      serverId: serializer.fromJson<int?>(json['serverId']),
      tempId: serializer.fromJson<String?>(json['tempId']),
      orderId: serializer.fromJson<int>(json['orderId']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      amount: serializer.fromJson<double>(json['amount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serverId': serializer.toJson<int?>(serverId),
      'tempId': serializer.toJson<String?>(tempId),
      'orderId': serializer.toJson<int>(orderId),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'amount': serializer.toJson<double>(amount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  Payment copyWith(
          {int? id,
          Value<int?> serverId = const Value.absent(),
          Value<String?> tempId = const Value.absent(),
          int? orderId,
          String? paymentMethod,
          double? amount,
          DateTime? createdAt,
          bool? synced}) =>
      Payment(
        id: id ?? this.id,
        serverId: serverId.present ? serverId.value : this.serverId,
        tempId: tempId.present ? tempId.value : this.tempId,
        orderId: orderId ?? this.orderId,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        amount: amount ?? this.amount,
        createdAt: createdAt ?? this.createdAt,
        synced: synced ?? this.synced,
      );
  Payment copyWithCompanion(PaymentsCompanion data) {
    return Payment(
      id: data.id.present ? data.id.value : this.id,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      tempId: data.tempId.present ? data.tempId.value : this.tempId,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      amount: data.amount.present ? data.amount.value : this.amount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      synced: data.synced.present ? data.synced.value : this.synced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Payment(')
          ..write('id: $id, ')
          ..write('serverId: $serverId, ')
          ..write('tempId: $tempId, ')
          ..write('orderId: $orderId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, serverId, tempId, orderId, paymentMethod, amount, createdAt, synced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Payment &&
          other.id == this.id &&
          other.serverId == this.serverId &&
          other.tempId == this.tempId &&
          other.orderId == this.orderId &&
          other.paymentMethod == this.paymentMethod &&
          other.amount == this.amount &&
          other.createdAt == this.createdAt &&
          other.synced == this.synced);
}

class PaymentsCompanion extends UpdateCompanion<Payment> {
  final Value<int> id;
  final Value<int?> serverId;
  final Value<String?> tempId;
  final Value<int> orderId;
  final Value<String> paymentMethod;
  final Value<double> amount;
  final Value<DateTime> createdAt;
  final Value<bool> synced;
  const PaymentsCompanion({
    this.id = const Value.absent(),
    this.serverId = const Value.absent(),
    this.tempId = const Value.absent(),
    this.orderId = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.amount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.synced = const Value.absent(),
  });
  PaymentsCompanion.insert({
    this.id = const Value.absent(),
    this.serverId = const Value.absent(),
    this.tempId = const Value.absent(),
    required int orderId,
    required String paymentMethod,
    required double amount,
    required DateTime createdAt,
    this.synced = const Value.absent(),
  })  : orderId = Value(orderId),
        paymentMethod = Value(paymentMethod),
        amount = Value(amount),
        createdAt = Value(createdAt);
  static Insertable<Payment> custom({
    Expression<int>? id,
    Expression<int>? serverId,
    Expression<String>? tempId,
    Expression<int>? orderId,
    Expression<String>? paymentMethod,
    Expression<double>? amount,
    Expression<DateTime>? createdAt,
    Expression<bool>? synced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serverId != null) 'server_id': serverId,
      if (tempId != null) 'temp_id': tempId,
      if (orderId != null) 'order_id': orderId,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (amount != null) 'amount': amount,
      if (createdAt != null) 'created_at': createdAt,
      if (synced != null) 'synced': synced,
    });
  }

  PaymentsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? serverId,
      Value<String?>? tempId,
      Value<int>? orderId,
      Value<String>? paymentMethod,
      Value<double>? amount,
      Value<DateTime>? createdAt,
      Value<bool>? synced}) {
    return PaymentsCompanion(
      id: id ?? this.id,
      serverId: serverId ?? this.serverId,
      tempId: tempId ?? this.tempId,
      orderId: orderId ?? this.orderId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      synced: synced ?? this.synced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<int>(serverId.value);
    }
    if (tempId.present) {
      map['temp_id'] = Variable<String>(tempId.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentsCompanion(')
          ..write('id: $id, ')
          ..write('serverId: $serverId, ')
          ..write('tempId: $tempId, ')
          ..write('orderId: $orderId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }
}

class $MenuItemsTable extends MenuItems
    with TableInfo<$MenuItemsTable, MenuItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MenuItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _serverIdMeta =
      const VerificationMeta('serverId');
  @override
  late final GeneratedColumn<int> serverId = GeneratedColumn<int>(
      'server_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isAvailableMeta =
      const VerificationMeta('isAvailable');
  @override
  late final GeneratedColumn<bool> isAvailable = GeneratedColumn<bool>(
      'is_available', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_available" IN (0, 1))'));
  static const VerificationMeta _lastSyncedMeta =
      const VerificationMeta('lastSynced');
  @override
  late final GeneratedColumn<DateTime> lastSynced = GeneratedColumn<DateTime>(
      'last_synced', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, serverId, name, price, categoryId, isAvailable, lastSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'menu_items';
  @override
  VerificationContext validateIntegrity(Insertable<MenuItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('server_id')) {
      context.handle(_serverIdMeta,
          serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta));
    } else if (isInserting) {
      context.missing(_serverIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('is_available')) {
      context.handle(
          _isAvailableMeta,
          isAvailable.isAcceptableOrUnknown(
              data['is_available']!, _isAvailableMeta));
    } else if (isInserting) {
      context.missing(_isAvailableMeta);
    }
    if (data.containsKey('last_synced')) {
      context.handle(
          _lastSyncedMeta,
          lastSynced.isAcceptableOrUnknown(
              data['last_synced']!, _lastSyncedMeta));
    } else if (isInserting) {
      context.missing(_lastSyncedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MenuItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MenuItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      serverId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}server_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id']),
      isAvailable: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_available'])!,
      lastSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_synced'])!,
    );
  }

  @override
  $MenuItemsTable createAlias(String alias) {
    return $MenuItemsTable(attachedDatabase, alias);
  }
}

class MenuItem extends DataClass implements Insertable<MenuItem> {
  final int id;
  final int serverId;
  final String name;
  final double price;
  final int? categoryId;
  final bool isAvailable;
  final DateTime lastSynced;
  const MenuItem(
      {required this.id,
      required this.serverId,
      required this.name,
      required this.price,
      this.categoryId,
      required this.isAvailable,
      required this.lastSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['server_id'] = Variable<int>(serverId);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    map['is_available'] = Variable<bool>(isAvailable);
    map['last_synced'] = Variable<DateTime>(lastSynced);
    return map;
  }

  MenuItemsCompanion toCompanion(bool nullToAbsent) {
    return MenuItemsCompanion(
      id: Value(id),
      serverId: Value(serverId),
      name: Value(name),
      price: Value(price),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      isAvailable: Value(isAvailable),
      lastSynced: Value(lastSynced),
    );
  }

  factory MenuItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MenuItem(
      id: serializer.fromJson<int>(json['id']),
      serverId: serializer.fromJson<int>(json['serverId']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
      isAvailable: serializer.fromJson<bool>(json['isAvailable']),
      lastSynced: serializer.fromJson<DateTime>(json['lastSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serverId': serializer.toJson<int>(serverId),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
      'categoryId': serializer.toJson<int?>(categoryId),
      'isAvailable': serializer.toJson<bool>(isAvailable),
      'lastSynced': serializer.toJson<DateTime>(lastSynced),
    };
  }

  MenuItem copyWith(
          {int? id,
          int? serverId,
          String? name,
          double? price,
          Value<int?> categoryId = const Value.absent(),
          bool? isAvailable,
          DateTime? lastSynced}) =>
      MenuItem(
        id: id ?? this.id,
        serverId: serverId ?? this.serverId,
        name: name ?? this.name,
        price: price ?? this.price,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        isAvailable: isAvailable ?? this.isAvailable,
        lastSynced: lastSynced ?? this.lastSynced,
      );
  MenuItem copyWithCompanion(MenuItemsCompanion data) {
    return MenuItem(
      id: data.id.present ? data.id.value : this.id,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      isAvailable:
          data.isAvailable.present ? data.isAvailable.value : this.isAvailable,
      lastSynced:
          data.lastSynced.present ? data.lastSynced.value : this.lastSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MenuItem(')
          ..write('id: $id, ')
          ..write('serverId: $serverId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('categoryId: $categoryId, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('lastSynced: $lastSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, serverId, name, price, categoryId, isAvailable, lastSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MenuItem &&
          other.id == this.id &&
          other.serverId == this.serverId &&
          other.name == this.name &&
          other.price == this.price &&
          other.categoryId == this.categoryId &&
          other.isAvailable == this.isAvailable &&
          other.lastSynced == this.lastSynced);
}

class MenuItemsCompanion extends UpdateCompanion<MenuItem> {
  final Value<int> id;
  final Value<int> serverId;
  final Value<String> name;
  final Value<double> price;
  final Value<int?> categoryId;
  final Value<bool> isAvailable;
  final Value<DateTime> lastSynced;
  const MenuItemsCompanion({
    this.id = const Value.absent(),
    this.serverId = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.isAvailable = const Value.absent(),
    this.lastSynced = const Value.absent(),
  });
  MenuItemsCompanion.insert({
    this.id = const Value.absent(),
    required int serverId,
    required String name,
    required double price,
    this.categoryId = const Value.absent(),
    required bool isAvailable,
    required DateTime lastSynced,
  })  : serverId = Value(serverId),
        name = Value(name),
        price = Value(price),
        isAvailable = Value(isAvailable),
        lastSynced = Value(lastSynced);
  static Insertable<MenuItem> custom({
    Expression<int>? id,
    Expression<int>? serverId,
    Expression<String>? name,
    Expression<double>? price,
    Expression<int>? categoryId,
    Expression<bool>? isAvailable,
    Expression<DateTime>? lastSynced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serverId != null) 'server_id': serverId,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (categoryId != null) 'category_id': categoryId,
      if (isAvailable != null) 'is_available': isAvailable,
      if (lastSynced != null) 'last_synced': lastSynced,
    });
  }

  MenuItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? serverId,
      Value<String>? name,
      Value<double>? price,
      Value<int?>? categoryId,
      Value<bool>? isAvailable,
      Value<DateTime>? lastSynced}) {
    return MenuItemsCompanion(
      id: id ?? this.id,
      serverId: serverId ?? this.serverId,
      name: name ?? this.name,
      price: price ?? this.price,
      categoryId: categoryId ?? this.categoryId,
      isAvailable: isAvailable ?? this.isAvailable,
      lastSynced: lastSynced ?? this.lastSynced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<int>(serverId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (isAvailable.present) {
      map['is_available'] = Variable<bool>(isAvailable.value);
    }
    if (lastSynced.present) {
      map['last_synced'] = Variable<DateTime>(lastSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MenuItemsCompanion(')
          ..write('id: $id, ')
          ..write('serverId: $serverId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('categoryId: $categoryId, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('lastSynced: $lastSynced')
          ..write(')'))
        .toString();
  }
}

class $RestaurantTablesTable extends RestaurantTables
    with TableInfo<$RestaurantTablesTable, RestaurantTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RestaurantTablesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _serverIdMeta =
      const VerificationMeta('serverId');
  @override
  late final GeneratedColumn<int> serverId = GeneratedColumn<int>(
      'server_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tableCodeMeta =
      const VerificationMeta('tableCode');
  @override
  late final GeneratedColumn<String> tableCode = GeneratedColumn<String>(
      'table_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _areaIdMeta = const VerificationMeta('areaId');
  @override
  late final GeneratedColumn<int> areaId = GeneratedColumn<int>(
      'area_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _capacityMeta =
      const VerificationMeta('capacity');
  @override
  late final GeneratedColumn<int> capacity = GeneratedColumn<int>(
      'capacity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastSyncedMeta =
      const VerificationMeta('lastSynced');
  @override
  late final GeneratedColumn<DateTime> lastSynced = GeneratedColumn<DateTime>(
      'last_synced', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, serverId, tableCode, areaId, capacity, lastSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'restaurant_tables';
  @override
  VerificationContext validateIntegrity(Insertable<RestaurantTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('server_id')) {
      context.handle(_serverIdMeta,
          serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta));
    } else if (isInserting) {
      context.missing(_serverIdMeta);
    }
    if (data.containsKey('table_code')) {
      context.handle(_tableCodeMeta,
          tableCode.isAcceptableOrUnknown(data['table_code']!, _tableCodeMeta));
    } else if (isInserting) {
      context.missing(_tableCodeMeta);
    }
    if (data.containsKey('area_id')) {
      context.handle(_areaIdMeta,
          areaId.isAcceptableOrUnknown(data['area_id']!, _areaIdMeta));
    }
    if (data.containsKey('capacity')) {
      context.handle(_capacityMeta,
          capacity.isAcceptableOrUnknown(data['capacity']!, _capacityMeta));
    } else if (isInserting) {
      context.missing(_capacityMeta);
    }
    if (data.containsKey('last_synced')) {
      context.handle(
          _lastSyncedMeta,
          lastSynced.isAcceptableOrUnknown(
              data['last_synced']!, _lastSyncedMeta));
    } else if (isInserting) {
      context.missing(_lastSyncedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RestaurantTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RestaurantTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      serverId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}server_id'])!,
      tableCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}table_code'])!,
      areaId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}area_id']),
      capacity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}capacity'])!,
      lastSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_synced'])!,
    );
  }

  @override
  $RestaurantTablesTable createAlias(String alias) {
    return $RestaurantTablesTable(attachedDatabase, alias);
  }
}

class RestaurantTable extends DataClass implements Insertable<RestaurantTable> {
  final int id;
  final int serverId;
  final String tableCode;
  final int? areaId;
  final int capacity;
  final DateTime lastSynced;
  const RestaurantTable(
      {required this.id,
      required this.serverId,
      required this.tableCode,
      this.areaId,
      required this.capacity,
      required this.lastSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['server_id'] = Variable<int>(serverId);
    map['table_code'] = Variable<String>(tableCode);
    if (!nullToAbsent || areaId != null) {
      map['area_id'] = Variable<int>(areaId);
    }
    map['capacity'] = Variable<int>(capacity);
    map['last_synced'] = Variable<DateTime>(lastSynced);
    return map;
  }

  RestaurantTablesCompanion toCompanion(bool nullToAbsent) {
    return RestaurantTablesCompanion(
      id: Value(id),
      serverId: Value(serverId),
      tableCode: Value(tableCode),
      areaId:
          areaId == null && nullToAbsent ? const Value.absent() : Value(areaId),
      capacity: Value(capacity),
      lastSynced: Value(lastSynced),
    );
  }

  factory RestaurantTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RestaurantTable(
      id: serializer.fromJson<int>(json['id']),
      serverId: serializer.fromJson<int>(json['serverId']),
      tableCode: serializer.fromJson<String>(json['tableCode']),
      areaId: serializer.fromJson<int?>(json['areaId']),
      capacity: serializer.fromJson<int>(json['capacity']),
      lastSynced: serializer.fromJson<DateTime>(json['lastSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serverId': serializer.toJson<int>(serverId),
      'tableCode': serializer.toJson<String>(tableCode),
      'areaId': serializer.toJson<int?>(areaId),
      'capacity': serializer.toJson<int>(capacity),
      'lastSynced': serializer.toJson<DateTime>(lastSynced),
    };
  }

  RestaurantTable copyWith(
          {int? id,
          int? serverId,
          String? tableCode,
          Value<int?> areaId = const Value.absent(),
          int? capacity,
          DateTime? lastSynced}) =>
      RestaurantTable(
        id: id ?? this.id,
        serverId: serverId ?? this.serverId,
        tableCode: tableCode ?? this.tableCode,
        areaId: areaId.present ? areaId.value : this.areaId,
        capacity: capacity ?? this.capacity,
        lastSynced: lastSynced ?? this.lastSynced,
      );
  RestaurantTable copyWithCompanion(RestaurantTablesCompanion data) {
    return RestaurantTable(
      id: data.id.present ? data.id.value : this.id,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      tableCode: data.tableCode.present ? data.tableCode.value : this.tableCode,
      areaId: data.areaId.present ? data.areaId.value : this.areaId,
      capacity: data.capacity.present ? data.capacity.value : this.capacity,
      lastSynced:
          data.lastSynced.present ? data.lastSynced.value : this.lastSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RestaurantTable(')
          ..write('id: $id, ')
          ..write('serverId: $serverId, ')
          ..write('tableCode: $tableCode, ')
          ..write('areaId: $areaId, ')
          ..write('capacity: $capacity, ')
          ..write('lastSynced: $lastSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, serverId, tableCode, areaId, capacity, lastSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RestaurantTable &&
          other.id == this.id &&
          other.serverId == this.serverId &&
          other.tableCode == this.tableCode &&
          other.areaId == this.areaId &&
          other.capacity == this.capacity &&
          other.lastSynced == this.lastSynced);
}

class RestaurantTablesCompanion extends UpdateCompanion<RestaurantTable> {
  final Value<int> id;
  final Value<int> serverId;
  final Value<String> tableCode;
  final Value<int?> areaId;
  final Value<int> capacity;
  final Value<DateTime> lastSynced;
  const RestaurantTablesCompanion({
    this.id = const Value.absent(),
    this.serverId = const Value.absent(),
    this.tableCode = const Value.absent(),
    this.areaId = const Value.absent(),
    this.capacity = const Value.absent(),
    this.lastSynced = const Value.absent(),
  });
  RestaurantTablesCompanion.insert({
    this.id = const Value.absent(),
    required int serverId,
    required String tableCode,
    this.areaId = const Value.absent(),
    required int capacity,
    required DateTime lastSynced,
  })  : serverId = Value(serverId),
        tableCode = Value(tableCode),
        capacity = Value(capacity),
        lastSynced = Value(lastSynced);
  static Insertable<RestaurantTable> custom({
    Expression<int>? id,
    Expression<int>? serverId,
    Expression<String>? tableCode,
    Expression<int>? areaId,
    Expression<int>? capacity,
    Expression<DateTime>? lastSynced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serverId != null) 'server_id': serverId,
      if (tableCode != null) 'table_code': tableCode,
      if (areaId != null) 'area_id': areaId,
      if (capacity != null) 'capacity': capacity,
      if (lastSynced != null) 'last_synced': lastSynced,
    });
  }

  RestaurantTablesCompanion copyWith(
      {Value<int>? id,
      Value<int>? serverId,
      Value<String>? tableCode,
      Value<int?>? areaId,
      Value<int>? capacity,
      Value<DateTime>? lastSynced}) {
    return RestaurantTablesCompanion(
      id: id ?? this.id,
      serverId: serverId ?? this.serverId,
      tableCode: tableCode ?? this.tableCode,
      areaId: areaId ?? this.areaId,
      capacity: capacity ?? this.capacity,
      lastSynced: lastSynced ?? this.lastSynced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<int>(serverId.value);
    }
    if (tableCode.present) {
      map['table_code'] = Variable<String>(tableCode.value);
    }
    if (areaId.present) {
      map['area_id'] = Variable<int>(areaId.value);
    }
    if (capacity.present) {
      map['capacity'] = Variable<int>(capacity.value);
    }
    if (lastSynced.present) {
      map['last_synced'] = Variable<DateTime>(lastSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RestaurantTablesCompanion(')
          ..write('id: $id, ')
          ..write('serverId: $serverId, ')
          ..write('tableCode: $tableCode, ')
          ..write('areaId: $areaId, ')
          ..write('capacity: $capacity, ')
          ..write('lastSynced: $lastSynced')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $OrdersTable orders = $OrdersTable(this);
  late final $OrderItemsTable orderItems = $OrderItemsTable(this);
  late final $KotsTable kots = $KotsTable(this);
  late final $PaymentsTable payments = $PaymentsTable(this);
  late final $MenuItemsTable menuItems = $MenuItemsTable(this);
  late final $RestaurantTablesTable restaurantTables =
      $RestaurantTablesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [orders, orderItems, kots, payments, menuItems, restaurantTables];
}

typedef $$OrdersTableCreateCompanionBuilder = OrdersCompanion Function({
  Value<int> id,
  Value<int?> serverId,
  Value<String?> tempId,
  Value<int?> tableId,
  required int orderTypeId,
  Value<int?> waiterId,
  required String orderNumber,
  required String status,
  required double total,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<bool> synced,
});
typedef $$OrdersTableUpdateCompanionBuilder = OrdersCompanion Function({
  Value<int> id,
  Value<int?> serverId,
  Value<String?> tempId,
  Value<int?> tableId,
  Value<int> orderTypeId,
  Value<int?> waiterId,
  Value<String> orderNumber,
  Value<String> status,
  Value<double> total,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> synced,
});

class $$OrdersTableFilterComposer
    extends Composer<_$AppDatabase, $OrdersTable> {
  $$OrdersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get serverId => $composableBuilder(
      column: $table.serverId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tempId => $composableBuilder(
      column: $table.tempId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get tableId => $composableBuilder(
      column: $table.tableId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get orderTypeId => $composableBuilder(
      column: $table.orderTypeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get waiterId => $composableBuilder(
      column: $table.waiterId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnFilters(column));
}

class $$OrdersTableOrderingComposer
    extends Composer<_$AppDatabase, $OrdersTable> {
  $$OrdersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get serverId => $composableBuilder(
      column: $table.serverId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tempId => $composableBuilder(
      column: $table.tempId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get tableId => $composableBuilder(
      column: $table.tableId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get orderTypeId => $composableBuilder(
      column: $table.orderTypeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get waiterId => $composableBuilder(
      column: $table.waiterId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnOrderings(column));
}

class $$OrdersTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrdersTable> {
  $$OrdersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get tempId =>
      $composableBuilder(column: $table.tempId, builder: (column) => column);

  GeneratedColumn<int> get tableId =>
      $composableBuilder(column: $table.tableId, builder: (column) => column);

  GeneratedColumn<int> get orderTypeId => $composableBuilder(
      column: $table.orderTypeId, builder: (column) => column);

  GeneratedColumn<int> get waiterId =>
      $composableBuilder(column: $table.waiterId, builder: (column) => column);

  GeneratedColumn<String> get orderNumber => $composableBuilder(
      column: $table.orderNumber, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);
}

class $$OrdersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OrdersTable,
    Order,
    $$OrdersTableFilterComposer,
    $$OrdersTableOrderingComposer,
    $$OrdersTableAnnotationComposer,
    $$OrdersTableCreateCompanionBuilder,
    $$OrdersTableUpdateCompanionBuilder,
    (Order, BaseReferences<_$AppDatabase, $OrdersTable, Order>),
    Order,
    PrefetchHooks Function()> {
  $$OrdersTableTableManager(_$AppDatabase db, $OrdersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrdersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrdersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrdersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> serverId = const Value.absent(),
            Value<String?> tempId = const Value.absent(),
            Value<int?> tableId = const Value.absent(),
            Value<int> orderTypeId = const Value.absent(),
            Value<int?> waiterId = const Value.absent(),
            Value<String> orderNumber = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<double> total = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> synced = const Value.absent(),
          }) =>
              OrdersCompanion(
            id: id,
            serverId: serverId,
            tempId: tempId,
            tableId: tableId,
            orderTypeId: orderTypeId,
            waiterId: waiterId,
            orderNumber: orderNumber,
            status: status,
            total: total,
            createdAt: createdAt,
            updatedAt: updatedAt,
            synced: synced,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> serverId = const Value.absent(),
            Value<String?> tempId = const Value.absent(),
            Value<int?> tableId = const Value.absent(),
            required int orderTypeId,
            Value<int?> waiterId = const Value.absent(),
            required String orderNumber,
            required String status,
            required double total,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<bool> synced = const Value.absent(),
          }) =>
              OrdersCompanion.insert(
            id: id,
            serverId: serverId,
            tempId: tempId,
            tableId: tableId,
            orderTypeId: orderTypeId,
            waiterId: waiterId,
            orderNumber: orderNumber,
            status: status,
            total: total,
            createdAt: createdAt,
            updatedAt: updatedAt,
            synced: synced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OrdersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OrdersTable,
    Order,
    $$OrdersTableFilterComposer,
    $$OrdersTableOrderingComposer,
    $$OrdersTableAnnotationComposer,
    $$OrdersTableCreateCompanionBuilder,
    $$OrdersTableUpdateCompanionBuilder,
    (Order, BaseReferences<_$AppDatabase, $OrdersTable, Order>),
    Order,
    PrefetchHooks Function()>;
typedef $$OrderItemsTableCreateCompanionBuilder = OrderItemsCompanion Function({
  Value<int> id,
  required int orderId,
  required int menuItemId,
  required int quantity,
  required double price,
  required double amount,
  Value<String?> note,
  Value<bool> synced,
});
typedef $$OrderItemsTableUpdateCompanionBuilder = OrderItemsCompanion Function({
  Value<int> id,
  Value<int> orderId,
  Value<int> menuItemId,
  Value<int> quantity,
  Value<double> price,
  Value<double> amount,
  Value<String?> note,
  Value<bool> synced,
});

class $$OrderItemsTableFilterComposer
    extends Composer<_$AppDatabase, $OrderItemsTable> {
  $$OrderItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get orderId => $composableBuilder(
      column: $table.orderId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get menuItemId => $composableBuilder(
      column: $table.menuItemId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnFilters(column));
}

class $$OrderItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderItemsTable> {
  $$OrderItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get orderId => $composableBuilder(
      column: $table.orderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get menuItemId => $composableBuilder(
      column: $table.menuItemId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnOrderings(column));
}

class $$OrderItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderItemsTable> {
  $$OrderItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get orderId =>
      $composableBuilder(column: $table.orderId, builder: (column) => column);

  GeneratedColumn<int> get menuItemId => $composableBuilder(
      column: $table.menuItemId, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);
}

class $$OrderItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OrderItemsTable,
    OrderItem,
    $$OrderItemsTableFilterComposer,
    $$OrderItemsTableOrderingComposer,
    $$OrderItemsTableAnnotationComposer,
    $$OrderItemsTableCreateCompanionBuilder,
    $$OrderItemsTableUpdateCompanionBuilder,
    (OrderItem, BaseReferences<_$AppDatabase, $OrderItemsTable, OrderItem>),
    OrderItem,
    PrefetchHooks Function()> {
  $$OrderItemsTableTableManager(_$AppDatabase db, $OrderItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> orderId = const Value.absent(),
            Value<int> menuItemId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<bool> synced = const Value.absent(),
          }) =>
              OrderItemsCompanion(
            id: id,
            orderId: orderId,
            menuItemId: menuItemId,
            quantity: quantity,
            price: price,
            amount: amount,
            note: note,
            synced: synced,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int orderId,
            required int menuItemId,
            required int quantity,
            required double price,
            required double amount,
            Value<String?> note = const Value.absent(),
            Value<bool> synced = const Value.absent(),
          }) =>
              OrderItemsCompanion.insert(
            id: id,
            orderId: orderId,
            menuItemId: menuItemId,
            quantity: quantity,
            price: price,
            amount: amount,
            note: note,
            synced: synced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OrderItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OrderItemsTable,
    OrderItem,
    $$OrderItemsTableFilterComposer,
    $$OrderItemsTableOrderingComposer,
    $$OrderItemsTableAnnotationComposer,
    $$OrderItemsTableCreateCompanionBuilder,
    $$OrderItemsTableUpdateCompanionBuilder,
    (OrderItem, BaseReferences<_$AppDatabase, $OrderItemsTable, OrderItem>),
    OrderItem,
    PrefetchHooks Function()>;
typedef $$KotsTableCreateCompanionBuilder = KotsCompanion Function({
  Value<int> id,
  Value<int?> serverId,
  Value<String?> tempId,
  required int orderId,
  required int kotNumber,
  required String status,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<bool> synced,
});
typedef $$KotsTableUpdateCompanionBuilder = KotsCompanion Function({
  Value<int> id,
  Value<int?> serverId,
  Value<String?> tempId,
  Value<int> orderId,
  Value<int> kotNumber,
  Value<String> status,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> synced,
});

class $$KotsTableFilterComposer extends Composer<_$AppDatabase, $KotsTable> {
  $$KotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get serverId => $composableBuilder(
      column: $table.serverId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tempId => $composableBuilder(
      column: $table.tempId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get orderId => $composableBuilder(
      column: $table.orderId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get kotNumber => $composableBuilder(
      column: $table.kotNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnFilters(column));
}

class $$KotsTableOrderingComposer extends Composer<_$AppDatabase, $KotsTable> {
  $$KotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get serverId => $composableBuilder(
      column: $table.serverId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tempId => $composableBuilder(
      column: $table.tempId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get orderId => $composableBuilder(
      column: $table.orderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get kotNumber => $composableBuilder(
      column: $table.kotNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnOrderings(column));
}

class $$KotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $KotsTable> {
  $$KotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get tempId =>
      $composableBuilder(column: $table.tempId, builder: (column) => column);

  GeneratedColumn<int> get orderId =>
      $composableBuilder(column: $table.orderId, builder: (column) => column);

  GeneratedColumn<int> get kotNumber =>
      $composableBuilder(column: $table.kotNumber, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);
}

class $$KotsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $KotsTable,
    Kot,
    $$KotsTableFilterComposer,
    $$KotsTableOrderingComposer,
    $$KotsTableAnnotationComposer,
    $$KotsTableCreateCompanionBuilder,
    $$KotsTableUpdateCompanionBuilder,
    (Kot, BaseReferences<_$AppDatabase, $KotsTable, Kot>),
    Kot,
    PrefetchHooks Function()> {
  $$KotsTableTableManager(_$AppDatabase db, $KotsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KotsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> serverId = const Value.absent(),
            Value<String?> tempId = const Value.absent(),
            Value<int> orderId = const Value.absent(),
            Value<int> kotNumber = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> synced = const Value.absent(),
          }) =>
              KotsCompanion(
            id: id,
            serverId: serverId,
            tempId: tempId,
            orderId: orderId,
            kotNumber: kotNumber,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
            synced: synced,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> serverId = const Value.absent(),
            Value<String?> tempId = const Value.absent(),
            required int orderId,
            required int kotNumber,
            required String status,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<bool> synced = const Value.absent(),
          }) =>
              KotsCompanion.insert(
            id: id,
            serverId: serverId,
            tempId: tempId,
            orderId: orderId,
            kotNumber: kotNumber,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
            synced: synced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$KotsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $KotsTable,
    Kot,
    $$KotsTableFilterComposer,
    $$KotsTableOrderingComposer,
    $$KotsTableAnnotationComposer,
    $$KotsTableCreateCompanionBuilder,
    $$KotsTableUpdateCompanionBuilder,
    (Kot, BaseReferences<_$AppDatabase, $KotsTable, Kot>),
    Kot,
    PrefetchHooks Function()>;
typedef $$PaymentsTableCreateCompanionBuilder = PaymentsCompanion Function({
  Value<int> id,
  Value<int?> serverId,
  Value<String?> tempId,
  required int orderId,
  required String paymentMethod,
  required double amount,
  required DateTime createdAt,
  Value<bool> synced,
});
typedef $$PaymentsTableUpdateCompanionBuilder = PaymentsCompanion Function({
  Value<int> id,
  Value<int?> serverId,
  Value<String?> tempId,
  Value<int> orderId,
  Value<String> paymentMethod,
  Value<double> amount,
  Value<DateTime> createdAt,
  Value<bool> synced,
});

class $$PaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get serverId => $composableBuilder(
      column: $table.serverId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tempId => $composableBuilder(
      column: $table.tempId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get orderId => $composableBuilder(
      column: $table.orderId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnFilters(column));
}

class $$PaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get serverId => $composableBuilder(
      column: $table.serverId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tempId => $composableBuilder(
      column: $table.tempId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get orderId => $composableBuilder(
      column: $table.orderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnOrderings(column));
}

class $$PaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get tempId =>
      $composableBuilder(column: $table.tempId, builder: (column) => column);

  GeneratedColumn<int> get orderId =>
      $composableBuilder(column: $table.orderId, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);
}

class $$PaymentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PaymentsTable,
    Payment,
    $$PaymentsTableFilterComposer,
    $$PaymentsTableOrderingComposer,
    $$PaymentsTableAnnotationComposer,
    $$PaymentsTableCreateCompanionBuilder,
    $$PaymentsTableUpdateCompanionBuilder,
    (Payment, BaseReferences<_$AppDatabase, $PaymentsTable, Payment>),
    Payment,
    PrefetchHooks Function()> {
  $$PaymentsTableTableManager(_$AppDatabase db, $PaymentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> serverId = const Value.absent(),
            Value<String?> tempId = const Value.absent(),
            Value<int> orderId = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<bool> synced = const Value.absent(),
          }) =>
              PaymentsCompanion(
            id: id,
            serverId: serverId,
            tempId: tempId,
            orderId: orderId,
            paymentMethod: paymentMethod,
            amount: amount,
            createdAt: createdAt,
            synced: synced,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> serverId = const Value.absent(),
            Value<String?> tempId = const Value.absent(),
            required int orderId,
            required String paymentMethod,
            required double amount,
            required DateTime createdAt,
            Value<bool> synced = const Value.absent(),
          }) =>
              PaymentsCompanion.insert(
            id: id,
            serverId: serverId,
            tempId: tempId,
            orderId: orderId,
            paymentMethod: paymentMethod,
            amount: amount,
            createdAt: createdAt,
            synced: synced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PaymentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PaymentsTable,
    Payment,
    $$PaymentsTableFilterComposer,
    $$PaymentsTableOrderingComposer,
    $$PaymentsTableAnnotationComposer,
    $$PaymentsTableCreateCompanionBuilder,
    $$PaymentsTableUpdateCompanionBuilder,
    (Payment, BaseReferences<_$AppDatabase, $PaymentsTable, Payment>),
    Payment,
    PrefetchHooks Function()>;
typedef $$MenuItemsTableCreateCompanionBuilder = MenuItemsCompanion Function({
  Value<int> id,
  required int serverId,
  required String name,
  required double price,
  Value<int?> categoryId,
  required bool isAvailable,
  required DateTime lastSynced,
});
typedef $$MenuItemsTableUpdateCompanionBuilder = MenuItemsCompanion Function({
  Value<int> id,
  Value<int> serverId,
  Value<String> name,
  Value<double> price,
  Value<int?> categoryId,
  Value<bool> isAvailable,
  Value<DateTime> lastSynced,
});

class $$MenuItemsTableFilterComposer
    extends Composer<_$AppDatabase, $MenuItemsTable> {
  $$MenuItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get serverId => $composableBuilder(
      column: $table.serverId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isAvailable => $composableBuilder(
      column: $table.isAvailable, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSynced => $composableBuilder(
      column: $table.lastSynced, builder: (column) => ColumnFilters(column));
}

class $$MenuItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $MenuItemsTable> {
  $$MenuItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get serverId => $composableBuilder(
      column: $table.serverId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isAvailable => $composableBuilder(
      column: $table.isAvailable, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSynced => $composableBuilder(
      column: $table.lastSynced, builder: (column) => ColumnOrderings(column));
}

class $$MenuItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MenuItemsTable> {
  $$MenuItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<bool> get isAvailable => $composableBuilder(
      column: $table.isAvailable, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSynced => $composableBuilder(
      column: $table.lastSynced, builder: (column) => column);
}

class $$MenuItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MenuItemsTable,
    MenuItem,
    $$MenuItemsTableFilterComposer,
    $$MenuItemsTableOrderingComposer,
    $$MenuItemsTableAnnotationComposer,
    $$MenuItemsTableCreateCompanionBuilder,
    $$MenuItemsTableUpdateCompanionBuilder,
    (MenuItem, BaseReferences<_$AppDatabase, $MenuItemsTable, MenuItem>),
    MenuItem,
    PrefetchHooks Function()> {
  $$MenuItemsTableTableManager(_$AppDatabase db, $MenuItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MenuItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MenuItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MenuItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> serverId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            Value<bool> isAvailable = const Value.absent(),
            Value<DateTime> lastSynced = const Value.absent(),
          }) =>
              MenuItemsCompanion(
            id: id,
            serverId: serverId,
            name: name,
            price: price,
            categoryId: categoryId,
            isAvailable: isAvailable,
            lastSynced: lastSynced,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int serverId,
            required String name,
            required double price,
            Value<int?> categoryId = const Value.absent(),
            required bool isAvailable,
            required DateTime lastSynced,
          }) =>
              MenuItemsCompanion.insert(
            id: id,
            serverId: serverId,
            name: name,
            price: price,
            categoryId: categoryId,
            isAvailable: isAvailable,
            lastSynced: lastSynced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MenuItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MenuItemsTable,
    MenuItem,
    $$MenuItemsTableFilterComposer,
    $$MenuItemsTableOrderingComposer,
    $$MenuItemsTableAnnotationComposer,
    $$MenuItemsTableCreateCompanionBuilder,
    $$MenuItemsTableUpdateCompanionBuilder,
    (MenuItem, BaseReferences<_$AppDatabase, $MenuItemsTable, MenuItem>),
    MenuItem,
    PrefetchHooks Function()>;
typedef $$RestaurantTablesTableCreateCompanionBuilder
    = RestaurantTablesCompanion Function({
  Value<int> id,
  required int serverId,
  required String tableCode,
  Value<int?> areaId,
  required int capacity,
  required DateTime lastSynced,
});
typedef $$RestaurantTablesTableUpdateCompanionBuilder
    = RestaurantTablesCompanion Function({
  Value<int> id,
  Value<int> serverId,
  Value<String> tableCode,
  Value<int?> areaId,
  Value<int> capacity,
  Value<DateTime> lastSynced,
});

class $$RestaurantTablesTableFilterComposer
    extends Composer<_$AppDatabase, $RestaurantTablesTable> {
  $$RestaurantTablesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get serverId => $composableBuilder(
      column: $table.serverId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tableCode => $composableBuilder(
      column: $table.tableCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get areaId => $composableBuilder(
      column: $table.areaId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get capacity => $composableBuilder(
      column: $table.capacity, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSynced => $composableBuilder(
      column: $table.lastSynced, builder: (column) => ColumnFilters(column));
}

class $$RestaurantTablesTableOrderingComposer
    extends Composer<_$AppDatabase, $RestaurantTablesTable> {
  $$RestaurantTablesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get serverId => $composableBuilder(
      column: $table.serverId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tableCode => $composableBuilder(
      column: $table.tableCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get areaId => $composableBuilder(
      column: $table.areaId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get capacity => $composableBuilder(
      column: $table.capacity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSynced => $composableBuilder(
      column: $table.lastSynced, builder: (column) => ColumnOrderings(column));
}

class $$RestaurantTablesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RestaurantTablesTable> {
  $$RestaurantTablesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get tableCode =>
      $composableBuilder(column: $table.tableCode, builder: (column) => column);

  GeneratedColumn<int> get areaId =>
      $composableBuilder(column: $table.areaId, builder: (column) => column);

  GeneratedColumn<int> get capacity =>
      $composableBuilder(column: $table.capacity, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSynced => $composableBuilder(
      column: $table.lastSynced, builder: (column) => column);
}

class $$RestaurantTablesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RestaurantTablesTable,
    RestaurantTable,
    $$RestaurantTablesTableFilterComposer,
    $$RestaurantTablesTableOrderingComposer,
    $$RestaurantTablesTableAnnotationComposer,
    $$RestaurantTablesTableCreateCompanionBuilder,
    $$RestaurantTablesTableUpdateCompanionBuilder,
    (
      RestaurantTable,
      BaseReferences<_$AppDatabase, $RestaurantTablesTable, RestaurantTable>
    ),
    RestaurantTable,
    PrefetchHooks Function()> {
  $$RestaurantTablesTableTableManager(
      _$AppDatabase db, $RestaurantTablesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RestaurantTablesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RestaurantTablesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RestaurantTablesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> serverId = const Value.absent(),
            Value<String> tableCode = const Value.absent(),
            Value<int?> areaId = const Value.absent(),
            Value<int> capacity = const Value.absent(),
            Value<DateTime> lastSynced = const Value.absent(),
          }) =>
              RestaurantTablesCompanion(
            id: id,
            serverId: serverId,
            tableCode: tableCode,
            areaId: areaId,
            capacity: capacity,
            lastSynced: lastSynced,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int serverId,
            required String tableCode,
            Value<int?> areaId = const Value.absent(),
            required int capacity,
            required DateTime lastSynced,
          }) =>
              RestaurantTablesCompanion.insert(
            id: id,
            serverId: serverId,
            tableCode: tableCode,
            areaId: areaId,
            capacity: capacity,
            lastSynced: lastSynced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RestaurantTablesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RestaurantTablesTable,
    RestaurantTable,
    $$RestaurantTablesTableFilterComposer,
    $$RestaurantTablesTableOrderingComposer,
    $$RestaurantTablesTableAnnotationComposer,
    $$RestaurantTablesTableCreateCompanionBuilder,
    $$RestaurantTablesTableUpdateCompanionBuilder,
    (
      RestaurantTable,
      BaseReferences<_$AppDatabase, $RestaurantTablesTable, RestaurantTable>
    ),
    RestaurantTable,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$OrdersTableTableManager get orders =>
      $$OrdersTableTableManager(_db, _db.orders);
  $$OrderItemsTableTableManager get orderItems =>
      $$OrderItemsTableTableManager(_db, _db.orderItems);
  $$KotsTableTableManager get kots => $$KotsTableTableManager(_db, _db.kots);
  $$PaymentsTableTableManager get payments =>
      $$PaymentsTableTableManager(_db, _db.payments);
  $$MenuItemsTableTableManager get menuItems =>
      $$MenuItemsTableTableManager(_db, _db.menuItems);
  $$RestaurantTablesTableTableManager get restaurantTables =>
      $$RestaurantTablesTableTableManager(_db, _db.restaurantTables);
}
