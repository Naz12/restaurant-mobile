import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/menu_repository.dart';
import '../../data/models/menu_item_model.dart';

final menuItemsProvider = FutureProvider.family<List<MenuItemModel>, Map<String, dynamic>>((ref, filters) async {
  final repository = ref.read(menuRepositoryProvider);
  return await repository.getMenuItems(
    categoryId: filters['category_id'] as int?,
    search: filters['search'] as String?,
    orderTypeId: filters['order_type_id'] as int?,
    deliveryAppId: filters['delivery_app_id'] as int?,
  );
});

final menuItemProvider = FutureProvider.family<MenuItemModel, Map<String, dynamic>>((ref, params) async {
  final repository = ref.read(menuRepositoryProvider);
  return await repository.getMenuItem(
    params['id'] as int,
    orderTypeId: params['order_type_id'] as int?,
    deliveryAppId: params['delivery_app_id'] as int?,
  );
});

final menuCategoriesProvider = FutureProvider<List<MenuCategoryModel>>((ref) async {
  final repository = ref.read(menuRepositoryProvider);
  return await repository.getCategories();
});

