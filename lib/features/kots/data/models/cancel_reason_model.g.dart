// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_reason_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CancelReasonModelImpl _$$CancelReasonModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CancelReasonModelImpl(
      id: (json['id'] as num).toInt(),
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$$CancelReasonModelImplToJson(
        _$CancelReasonModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reason': instance.reason,
    };
