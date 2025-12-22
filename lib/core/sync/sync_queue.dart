import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class SyncQueueItem extends Equatable {
  final String id;
  final RequestOptions request;
  final DateTime createdAt;
  final int retryCount;

  SyncQueueItem({
    required this.id,
    required this.request,
    DateTime? createdAt,
    this.retryCount = 0,
  }) : createdAt = createdAt ?? DateTime.now();

  SyncQueueItem copyWith({
    int? retryCount,
  }) {
    return SyncQueueItem(
      id: id,
      request: request,
      createdAt: createdAt,
      retryCount: retryCount ?? this.retryCount,
    );
  }

  @override
  List<Object?> get props => [id, request.path, createdAt, retryCount];
}

class SyncQueue {
  final List<SyncQueueItem> _queue = [];
  static final SyncQueue _instance = SyncQueue._internal();
  
  factory SyncQueue() => _instance;
  SyncQueue._internal();

  void add(RequestOptions request) {
    final item = SyncQueueItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      request: request,
    );
    _queue.add(item);
  }

  SyncQueueItem? next() {
    if (_queue.isEmpty) return null;
    return _queue.first;
  }

  void remove(SyncQueueItem item) {
    _queue.remove(item);
  }

  bool get hasItems => _queue.isNotEmpty;
  
  int get count => _queue.length;
  
  List<SyncQueueItem> get all => List.unmodifiable(_queue);
  
  void clear() {
    _queue.clear();
  }
}

