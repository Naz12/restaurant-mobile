// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentModelImpl _$$PaymentModelImplFromJson(Map<String, dynamic> json) =>
    _$PaymentModelImpl(
      id: (json['id'] as num).toInt(),
      orderId: (json['order_id'] as num).toInt(),
      paymentMethod: json['payment_method'] as String,
      amount: (json['amount'] as num).toDouble(),
      tipAmount: (json['tip_amount'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$PaymentModelImplToJson(_$PaymentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'payment_method': instance.paymentMethod,
      'amount': instance.amount,
      'tip_amount': instance.tipAmount,
      'notes': instance.notes,
      'created_at': instance.createdAt.toIso8601String(),
    };
