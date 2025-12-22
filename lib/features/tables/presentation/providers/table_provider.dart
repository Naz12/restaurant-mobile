import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/table_repository.dart';
import '../../data/models/table_model.dart';

final tablesProvider = FutureProvider.family<List<TableModel>, Map<String, dynamic>>((ref, filters) async {
  final repository = ref.read(tableRepositoryProvider);
  return await repository.getTables(
    areaId: filters['area_id'] as int?,
    status: filters['status'] as String?,
  );
});

final tableProvider = FutureProvider.family<TableModel, int>((ref, id) async {
  final repository = ref.read(tableRepositoryProvider);
  return await repository.getTable(id);
});

final tableAreasProvider = FutureProvider<List<TableAreaModel>>((ref) async {
  final repository = ref.read(tableRepositoryProvider);
  return await repository.getAreas();
});

