import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/providers/providers.dart';
import '../../../../shared/services/connectivity_service.dart';
import '../models/menu_item_model.dart';

class MenuRepository {
  final Ref ref;
  final ApiClient apiClient;
  final ConnectivityService connectivityService;

  MenuRepository({
    required this.ref,
    required this.apiClient,
    required this.connectivityService,
  });

  Future<List<MenuItemModel>> getMenuItems({
    int? categoryId,
    String? search,
    int? orderTypeId,
    int? deliveryAppId,
  }) async {
    final isOnline = await connectivityService.isOnline();

    if (isOnline) {
      try {
        final response = await apiClient.dio.get(
          '/menu/items',
          queryParameters: {
            if (categoryId != null) 'category_id': categoryId,
            if (search != null && search.isNotEmpty) 'search': search,
            if (orderTypeId != null) 'order_type_id': orderTypeId,
            if (deliveryAppId != null) 'delivery_app_id': deliveryAppId,
          },
        );

        print('Menu items response: ${response.data}');
        
        if (response.data['success'] == true && response.data['data'] != null) {
          final itemsList = response.data['data']['items'] as List?;
          if (itemsList != null && itemsList.isNotEmpty) {
            final items = itemsList
                .map((json) {
                  try {
                    return MenuItemModel.fromJson(json as Map<String, dynamic>);
                  } catch (e) {
                    print('Error parsing menu item: $e');
                    print('Menu item JSON: $json');
                    rethrow;
                  }
                })
                .toList();
            print('Loaded ${items.length} menu items');
            return items;
          } else {
            print('Items list is null or empty');
          }
        }
        
        print('No items found in response');
        return [];
      } catch (e) {
        print('Error loading menu items: $e');
        rethrow;
      }
    } else {
      // Return cached items from local database
      // TODO: Implement local database retrieval
      return [];
    }
  }

  Future<MenuItemModel> getMenuItem(int id, {int? orderTypeId, int? deliveryAppId}) async {
    final response = await apiClient.dio.get(
      '/menu/items/$id',
      queryParameters: {
        if (orderTypeId != null) 'order_type_id': orderTypeId,
        if (deliveryAppId != null) 'delivery_app_id': deliveryAppId,
      },
    );

    return MenuItemModel.fromJson(response.data['data']);
  }

  Future<List<MenuCategoryModel>> getCategories() async {
    final response = await apiClient.dio.get('/menu/categories');
    
    final categories = (response.data['data']['categories'] as List)
        .map((json) => MenuCategoryModel.fromJson(json))
        .toList();

    return categories;
  }
}

final menuRepositoryProvider = Provider<MenuRepository>((ref) {
  return MenuRepository(
    ref: ref,
    apiClient: ref.read(apiClientProvider),
    connectivityService: ref.read(connectivityServiceProvider),
  );
});

