import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/app_config.dart';
import 'sync_queue.dart';
import 'peer_to_peer_sync.dart';

// Provider will be defined in main.dart or separate file
final apiClientProvider = Provider((ref) => throw UnimplementedError());

enum SyncStatus {
  online,
  offline,
  syncing,
  error,
}

class SyncManager {
  final Ref ref;
  final SyncQueue syncQueue;
  final PeerToPeerSync peerToPeerSync;
  Timer? _syncTimer;
  ConnectivityResult _connectivity = ConnectivityResult.none;
  
  SyncManager(this.ref)
      : syncQueue = SyncQueue(),
        peerToPeerSync = PeerToPeerSync();

  Future<void> initialize() async {
    // Monitor connectivity
    Connectivity().onConnectivityChanged.listen((result) {
      _connectivity = result;
      _updateSyncStrategy();
    });

    // Check initial connectivity
    _connectivity = await Connectivity().checkConnectivity();
    _updateSyncStrategy();
  }

  void _updateSyncStrategy() {
    _syncTimer?.cancel();

    if (_isOnline()) {
      // Online: Prefer internet, sync every 5 seconds
      _syncTimer = Timer.periodic(
        AppConfig.onlineSyncInterval,
        (_) => _syncWhenOnline(),
      );
      // Process queued items immediately
      _processQueue();
    } else {
      // Offline: Use peer-to-peer sync every 2 seconds
      _syncTimer = Timer.periodic(
        AppConfig.peerToPeerSyncInterval,
        (_) => _syncPeerToPeer(),
      );
    }
  }

  bool _isOnline() {
    return _connectivity != ConnectivityResult.none;
  }

  Future<void> _syncWhenOnline() async {
    try {
      // Pull latest updates
      await _pullUpdates();
      
      // Push queued changes
      await _processQueue();
    } catch (e) {
      print('Sync error: $e');
    }
  }

  Future<void> _syncPeerToPeer() async {
    // Only use peer-to-peer when definitely offline
    // Prefer internet if available
    if (!_isOnline()) {
      await peerToPeerSync.syncWithLocalDevices();
    }
  }

  Future<void> _pullUpdates() async {
    // Use UpdateController to get latest changes
    // This will update local database
  }

  Future<void> _processQueue() async {
    while (syncQueue.hasItems) {
      final item = syncQueue.next();
      if (item != null) {
        try {
          await _executeQueuedRequest(item);
          syncQueue.remove(item);
        } catch (e) {
          // Keep in queue for retry
          print('Failed to sync item: $e');
        }
      }
    }
  }

  Future<void> _executeQueuedRequest(SyncQueueItem item) async {
    // Execute the queued request
    // TODO: Implement queue execution
  }

  Future<void> manualSync() async {
    await _pullUpdates();
    await _processQueue();
  }

  void dispose() {
    _syncTimer?.cancel();
  }
}

final syncManagerProvider = Provider<SyncManager>((ref) {
  final manager = SyncManager(ref);
  manager.initialize();
  return manager;
});

