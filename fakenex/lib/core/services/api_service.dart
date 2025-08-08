import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 3000),
    headers: {
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36',
      'Accept': 'application/json',
    },
  ));

  Future<List<dynamic>> getUsers() async {
    try {
      final response = await _dio.get('/users');
      return response.data;
      
    } on DioException catch (e) {
      debugPrint('Dio error: ${e.message}');
      throw Exception('API isteği başarısız oldu: ${e.message}');
    } catch (e) {
      debugPrint('Unexpected error: $e');
      throw Exception('Veri çekilirken beklenmedik bir hata oluştu: $e');
    }
  }
}