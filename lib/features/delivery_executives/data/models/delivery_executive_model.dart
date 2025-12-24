import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delivery_executive_model.freezed.dart';
part 'delivery_executive_model.g.dart';

@freezed
class DeliveryExecutiveModel with _$DeliveryExecutiveModel {
  const factory DeliveryExecutiveModel({
    required int id,
    required String name,
    required String phone,
    String? vehicleNumber,
  }) = _DeliveryExecutiveModel;

  factory DeliveryExecutiveModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryExecutiveModelFromJson(json);
}

