import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/dashboard_repository.dart';
import '../../../orders/data/models/order_model.dart';

final dashboardStatsProvider = FutureProvider<DashboardStats>((ref) async {
  final repository = ref.read(dashboardRepositoryProvider);
  final todayCount = await repository.getTodayOrdersCount();
  final yesterdayCount = await repository.getYesterdayOrdersCount();
  
  double percentageChange = 0.0;
  if (yesterdayCount > 0) {
    percentageChange = ((todayCount - yesterdayCount) / yesterdayCount) * 100;
  } else if (todayCount > 0) {
    percentageChange = 100.0; // 100% increase from 0
  }

  return DashboardStats(
    todayCount: todayCount,
    yesterdayCount: yesterdayCount,
    percentageChange: percentageChange,
  );
});

final todayOrdersProvider = FutureProvider<List<OrderModel>>((ref) async {
  final repository = ref.read(dashboardRepositoryProvider);
  return await repository.getTodayOrders(limit: 10);
});

class DashboardStats {
  final int todayCount;
  final int yesterdayCount;
  final double percentageChange;

  DashboardStats({
    required this.todayCount,
    required this.yesterdayCount,
    required this.percentageChange,
  });
}


