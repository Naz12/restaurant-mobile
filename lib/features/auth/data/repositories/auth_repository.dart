import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/providers/providers.dart';
import '../models/user_model.dart';

class AuthRepository {
  final Ref ref;
  final ApiClient apiClient;
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';

  AuthRepository({
    required this.ref,
    required this.apiClient,
  });

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiClient.dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      // Check if response data is valid
      if (response.data == null) {
        return AuthResponse(
          success: false,
          message: 'Invalid response from server',
        );
      }

      final authResponse = AuthResponse.fromJson(response.data);
      
      if (authResponse.success && authResponse.data?.token != null) {
        await _saveToken(authResponse.data!.token!);
        if (authResponse.data?.user != null) {
          await _saveUser(authResponse.data!.user!);
        }
      }

      return authResponse;
    } on DioException catch (e) {
      String errorMessage = 'Login failed';
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        errorMessage = 'Cannot connect to server. Please check your connection.';
      } else if (e.response != null) {
        errorMessage = e.response?.data['message'] ?? 
                      'Login failed: ${e.response?.statusCode}';
      } else {
        errorMessage = 'Login failed: ${e.message}';
      }
      return AuthResponse(
        success: false,
        message: errorMessage,
      );
    } catch (e) {
      return AuthResponse(
        success: false,
        message: 'Login failed: ${e.toString()}',
      );
    }
  }

  Future<AuthResponse> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await apiClient.dio.post(
        '/auth/otp/verify',
        data: {
          'email': email,
          'otp': otp,
        },
      );

      // Check if response data is valid
      if (response.data == null) {
        return AuthResponse(
          success: false,
          message: 'Invalid response from server',
        );
      }

      final authResponse = AuthResponse.fromJson(response.data);
      
      if (authResponse.success && authResponse.data?.token != null) {
        await _saveToken(authResponse.data!.token!);
        if (authResponse.data?.user != null) {
          await _saveUser(authResponse.data!.user!);
        }
      }

      return authResponse;
    } on DioException catch (e) {
      String errorMessage = 'OTP verification failed';
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        errorMessage = 'Cannot connect to server. Please check your connection.';
      } else if (e.response != null) {
        errorMessage = e.response?.data['message'] ?? 
                      'OTP verification failed: ${e.response?.statusCode}';
      } else {
        errorMessage = 'OTP verification failed: ${e.message}';
      }
      return AuthResponse(
        success: false,
        message: errorMessage,
      );
    } catch (e) {
      return AuthResponse(
        success: false,
        message: 'OTP verification failed: ${e.toString()}',
      );
    }
  }

  Future<UserModel?> getCurrentUser() async {
    try {
      final response = await apiClient.dio.get('/auth/user');
      if (response.data['success']) {
        final user = UserModel.fromJson(response.data['data']['user']);
        await _saveUser(user);
        return user;
      }
      return null;
    } catch (e) {
      return await _getSavedUser();
    }
  }

  Future<void> logout() async {
    try {
      await apiClient.dio.post('/auth/logout');
    } catch (e) {
      // Continue with local logout even if API call fails
    } finally {
      await _clearAuth();
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<void> _saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  Future<UserModel?> _getSavedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString(_userKey);
    if (userData != null) {
      try {
        final json = jsonDecode(userData) as Map<String, dynamic>;
        return UserModel.fromJson(json);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  Future<void> _clearAuth() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref: ref,
    apiClient: ref.read(apiClientProvider),
  );
});

