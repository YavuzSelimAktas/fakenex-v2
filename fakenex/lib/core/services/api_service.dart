import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/users';
  Future<String> getUsers() async {
    try {
     
      final response = await http.get(Uri.parse('$_baseUrl/users'));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('API isteği başarısız oldu. Hata kodu: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Veri çekilirken bir hata oluştu: $e');
    }
  }
}