import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database.dart';
import '../network/api_client.dart';

export '../database/database.dart' show AppDatabase;
export '../network/api_client.dart' show ApiClient;

final databaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError('databaseProvider must be overridden in main.dart');
});

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref);
});

