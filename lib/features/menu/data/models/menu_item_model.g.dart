// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuItemModelImpl _$$MenuItemModelImplFromJson(Map<String, dynamic> json) =>
    _$MenuItemModelImpl(
      id: (json['id'] as num).toInt(),
      itemName: json['item_name'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
      vegNonVeg: json['veg_non_veg'] as String?,
      hasVariations: json['has_variations'] as bool? ?? false,
      variations: (json['variations'] as List<dynamic>?)
          ?.map(
              (e) => MenuItemVariationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      modifierGroups: (json['modifier_groups'] as List<dynamic>?)
          ?.map((e) => ModifierGroupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MenuItemModelImplToJson(_$MenuItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_name': instance.itemName,
      'description': instance.description,
      'price': instance.price,
      'image': instance.image,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'veg_non_veg': instance.vegNonVeg,
      'has_variations': instance.hasVariations,
      'variations': instance.variations,
      'modifier_groups': instance.modifierGroups,
    };

_$MenuItemVariationModelImpl _$$MenuItemVariationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuItemVariationModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$MenuItemVariationModelImplToJson(
        _$MenuItemVariationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };

_$ModifierGroupModelImpl _$$ModifierGroupModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ModifierGroupModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      isRequired: json['is_required'] as bool? ?? false,
      minSelections: (json['min_selections'] as num?)?.toInt() ?? 0,
      maxSelections: (json['max_selections'] as num?)?.toInt() ?? 1,
      options: (json['options'] as List<dynamic>)
          .map((e) => ModifierOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ModifierGroupModelImplToJson(
        _$ModifierGroupModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'is_required': instance.isRequired,
      'min_selections': instance.minSelections,
      'max_selections': instance.maxSelections,
      'options': instance.options,
    };

_$ModifierOptionModelImpl _$$ModifierOptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ModifierOptionModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$ModifierOptionModelImplToJson(
        _$ModifierOptionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };

_$MenuCategoryModelImpl _$$MenuCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuCategoryModelImpl(
      id: (json['id'] as num).toInt(),
      categoryName: json['category_name'] as String,
      itemsCount: (json['items_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$MenuCategoryModelImplToJson(
        _$MenuCategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_name': instance.categoryName,
      'items_count': instance.itemsCount,
    };
