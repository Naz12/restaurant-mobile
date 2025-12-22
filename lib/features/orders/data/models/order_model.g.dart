// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: (json['id'] as num).toInt(),
      orderNumber: json['order_number'] as String,
      formattedOrderNumber: json['formatted_order_number'] as String,
      status: json['status'] as String,
      table: json['table'] == null
          ? null
          : OrderTableModel.fromJson(json['table'] as Map<String, dynamic>),
      waiter: json['waiter'] == null
          ? null
          : OrderWaiterModel.fromJson(json['waiter'] as Map<String, dynamic>),
      numberOfPax: (json['number_of_pax'] as num).toInt(),
      subTotal: (json['sub_total'] as num).toDouble(),
      discountAmount: (json['discount_amount'] as num).toDouble(),
      tipAmount: (json['tip_amount'] as num).toDouble(),
      deliveryFee: (json['delivery_fee'] as num).toDouble(),
      totalTaxAmount: (json['total_tax_amount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      orderNote: json['order_note'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'formatted_order_number': instance.formattedOrderNumber,
      'status': instance.status,
      'table': instance.table,
      'waiter': instance.waiter,
      'number_of_pax': instance.numberOfPax,
      'sub_total': instance.subTotal,
      'discount_amount': instance.discountAmount,
      'tip_amount': instance.tipAmount,
      'delivery_fee': instance.deliveryFee,
      'total_tax_amount': instance.totalTaxAmount,
      'total': instance.total,
      'order_note': instance.orderNote,
      'items': instance.items,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$OrderTableModelImpl _$$OrderTableModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderTableModelImpl(
      id: (json['id'] as num).toInt(),
      tableCode: json['table_code'] as String,
      areaName: json['area_name'] as String?,
    );

Map<String, dynamic> _$$OrderTableModelImplToJson(
        _$OrderTableModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'table_code': instance.tableCode,
      'area_name': instance.areaName,
    };

_$OrderWaiterModelImpl _$$OrderWaiterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderWaiterModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$OrderWaiterModelImplToJson(
        _$OrderWaiterModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$OrderItemModelImpl _$$OrderItemModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemModelImpl(
      id: (json['id'] as num).toInt(),
      menuItem: MenuItemBasicModel.fromJson(
          json['menu_item'] as Map<String, dynamic>),
      variation: json['variation'] == null
          ? null
          : MenuItemVariationModel.fromJson(
              json['variation'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      amount: (json['amount'] as num).toDouble(),
      note: json['note'] as String?,
      modifiers: (json['modifiers'] as List<dynamic>)
          .map((e) => ModifierOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderItemModelImplToJson(
        _$OrderItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'menu_item': instance.menuItem,
      'variation': instance.variation,
      'quantity': instance.quantity,
      'price': instance.price,
      'amount': instance.amount,
      'note': instance.note,
      'modifiers': instance.modifiers,
    };

_$MenuItemBasicModelImpl _$$MenuItemBasicModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuItemBasicModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$MenuItemBasicModelImplToJson(
        _$MenuItemBasicModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$MenuItemVariationModelImpl _$$MenuItemVariationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuItemVariationModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$MenuItemVariationModelImplToJson(
        _$MenuItemVariationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ModifierOptionModelImpl _$$ModifierOptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ModifierOptionModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$ModifierOptionModelImplToJson(
        _$ModifierOptionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
