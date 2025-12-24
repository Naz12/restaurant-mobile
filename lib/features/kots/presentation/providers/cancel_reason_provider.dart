import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/kot_repository.dart';
import '../../data/models/cancel_reason_model.dart';

final kotCancelReasonsProvider = FutureProvider<List<CancelReasonModel>>((ref) async {
  final repository = ref.read(kotRepositoryProvider);
  return await repository.getCancelReasons();
});

