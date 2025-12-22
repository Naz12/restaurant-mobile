// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MenuItemModel _$MenuItemModelFromJson(Map<String, dynamic> json) {
  return _MenuItemModel.fromJson(json);
}

/// @nodoc
mixin _$MenuItemModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_name')
  String get itemName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'veg_non_veg')
  String? get vegNonVeg => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_variations')
  bool get hasVariations => throw _privateConstructorUsedError;
  List<MenuItemVariationModel>? get variations =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'modifier_groups')
  List<ModifierGroupModel>? get modifierGroups =>
      throw _privateConstructorUsedError;

  /// Serializes this MenuItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuItemModelCopyWith<MenuItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemModelCopyWith<$Res> {
  factory $MenuItemModelCopyWith(
          MenuItemModel value, $Res Function(MenuItemModel) then) =
      _$MenuItemModelCopyWithImpl<$Res, MenuItemModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'item_name') String itemName,
      String? description,
      double price,
      String? image,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'veg_non_veg') String? vegNonVeg,
      @JsonKey(name: 'has_variations') bool hasVariations,
      List<MenuItemVariationModel>? variations,
      @JsonKey(name: 'modifier_groups')
      List<ModifierGroupModel>? modifierGroups});
}

/// @nodoc
class _$MenuItemModelCopyWithImpl<$Res, $Val extends MenuItemModel>
    implements $MenuItemModelCopyWith<$Res> {
  _$MenuItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemName = null,
    Object? description = freezed,
    Object? price = null,
    Object? image = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? vegNonVeg = freezed,
    Object? hasVariations = null,
    Object? variations = freezed,
    Object? modifierGroups = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      vegNonVeg: freezed == vegNonVeg
          ? _value.vegNonVeg
          : vegNonVeg // ignore: cast_nullable_to_non_nullable
              as String?,
      hasVariations: null == hasVariations
          ? _value.hasVariations
          : hasVariations // ignore: cast_nullable_to_non_nullable
              as bool,
      variations: freezed == variations
          ? _value.variations
          : variations // ignore: cast_nullable_to_non_nullable
              as List<MenuItemVariationModel>?,
      modifierGroups: freezed == modifierGroups
          ? _value.modifierGroups
          : modifierGroups // ignore: cast_nullable_to_non_nullable
              as List<ModifierGroupModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuItemModelImplCopyWith<$Res>
    implements $MenuItemModelCopyWith<$Res> {
  factory _$$MenuItemModelImplCopyWith(
          _$MenuItemModelImpl value, $Res Function(_$MenuItemModelImpl) then) =
      __$$MenuItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'item_name') String itemName,
      String? description,
      double price,
      String? image,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'veg_non_veg') String? vegNonVeg,
      @JsonKey(name: 'has_variations') bool hasVariations,
      List<MenuItemVariationModel>? variations,
      @JsonKey(name: 'modifier_groups')
      List<ModifierGroupModel>? modifierGroups});
}

