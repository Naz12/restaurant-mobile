import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

@freezed
class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    required int id,
    @JsonKey(name: 'order_id') required int orderId,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    required double amount,
    @JsonKey(name: 'tip_amount') double? tipAmount,
    String? notes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}

