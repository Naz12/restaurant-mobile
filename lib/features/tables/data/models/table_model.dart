import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'table_model.freezed.dart';
part 'table_model.g.dart';

@freezed
class TableModel with _$TableModel {
  const factory TableModel({
    required int id,
    @JsonKey(name: 'table_code') required String tableCode,
    int? capacity, // Made nullable to handle API returning null
    @JsonKey(name: 'area_id') int? areaId,
    @JsonKey(name: 'area_name') String? areaName,
    required String status, // available, occupied
    @JsonKey(name: 'active_order') TableActiveOrderModel? activeOrder,
  }) = _TableModel;

  factory TableModel.fromJson(Map<String, dynamic> json) =>
      _$TableModelFromJson(json);
}

@freezed
class TableActiveOrderModel with _$TableActiveOrderModel {
  const factory TableActiveOrderModel({
    required int id,
    @JsonKey(name: 'order_number') required String orderNumber,
    @JsonKey(name: 'formatted_order_number') required String formattedOrderNumber,
    required String status,
  }) = _TableActiveOrderModel;

  factory TableActiveOrderModel.fromJson(Map<String, dynamic> json) =>
      _$TableActiveOrderModelFromJson(json);
}

@freezed
class TableAreaModel with _$TableAreaModel {
  const factory TableAreaModel({
    required int id,
    @JsonKey(name: 'area_name') required String areaName,
    @JsonKey(name: 'tables_count') @Default(0) int tablesCount,
  }) = _TableAreaModel;

  factory TableAreaModel.fromJson(Map<String, dynamic> json) =>
      _$TableAreaModelFromJson(json);
}