/// @nodoc
class __$$MenuItemModelImplCopyWithImpl<$Res>
    extends _$MenuItemModelCopyWithImpl<$Res, _$MenuItemModelImpl>
    implements _$$MenuItemModelImplCopyWith<$Res> {
  __$$MenuItemModelImplCopyWithImpl(
      _$MenuItemModelImpl _value, $Res Function(_$MenuItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemName = null,
    Object? description = freezed,
    Object? price = null,
    Object? image = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? vegNonVeg = freezed,
    Object? hasVariations = null,
    Object? variations = freezed,
    Object? modifierGroups = freezed,
  }) {
    return _then(_$MenuItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      vegNonVeg: freezed == vegNonVeg
          ? _value.vegNonVeg
          : vegNonVeg // ignore: cast_nullable_to_non_nullable
              as String?,
      hasVariations: null == hasVariations
          ? _value.hasVariations
          : hasVariations // ignore: cast_nullable_to_non_nullable
              as bool,
      variations: freezed == variations
          ? _value._variations
          : variations // ignore: cast_nullable_to_non_nullable
              as List<MenuItemVariationModel>?,
      modifierGroups: freezed == modifierGroups
          ? _value._modifierGroups
          : modifierGroups // ignore: cast_nullable_to_non_nullable
              as List<ModifierGroupModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuItemModelImpl implements _MenuItemModel {
  const _$MenuItemModelImpl(
      {required this.id,
      @JsonKey(name: 'item_name') required this.itemName,
      this.description,
      required this.price,
      this.image,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'category_name') this.categoryName,
      @JsonKey(name: 'veg_non_veg') this.vegNonVeg,
      @JsonKey(name: 'has_variations') this.hasVariations = false,
      final List<MenuItemVariationModel>? variations,
      @JsonKey(name: 'modifier_groups')
      final List<ModifierGroupModel>? modifierGroups})
      : _variations = variations,
        _modifierGroups = modifierGroups;

  factory _$MenuItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'item_name')
  final String itemName;
  @override
  final String? description;
  @override
  final double price;
  @override
  final String? image;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @override
  @JsonKey(name: 'veg_non_veg')
  final String? vegNonVeg;
  @override
  @JsonKey(name: 'has_variations')
  final bool hasVariations;
  final List<MenuItemVariationModel>? _variations;
  @override
  List<MenuItemVariationModel>? get variations {
    final value = _variations;
    if (value == null) return null;
    if (_variations is EqualUnmodifiableListView) return _variations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ModifierGroupModel>? _modifierGroups;
  @override
  @JsonKey(name: 'modifier_groups')
  List<ModifierGroupModel>? get modifierGroups {
    final value = _modifierGroups;
    if (value == null) return null;
    if (_modifierGroups is EqualUnmodifiableListView) return _modifierGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MenuItemModel(id: $id, itemName: $itemName, description: $description, price: $price, image: $image, categoryId: $categoryId, categoryName: $categoryName, vegNonVeg: $vegNonVeg, hasVariations: $hasVariations, variations: $variations, modifierGroups: $modifierGroups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.vegNonVeg, vegNonVeg) ||
                other.vegNonVeg == vegNonVeg) &&
            (identical(other.hasVariations, hasVariations) ||
                other.hasVariations == hasVariations) &&
            const DeepCollectionEquality()
                .equals(other._variations, _variations) &&
            const DeepCollectionEquality()
                .equals(other._modifierGroups, _modifierGroups));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      itemName,
      description,
      price,
      image,
      categoryId,
      categoryName,
      vegNonVeg,
      hasVariations,
      const DeepCollectionEquality().hash(_variations),
      const DeepCollectionEquality().hash(_modifierGroups));

  /// Create a copy of MenuItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemModelImplCopyWith<_$MenuItemModelImpl> get copyWith =>
      __$$MenuItemModelImplCopyWithImpl<_$MenuItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemModelImplToJson(
      this,
    );
  }
}

abstract class _MenuItemModel implements MenuItemModel {
  const factory _MenuItemModel(
      {required final int id,
      @JsonKey(name: 'item_name') required final String itemName,
      final String? description,
      required final double price,
      final String? image,
      @JsonKey(name: 'category_id') final int? categoryId,
      @JsonKey(name: 'category_name') final String? categoryName,
      @JsonKey(name: 'veg_non_veg') final String? vegNonVeg,
      @JsonKey(name: 'has_variations') final bool hasVariations,
      final List<MenuItemVariationModel>? variations,
      @JsonKey(name: 'modifier_groups')
      final List<ModifierGroupModel>? modifierGroups}) = _$MenuItemModelImpl;

  factory _MenuItemModel.fromJson(Map<String, dynamic> json) =
      _$MenuItemModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'item_name')
  String get itemName;
  @override
  String? get description;
  @override
  double get price;
  @override
  String? get image;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  @JsonKey(name: 'veg_non_veg')
  String? get vegNonVeg;
  @override
  @JsonKey(name: 'has_variations')
  bool get hasVariations;
  @override
  List<MenuItemVariationModel>? get variations;
  @override
  @JsonKey(name: 'modifier_groups')
  List<ModifierGroupModel>? get modifierGroups;

  /// Create a copy of MenuItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemModelImplCopyWith<_$MenuItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuItemVariationModel _$MenuItemVariationModelFromJson(
    Map<String, dynamic> json) {
  return _MenuItemVariationModel.fromJson(json);
}

/// @nodoc
mixin _$MenuItemVariationModel {
  int get id => throw _privateConstructorUsedError;
  String? get name =>
      throw _privateConstructorUsedError; // Made nullable to handle API returning null
  double get price => throw _privateConstructorUsedError;

  /// Serializes this MenuItemVariationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuItemVariationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuItemVariationModelCopyWith<MenuItemVariationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemVariationModelCopyWith<$Res> {
  factory $MenuItemVariationModelCopyWith(MenuItemVariationModel value,
          $Res Function(MenuItemVariationModel) then) =
      _$MenuItemVariationModelCopyWithImpl<$Res, MenuItemVariationModel>;
  @useResult
  $Res call({int id, String? name, double price});
}

