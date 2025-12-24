import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'waiter_model.freezed.dart';
part 'waiter_model.g.dart';

@freezed
class WaiterModel with _$WaiterModel {
  const factory WaiterModel({
    required int id,
    required String name,
    required String email,
  }) = _WaiterModel;

  factory WaiterModel.fromJson(Map<String, dynamic> json) =>
      _$WaiterModelFromJson(json);
}

