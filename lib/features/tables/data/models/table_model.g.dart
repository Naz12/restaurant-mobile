// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableModelImpl _$$TableModelImplFromJson(Map<String, dynamic> json) =>
    _$TableModelImpl(
      id: (json['id'] as num).toInt(),
      tableCode: json['table_code'] as String,
      capacity: (json['capacity'] as num).toInt(),
      areaId: (json['area_id'] as num?)?.toInt(),
      areaName: json['area_name'] as String?,
      status: json['status'] as String,
      activeOrder: json['active_order'] == null
          ? null
          : TableActiveOrderModel.fromJson(
              json['active_order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TableModelImplToJson(_$TableModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'table_code': instance.tableCode,
      'capacity': instance.capacity,
      'area_id': instance.areaId,
      'area_name': instance.areaName,
      'status': instance.status,
      'active_order': instance.activeOrder,
    };

_$TableActiveOrderModelImpl _$$TableActiveOrderModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TableActiveOrderModelImpl(
      id: (json['id'] as num).toInt(),
      orderNumber: json['order_number'] as String,
      formattedOrderNumber: json['formatted_order_number'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$TableActiveOrderModelImplToJson(
        _$TableActiveOrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'formatted_order_number': instance.formattedOrderNumber,
      'status': instance.status,
    };

_$TableAreaModelImpl _$$TableAreaModelImplFromJson(Map<String, dynamic> json) =>
    _$TableAreaModelImpl(
      id: (json['id'] as num).toInt(),
      areaName: json['area_name'] as String,
      tablesCount: (json['tables_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$TableAreaModelImplToJson(
        _$TableAreaModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'area_name': instance.areaName,
      'tables_count': instance.tablesCount,
    };