/// @nodoc
class _$MenuItemVariationModelCopyWithImpl<$Res,
        $Val extends MenuItemVariationModel>
    implements $MenuItemVariationModelCopyWith<$Res> {
  _$MenuItemVariationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuItemVariationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuItemVariationModelImplCopyWith<$Res>
    implements $MenuItemVariationModelCopyWith<$Res> {
  factory _$$MenuItemVariationModelImplCopyWith(
          _$MenuItemVariationModelImpl value,
          $Res Function(_$MenuItemVariationModelImpl) then) =
      __$$MenuItemVariationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? name, double price});
}

/// @nodoc
class __$$MenuItemVariationModelImplCopyWithImpl<$Res>
    extends _$MenuItemVariationModelCopyWithImpl<$Res,
        _$MenuItemVariationModelImpl>
    implements _$$MenuItemVariationModelImplCopyWith<$Res> {
  __$$MenuItemVariationModelImplCopyWithImpl(
      _$MenuItemVariationModelImpl _value,
      $Res Function(_$MenuItemVariationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuItemVariationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? price = null,
  }) {
    return _then(_$MenuItemVariationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuItemVariationModelImpl implements _MenuItemVariationModel {
  const _$MenuItemVariationModelImpl(
      {required this.id, this.name, required this.price});

  factory _$MenuItemVariationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemVariationModelImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
// Made nullable to handle API returning null
  @override
  final double price;

  @override
  String toString() {
    return 'MenuItemVariationModel(id: $id, name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemVariationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price);

  /// Create a copy of MenuItemVariationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemVariationModelImplCopyWith<_$MenuItemVariationModelImpl>
      get copyWith => __$$MenuItemVariationModelImplCopyWithImpl<
          _$MenuItemVariationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemVariationModelImplToJson(
      this,
    );
  }
}

abstract class _MenuItemVariationModel implements MenuItemVariationModel {
  const factory _MenuItemVariationModel(
      {required final int id,
      final String? name,
      required final double price}) = _$MenuItemVariationModelImpl;

  factory _MenuItemVariationModel.fromJson(Map<String, dynamic> json) =
      _$MenuItemVariationModelImpl.fromJson;

  @override
  int get id;
  @override
  String? get name; // Made nullable to handle API returning null
  @override
  double get price;

  /// Create a copy of MenuItemVariationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemVariationModelImplCopyWith<_$MenuItemVariationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ModifierGroupModel _$ModifierGroupModelFromJson(Map<String, dynamic> json) {
  return _ModifierGroupModel.fromJson(json);
}

/// @nodoc
mixin _$ModifierGroupModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_required')
  bool get isRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_selections')
  int get minSelections => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_selections')
  int get maxSelections => throw _privateConstructorUsedError;
  List<ModifierOptionModel> get options => throw _privateConstructorUsedError;

  /// Serializes this ModifierGroupModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ModifierGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModifierGroupModelCopyWith<ModifierGroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifierGroupModelCopyWith<$Res> {
  factory $ModifierGroupModelCopyWith(
          ModifierGroupModel value, $Res Function(ModifierGroupModel) then) =
      _$ModifierGroupModelCopyWithImpl<$Res, ModifierGroupModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      @JsonKey(name: 'is_required') bool isRequired,
      @JsonKey(name: 'min_selections') int minSelections,
      @JsonKey(name: 'max_selections') int maxSelections,
      List<ModifierOptionModel> options});
}

/// @nodoc
class _$ModifierGroupModelCopyWithImpl<$Res, $Val extends ModifierGroupModel>
    implements $ModifierGroupModelCopyWith<$Res> {
  _$ModifierGroupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModifierGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? isRequired = null,
    Object? minSelections = null,
    Object? maxSelections = null,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      minSelections: null == minSelections
          ? _value.minSelections
          : minSelections // ignore: cast_nullable_to_non_nullable
              as int,
      maxSelections: null == maxSelections
          ? _value.maxSelections
          : maxSelections // ignore: cast_nullable_to_non_nullable
              as int,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<ModifierOptionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModifierGroupModelImplCopyWith<$Res>
    implements $ModifierGroupModelCopyWith<$Res> {
  factory _$$ModifierGroupModelImplCopyWith(_$ModifierGroupModelImpl value,
          $Res Function(_$ModifierGroupModelImpl) then) =
      __$$ModifierGroupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      @JsonKey(name: 'is_required') bool isRequired,
      @JsonKey(name: 'min_selections') int minSelections,
      @JsonKey(name: 'max_selections') int maxSelections,
      List<ModifierOptionModel> options});
}

