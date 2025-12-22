import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_item_model.freezed.dart';
part 'menu_item_model.g.dart';

@freezed
class MenuItemModel with _$MenuItemModel {
  const factory MenuItemModel({
    required int id,
    @JsonKey(name: 'item_name') required String itemName,
    String? description,
    required double price,
    String? image,
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'category_name') String? categoryName,
    @JsonKey(name: 'veg_non_veg') String? vegNonVeg,
    @JsonKey(name: 'has_variations') @Default(false) bool hasVariations,
    List<MenuItemVariationModel>? variations,
    @JsonKey(name: 'modifier_groups') List<ModifierGroupModel>? modifierGroups,
  }) = _MenuItemModel;

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);
}

@freezed
class MenuItemVariationModel with _$MenuItemVariationModel {
  const factory MenuItemVariationModel({
    required int id,
    String? name, // Made nullable to handle API returning null
    required double price,
  }) = _MenuItemVariationModel;

  factory MenuItemVariationModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemVariationModelFromJson(json);
}

@freezed
class ModifierGroupModel with _$ModifierGroupModel {
  const factory ModifierGroupModel({
    required int id,
    required String name,
    String? description,
    @JsonKey(name: 'is_required') @Default(false) bool isRequired,
    @JsonKey(name: 'min_selections') @Default(0) int minSelections,
    @JsonKey(name: 'max_selections') @Default(1) int maxSelections,
    required List<ModifierOptionModel> options,
  }) = _ModifierGroupModel;

  factory ModifierGroupModel.fromJson(Map<String, dynamic> json) =>
      _$ModifierGroupModelFromJson(json);
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

@freezed
class MenuCategoryModel with _$MenuCategoryModel {
  const factory MenuCategoryModel({
    required int id,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'items_count') @Default(0) int itemsCount,
  }) = _MenuCategoryModel;

  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryModelFromJson(json);
}

