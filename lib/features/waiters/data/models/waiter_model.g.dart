// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waiter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaiterModelImpl _$$WaiterModelImplFromJson(Map<String, dynamic> json) =>
    _$WaiterModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$WaiterModelImplToJson(_$WaiterModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