/// @nodoc
class __$$ModifierGroupModelImplCopyWithImpl<$Res>
    extends _$ModifierGroupModelCopyWithImpl<$Res, _$ModifierGroupModelImpl>
    implements _$$ModifierGroupModelImplCopyWith<$Res> {
  __$$ModifierGroupModelImplCopyWithImpl(_$ModifierGroupModelImpl _value,
      $Res Function(_$ModifierGroupModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ModifierGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? isRequired = null,
    Object? minSelections = null,
    Object? maxSelections = null,
    Object? options = null,
  }) {
    return _then(_$ModifierGroupModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      minSelections: null == minSelections
          ? _value.minSelections
          : minSelections // ignore: cast_nullable_to_non_nullable
              as int,
      maxSelections: null == maxSelections
          ? _value.maxSelections
          : maxSelections // ignore: cast_nullable_to_non_nullable
              as int,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<ModifierOptionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModifierGroupModelImpl implements _ModifierGroupModel {
  const _$ModifierGroupModelImpl(
      {required this.id,
      required this.name,
      this.description,
      @JsonKey(name: 'is_required') this.isRequired = false,
      @JsonKey(name: 'min_selections') this.minSelections = 0,
      @JsonKey(name: 'max_selections') this.maxSelections = 1,
      required final List<ModifierOptionModel> options})
      : _options = options;

  factory _$ModifierGroupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModifierGroupModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey(name: 'is_required')
  final bool isRequired;
  @override
  @JsonKey(name: 'min_selections')
  final int minSelections;
  @override
  @JsonKey(name: 'max_selections')
  final int maxSelections;
  final List<ModifierOptionModel> _options;
  @override
  List<ModifierOptionModel> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'ModifierGroupModel(id: $id, name: $name, description: $description, isRequired: $isRequired, minSelections: $minSelections, maxSelections: $maxSelections, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifierGroupModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.minSelections, minSelections) ||
                other.minSelections == minSelections) &&
            (identical(other.maxSelections, maxSelections) ||
                other.maxSelections == maxSelections) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      isRequired,
      minSelections,
      maxSelections,
      const DeepCollectionEquality().hash(_options));

  /// Create a copy of ModifierGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifierGroupModelImplCopyWith<_$ModifierGroupModelImpl> get copyWith =>
      __$$ModifierGroupModelImplCopyWithImpl<_$ModifierGroupModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModifierGroupModelImplToJson(
      this,
    );
  }
}

abstract class _ModifierGroupModel implements ModifierGroupModel {
  const factory _ModifierGroupModel(
          {required final int id,
          required final String name,
          final String? description,
          @JsonKey(name: 'is_required') final bool isRequired,
          @JsonKey(name: 'min_selections') final int minSelections,
          @JsonKey(name: 'max_selections') final int maxSelections,
          required final List<ModifierOptionModel> options}) =
      _$ModifierGroupModelImpl;

  factory _ModifierGroupModel.fromJson(Map<String, dynamic> json) =
      _$ModifierGroupModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(name: 'is_required')
  bool get isRequired;
  @override
  @JsonKey(name: 'min_selections')
  int get minSelections;
  @override
  @JsonKey(name: 'max_selections')
  int get maxSelections;
  @override
  List<ModifierOptionModel> get options;

  /// Create a copy of ModifierGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModifierGroupModelImplCopyWith<_$ModifierGroupModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ModifierOptionModel _$ModifierOptionModelFromJson(Map<String, dynamic> json) {
  return _ModifierOptionModel.fromJson(json);
}

/// @nodoc
mixin _$ModifierOptionModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  /// Serializes this ModifierOptionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ModifierOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModifierOptionModelCopyWith<ModifierOptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifierOptionModelCopyWith<$Res> {
  factory $ModifierOptionModelCopyWith(
          ModifierOptionModel value, $Res Function(ModifierOptionModel) then) =
      _$ModifierOptionModelCopyWithImpl<$Res, ModifierOptionModel>;
  @useResult
  $Res call({int id, String name, double price});
}

/// @nodoc
class _$ModifierOptionModelCopyWithImpl<$Res, $Val extends ModifierOptionModel>
    implements $ModifierOptionModelCopyWith<$Res> {
  _$ModifierOptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModifierOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModifierOptionModelImplCopyWith<$Res>
    implements $ModifierOptionModelCopyWith<$Res> {
  factory _$$ModifierOptionModelImplCopyWith(_$ModifierOptionModelImpl value,
          $Res Function(_$ModifierOptionModelImpl) then) =
      __$$ModifierOptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, double price});
}

