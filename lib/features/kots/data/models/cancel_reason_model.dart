import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cancel_reason_model.freezed.dart';
part 'cancel_reason_model.g.dart';

@freezed
class CancelReasonModel with _$CancelReasonModel {
  const factory CancelReasonModel({
    required int id,
    required String reason,
  }) = _CancelReasonModel;

  factory CancelReasonModel.fromJson(Map<String, dynamic> json) =>
      _$CancelReasonModelFromJson(json);
}

