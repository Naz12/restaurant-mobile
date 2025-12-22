import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    required int id,
    @JsonKey(name: 'order_number') required String orderNumber,
    @JsonKey(name: 'formatted_order_number') required String formattedOrderNumber,
    required String status,
    OrderTableModel? table,
    OrderWaiterModel? waiter,
    @JsonKey(name: 'number_of_pax') required int numberOfPax,
    @JsonKey(name: 'sub_total') required double subTotal,
    @JsonKey(name: 'discount_amount') required double discountAmount,
    @JsonKey(name: 'tip_amount') required double tipAmount,
    @JsonKey(name: 'delivery_fee') required double deliveryFee,
    @JsonKey(name: 'total_tax_amount') required double totalTaxAmount,
    required double total,
    @JsonKey(name: 'order_note') String? orderNote,
    required List<OrderItemModel> items,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

@freezed
class OrderTableModel with _$OrderTableModel {
  const factory OrderTableModel({
    required int id,
    @JsonKey(name: 'table_code') required String tableCode,
    @JsonKey(name: 'area_name') String? areaName,
  }) = _OrderTableModel;

  factory OrderTableModel.fromJson(Map<String, dynamic> json) =>
      _$OrderTableModelFromJson(json);
}

@freezed
class OrderWaiterModel with _$OrderWaiterModel {
  const factory OrderWaiterModel({
    required int id,
    required String name,
  }) = _OrderWaiterModel;

  factory OrderWaiterModel.fromJson(Map<String, dynamic> json) =>
      _$OrderWaiterModelFromJson(json);
}

@freezed
class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    required int id,
    @JsonKey(name: 'menu_item') required MenuItemBasicModel menuItem,
    MenuItemVariationModel? variation,
    required int quantity,
    required double price,
    required double amount,
    String? note,
    required List<ModifierOptionModel> modifiers,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);
}

@freezed
class MenuItemBasicModel with _$MenuItemBasicModel {
  const factory MenuItemBasicModel({
    required int id,
    required String name,
  }) = _MenuItemBasicModel;

  factory MenuItemBasicModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemBasicModelFromJson(json);
}

@freezed
class MenuItemVariationModel with _$MenuItemVariationModel {
  const factory MenuItemVariationModel({
    required int id,
    required String name,
  }) = _MenuItemVariationModel;

  factory MenuItemVariationModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemVariationModelFromJson(json);
}

@freezed
class ModifierOptionModel with _$ModifierOptionModel {
  const factory ModifierOptionModel({
    required int id,
    required String name,
    required double price,
  }) = _ModifierOptionModel;

  factory ModifierOptionModel.fromJson(Map<String, dynamic> json) =>
      _$ModifierOptionModelFromJson(json);
}