/// @nodoc
class __$$ModifierOptionModelImplCopyWithImpl<$Res>
    extends _$ModifierOptionModelCopyWithImpl<$Res, _$ModifierOptionModelImpl>
    implements _$$ModifierOptionModelImplCopyWith<$Res> {
  __$$ModifierOptionModelImplCopyWithImpl(_$ModifierOptionModelImpl _value,
      $Res Function(_$ModifierOptionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ModifierOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_$ModifierOptionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModifierOptionModelImpl implements _ModifierOptionModel {
  const _$ModifierOptionModelImpl(
      {required this.id, required this.name, required this.price});

  factory _$ModifierOptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModifierOptionModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double price;

  @override
  String toString() {
    return 'ModifierOptionModel(id: $id, name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifierOptionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price);

  /// Create a copy of ModifierOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifierOptionModelImplCopyWith<_$ModifierOptionModelImpl> get copyWith =>
      __$$ModifierOptionModelImplCopyWithImpl<_$ModifierOptionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModifierOptionModelImplToJson(
      this,
    );
  }
}

abstract class _ModifierOptionModel implements ModifierOptionModel {
  const factory _ModifierOptionModel(
      {required final int id,
      required final String name,
      required final double price}) = _$ModifierOptionModelImpl;

  factory _ModifierOptionModel.fromJson(Map<String, dynamic> json) =
      _$ModifierOptionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double get price;

  /// Create a copy of ModifierOptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModifierOptionModelImplCopyWith<_$ModifierOptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuCategoryModel _$MenuCategoryModelFromJson(Map<String, dynamic> json) {
  return _MenuCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$MenuCategoryModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'items_count')
  int get itemsCount => throw _privateConstructorUsedError;

  /// Serializes this MenuCategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuCategoryModelCopyWith<MenuCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCategoryModelCopyWith<$Res> {
  factory $MenuCategoryModelCopyWith(
          MenuCategoryModel value, $Res Function(MenuCategoryModel) then) =
      _$MenuCategoryModelCopyWithImpl<$Res, MenuCategoryModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'items_count') int itemsCount});
}

/// @nodoc
class _$MenuCategoryModelCopyWithImpl<$Res, $Val extends MenuCategoryModel>
    implements $MenuCategoryModelCopyWith<$Res> {
  _$MenuCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryName = null,
    Object? itemsCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuCategoryModelImplCopyWith<$Res>
    implements $MenuCategoryModelCopyWith<$Res> {
  factory _$$MenuCategoryModelImplCopyWith(_$MenuCategoryModelImpl value,
          $Res Function(_$MenuCategoryModelImpl) then) =
      __$$MenuCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'items_count') int itemsCount});
}

/// @nodoc
class __$$MenuCategoryModelImplCopyWithImpl<$Res>
    extends _$MenuCategoryModelCopyWithImpl<$Res, _$MenuCategoryModelImpl>
    implements _$$MenuCategoryModelImplCopyWith<$Res> {
  __$$MenuCategoryModelImplCopyWithImpl(_$MenuCategoryModelImpl _value,
      $Res Function(_$MenuCategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryName = null,
    Object? itemsCount = null,
  }) {
    return _then(_$MenuCategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      itemsCount: null == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuCategoryModelImpl implements _MenuCategoryModel {
  const _$MenuCategoryModelImpl(
      {required this.id,
      @JsonKey(name: 'category_name') required this.categoryName,
      @JsonKey(name: 'items_count') this.itemsCount = 0});

  factory _$MenuCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuCategoryModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  @override
  @JsonKey(name: 'items_count')
  final int itemsCount;

  @override
  String toString() {
    return 'MenuCategoryModel(id: $id, categoryName: $categoryName, itemsCount: $itemsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuCategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, categoryName, itemsCount);

  /// Create a copy of MenuCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuCategoryModelImplCopyWith<_$MenuCategoryModelImpl> get copyWith =>
      __$$MenuCategoryModelImplCopyWithImpl<_$MenuCategoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _MenuCategoryModel implements MenuCategoryModel {
  const factory _MenuCategoryModel(
          {required final int id,
          @JsonKey(name: 'category_name') required final String categoryName,
          @JsonKey(name: 'items_count') final int itemsCount}) =
      _$MenuCategoryModelImpl;

  factory _MenuCategoryModel.fromJson(Map<String, dynamic> json) =
      _$MenuCategoryModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'category_name')
  String get categoryName;
  @override
  @JsonKey(name: 'items_count')
  int get itemsCount;

  /// Create a copy of MenuCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuCategoryModelImplCopyWith<_$MenuCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
