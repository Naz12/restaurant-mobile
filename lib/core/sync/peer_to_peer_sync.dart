import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import '../config/app_config.dart';

class PeerToPeerSync {
  HttpServer? _localServer;
  final NetworkInfo _networkInfo = NetworkInfo();

  Future<void> startLocalServer() async {
    try {
      _localServer = await HttpServer.bind(
        InternetAddress.anyIPv4,
        AppConfig.localServerPort,
      );
      
      _localServer!.listen((request) {
        _handleLocalRequest(request);
      });
    } catch (e) {
      print('Failed to start local server: $e');
    }
  }

  void _handleLocalRequest(HttpRequest request) {
    // Handle sync requests from other devices
    // Exchange local database changes
  }

  Future<void> syncWithLocalDevices() async {
    // Discover other devices on local network
    final localIp = await _getLocalIp();
    if (localIp == null) return;

    // Scan local network for other devices
    final networkPrefix = _getNetworkPrefix(localIp);
    
    // Try to connect to other devices
    for (int i = 1; i <= 254; i++) {
      final ip = '$networkPrefix.$i';
      if (ip != localIp) {
        await _trySyncWithDevice(ip);
      }
    }
  }

  Future<void> _trySyncWithDevice(String ip) async {
    try {
      final url = Uri.parse('http://$ip:${AppConfig.localServerPort}/sync');
      final response = await http.get(url).timeout(
        const Duration(seconds: 1),
      );
      
      if (response.statusCode == 200) {
        // Exchange sync data
        await _exchangeData(ip, response.body);
      }
    } catch (e) {
      // Device not available or not running server
    }
  }

  Future<void> _exchangeData(String deviceIp, String theirData) async {
    // Get our local changes
    // Send to other device
    // Receive their changes
    // Merge into local database
  }

  Future<String?> _getLocalIp() async {
    try {
      final wifiIP = await _networkInfo.getWifiIP();
      return wifiIP;
    } catch (e) {
      return null;
    }
  }

  String _getNetworkPrefix(String ip) {
    final parts = ip.split('.');
    return '${parts[0]}.${parts[1]}.${parts[2]}';
  }

  void stopLocalServer() {
    _localServer?.close();
  }
}

