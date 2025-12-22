import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/app_config.dart';

class ApiClient {
  late final Dio _dio;
  final Ref ref;
  
  ApiClient(this.ref) {
    print('API Client initialized with base URL: ${AppConfig.apiBaseUrl}');
    _dio = Dio(BaseOptions(
      baseUrl: AppConfig.apiBaseUrl,
      connectTimeout: AppConfig.connectionTimeout,
      receiveTimeout: AppConfig.receiveTimeout,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ));

    _dio.interceptors.add(AuthInterceptor(ref));
    _dio.interceptors.add(OfflineInterceptor(ref));
    _dio.interceptors.add(LoggingInterceptor());
  }

  Dio get dio => _dio;
}

class AuthInterceptor extends Interceptor {
  final Ref ref;

  AuthInterceptor(this.ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Skip auth for public endpoints
    if (options.path.contains('/auth/login') || 
        options.path.contains('/auth/otp')) {
      handler.next(options);
      return;
    }

    // Get token from shared preferences
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 - token expired
    if (err.response?.statusCode == 401) {
      // Try to refresh token or logout
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('auth_token');
    }
    handler.next(err);
  }
}

class OfflineInterceptor extends Interceptor {
  final Ref ref;

  OfflineInterceptor(this.ref);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // If offline and request is mutable, queue it
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.connectionError) {
      // Queue the request for later sync
      // SyncQueue.instance.addRequest(err.requestOptions);
    }
    handler.next(err);
  }
}

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final fullUrl = '${options.baseUrl}${options.path}';
    print('REQUEST[${options.method}] => FULL URL: $fullUrl');
    print('REQUEST HEADERS: ${options.headers}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final fullUrl = '${err.requestOptions.baseUrl}${err.requestOptions.path}';
    print('ERROR[${err.response?.statusCode}] => FULL URL: $fullUrl');
    print('ERROR TYPE: ${err.type}');
    print('ERROR MESSAGE: ${err.message}');
    if (err.response != null) {
      print('ERROR STATUS CODE: ${err.response?.statusCode}');
      print('ERROR DATA: ${err.response?.data}');
    } else {
      print('NO RESPONSE - Connection failed');
      print('Base URL was: ${err.requestOptions.baseUrl}');
    }
    handler.next(err);
  }
}

