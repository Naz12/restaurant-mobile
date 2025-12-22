import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ConnectionStatus {
  online,
  offline,
  checking,
}

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  final InternetConnectionChecker _connectionChecker = InternetConnectionChecker();
  
  StreamController<ConnectionStatus>? _statusController;
  Stream<ConnectionStatus>? _statusStream;

  ConnectivityService() {
    _statusController = StreamController<ConnectionStatus>.broadcast();
    _statusStream = _statusController!.stream;
    _monitorConnectivity();
  }

  Stream<ConnectionStatus> get statusStream => _statusStream!;

  Future<void> _monitorConnectivity() async {
    _connectivity.onConnectivityChanged.listen((result) async {
      if (result == ConnectivityResult.none) {
        _statusController?.add(ConnectionStatus.offline);
      } else {
        // Check actual internet connectivity
        final hasInternet = await _connectionChecker.hasConnection;
        _statusController?.add(
          hasInternet ? ConnectionStatus.online : ConnectionStatus.offline,
        );
      }
    });

    // Initial check
    final result = await _connectivity.checkConnectivity();
    
    if (result == ConnectivityResult.none) {
      _statusController?.add(ConnectionStatus.offline);
    } else {
      final hasInternet = await _connectionChecker.hasConnection;
      _statusController?.add(
        hasInternet ? ConnectionStatus.online : ConnectionStatus.offline,
      );
    }
  }

  Future<bool> isOnline() async {
    final result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      return false;
    }
    return await _connectionChecker.hasConnection;
  }

  void dispose() {
    _statusController?.close();
  }
}

final connectivityServiceProvider = Provider<ConnectivityService>((ref) {
  final service = ConnectivityService();
  ref.onDispose(() => service.dispose());
  return service;
});

