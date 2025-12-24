import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/delivery_executive_repository.dart';
import '../../data/models/delivery_executive_model.dart';

final deliveryExecutivesProvider = FutureProvider<List<DeliveryExecutiveModel>>((ref) async {
  final repository = ref.read(deliveryExecutiveRepositoryProvider);
  return await repository.getDeliveryExecutives();
});

