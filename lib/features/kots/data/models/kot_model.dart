import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kot_model.freezed.dart';
part 'kot_model.g.dart';

@freezed
class KotModel with _$KotModel {
  const factory KotModel({
    required int id,
    @JsonKey(name: 'kot_number') required int kotNumber,
    required String status,
    @JsonKey(name: 'token_number') int? tokenNumber,
    required KotOrderModel order,
    KotTableModel? table,
    KotWaiterModel? waiter,
    @JsonKey(name: 'kitchen_place') KotPlaceModel? kitchenPlace,
    @JsonKey(name: 'items_count') int? itemsCount,
    List<KotItemModel>? items,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _KotModel;

  factory KotModel.fromJson(Map<String, dynamic> json) =>
      _$KotModelFromJson(json);
}

@freezed
class KotOrderModel with _$KotOrderModel {
  const factory KotOrderModel({
    required int id,
    @JsonKey(name: 'order_number') required String orderNumber,
    @JsonKey(name: 'formatted_order_number') required String formattedOrderNumber,
  }) = _KotOrderModel;

  factory KotOrderModel.fromJson(Map<String, dynamic> json) =>
      _$KotOrderModelFromJson(json);
}

@freezed
class KotTableModel with _$KotTableModel {
  const factory KotTableModel({
    required int id,
    @JsonKey(name: 'table_code') required String tableCode,
    @JsonKey(name: 'area_name') String? areaName,
  }) = _KotTableModel;

  factory KotTableModel.fromJson(Map<String, dynamic> json) =>
      _$KotTableModelFromJson(json);
}

@freezed
class KotWaiterModel with _$KotWaiterModel {
  const factory KotWaiterModel({
    required int id,
    required String name,
  }) = _KotWaiterModel;

  factory KotWaiterModel.fromJson(Map<String, dynamic> json) =>
      _$KotWaiterModelFromJson(json);
}

@freezed
class KotPlaceModel with _$KotPlaceModel {
  const factory KotPlaceModel({
    required int id,
    required String name,
  }) = _KotPlaceModel;

  factory KotPlaceModel.fromJson(Map<String, dynamic> json) =>
      _$KotPlaceModelFromJson(json);
}

@freezed
class KotItemModel with _$KotItemModel {
  const factory KotItemModel({
    required int id,
    @JsonKey(name: 'menu_item') required KotMenuItemBasicModel menuItem,
    KotMenuItemVariationModel? variation,
    required int quantity,
    String? note,
    required String status,
    required List<KotModifierOptionModel> modifiers,
  }) = _KotItemModel;

  factory KotItemModel.fromJson(Map<String, dynamic> json) =>
      _$KotItemModelFromJson(json);
}

@freezed
class KotMenuItemBasicModel with _$KotMenuItemBasicModel {
  const factory KotMenuItemBasicModel({
    required int id,
    required String name,
  }) = _KotMenuItemBasicModel;

  factory KotMenuItemBasicModel.fromJson(Map<String, dynamic> json) =>
      _$KotMenuItemBasicModelFromJson(json);
}

@freezed
class KotMenuItemVariationModel with _$KotMenuItemVariationModel {
  const factory KotMenuItemVariationModel({
    required int id,
    required String name,
  }) = _KotMenuItemVariationModel;

  factory KotMenuItemVariationModel.fromJson(Map<String, dynamic> json) =>
      _$KotMenuItemVariationModelFromJson(json);
}

@freezed
class KotModifierOptionModel with _$KotModifierOptionModel {
  const factory KotModifierOptionModel({
    required int id,
    required String name,
  }) = _KotModifierOptionModel;

  factory KotModifierOptionModel.fromJson(Map<String, dynamic> json) =>
      _$KotModifierOptionModelFromJson(json);
}

