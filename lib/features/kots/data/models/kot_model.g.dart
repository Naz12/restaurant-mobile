// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KotModelImpl _$$KotModelImplFromJson(Map<String, dynamic> json) =>
    _$KotModelImpl(
      id: (json['id'] as num).toInt(),
      kotNumber: (json['kot_number'] as num).toInt(),
      status: json['status'] as String,
      tokenNumber: (json['token_number'] as num?)?.toInt(),
      order: KotOrderModel.fromJson(json['order'] as Map<String, dynamic>),
      table: json['table'] == null
          ? null
          : KotTableModel.fromJson(json['table'] as Map<String, dynamic>),
      waiter: json['waiter'] == null
          ? null
          : KotWaiterModel.fromJson(json['waiter'] as Map<String, dynamic>),
      kitchenPlace: json['kitchen_place'] == null
          ? null
          : KotPlaceModel.fromJson(
              json['kitchen_place'] as Map<String, dynamic>),
      itemsCount: (json['items_count'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => KotItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$KotModelImplToJson(_$KotModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kot_number': instance.kotNumber,
      'status': instance.status,
      'token_number': instance.tokenNumber,
      'order': instance.order,
      'table': instance.table,
      'waiter': instance.waiter,
      'kitchen_place': instance.kitchenPlace,
      'items_count': instance.itemsCount,
      'items': instance.items,
      'created_at': instance.createdAt.toIso8601String(),
    };

_$KotOrderModelImpl _$$KotOrderModelImplFromJson(Map<String, dynamic> json) =>
    _$KotOrderModelImpl(
      id: (json['id'] as num).toInt(),
      orderNumber: json['order_number'] as String,
      formattedOrderNumber: json['formatted_order_number'] as String,
    );

Map<String, dynamic> _$$KotOrderModelImplToJson(_$KotOrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'formatted_order_number': instance.formattedOrderNumber,
    };

_$KotTableModelImpl _$$KotTableModelImplFromJson(Map<String, dynamic> json) =>
    _$KotTableModelImpl(
      id: (json['id'] as num).toInt(),
      tableCode: json['table_code'] as String,
      areaName: json['area_name'] as String?,
    );

Map<String, dynamic> _$$KotTableModelImplToJson(_$KotTableModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'table_code': instance.tableCode,
      'area_name': instance.areaName,
    };

_$KotWaiterModelImpl _$$KotWaiterModelImplFromJson(Map<String, dynamic> json) =>
    _$KotWaiterModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$KotWaiterModelImplToJson(
        _$KotWaiterModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$KotPlaceModelImpl _$$KotPlaceModelImplFromJson(Map<String, dynamic> json) =>
    _$KotPlaceModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$KotPlaceModelImplToJson(_$KotPlaceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$KotItemModelImpl _$$KotItemModelImplFromJson(Map<String, dynamic> json) =>
    _$KotItemModelImpl(
      id: (json['id'] as num).toInt(),
      menuItem: KotMenuItemBasicModel.fromJson(
          json['menu_item'] as Map<String, dynamic>),
      variation: json['variation'] == null
          ? null
          : KotMenuItemVariationModel.fromJson(
              json['variation'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      note: json['note'] as String?,
      status: json['status'] as String,
      modifiers: (json['modifiers'] as List<dynamic>)
          .map(
              (e) => KotModifierOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$KotItemModelImplToJson(_$KotItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'menu_item': instance.menuItem,
      'variation': instance.variation,
      'quantity': instance.quantity,
      'note': instance.note,
      'status': instance.status,
      'modifiers': instance.modifiers,
    };

_$KotMenuItemBasicModelImpl _$$KotMenuItemBasicModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KotMenuItemBasicModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$KotMenuItemBasicModelImplToJson(
        _$KotMenuItemBasicModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$KotMenuItemVariationModelImpl _$$KotMenuItemVariationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KotMenuItemVariationModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$KotMenuItemVariationModelImplToJson(
        _$KotMenuItemVariationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$KotModifierOptionModelImpl _$$KotModifierOptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KotModifierOptionModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$KotModifierOptionModelImplToJson(
        _$KotModifierOptionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
