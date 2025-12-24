// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_executive_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryExecutiveModelImpl _$$DeliveryExecutiveModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryExecutiveModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phone: json['phone'] as String,
      vehicleNumber: json['vehicleNumber'] as String?,
    );

Map<String, dynamic> _$$DeliveryExecutiveModelImplToJson(
        _$DeliveryExecutiveModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'vehicleNumber': instance.vehicleNumber,
    };
