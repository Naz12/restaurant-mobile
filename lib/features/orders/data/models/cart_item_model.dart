import '../../../menu/data/models/menu_item_model.dart';

/// Cart item model for order creation
/// Represents an item in the cart before order is created
class CartItem {
  final String key; // Unique key for cart item
  final MenuItemModel menuItem;
  final MenuItemVariationModel? variation;
  final int quantity;
  final List<int> modifierOptionIds; // IDs of selected modifier options
  final String? note; // Item-specific note
  final double basePrice;
  final double modifierPrice;
  final double totalPrice; // (basePrice + modifierPrice) * quantity
  final double? itemTaxRate; // Tax rate for this item (if item-level tax)
  final double? itemTaxAmount; // Calculated tax amount for this item

  CartItem({
    required this.key,
    required this.menuItem,
    this.variation,
    required this.quantity,
    required this.modifierOptionIds,
    this.note,
    this.basePrice = 0.0,
    this.modifierPrice = 0.0,
    this.totalPrice = 0.0,
    this.itemTaxRate,
    this.itemTaxAmount,
  });

  CartItem copyWith({
    String? key,
    MenuItemModel? menuItem,
    MenuItemVariationModel? variation,
    int? quantity,
    List<int>? modifierOptionIds,
    String? note,
    double? basePrice,
    double? modifierPrice,
    double? totalPrice,
    double? itemTaxRate,
    double? itemTaxAmount,
  }) {
    return CartItem(
      key: key ?? this.key,
      menuItem: menuItem ?? this.menuItem,
      variation: variation ?? this.variation,
      quantity: quantity ?? this.quantity,
      modifierOptionIds: modifierOptionIds ?? this.modifierOptionIds,
      note: note ?? this.note,
      basePrice: basePrice ?? this.basePrice,
      modifierPrice: modifierPrice ?? this.modifierPrice,
      totalPrice: totalPrice ?? this.totalPrice,
      itemTaxRate: itemTaxRate ?? this.itemTaxRate,
      itemTaxAmount: itemTaxAmount ?? this.itemTaxAmount,
    );
  }

  /// Calculate total price for this cart item
  double calculateTotal() {
    return (basePrice + modifierPrice) * quantity;
  }

  /// Convert to API format for order creation
  Map<String, dynamic> toOrderItemJson() {
    return {
      'menu_item_id': menuItem.id,
      if (variation != null) 'variation_id': variation!.id,
      'quantity': quantity,
      'modifiers': modifierOptionIds,
      if (note != null && note!.isNotEmpty) 'note': note,
    };
  }
}

