import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://127.0.0.1:5000'; // Ganti dengan endpoint Anda

  Future<Map<String, dynamic>> register(String name, String email, String password) async {
    final String apiUrl = '$baseUrl/register';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        return {'success': true, 'data': json.decode(response.body)};
      } else {
        return {'success': false, 'message': 'Status code: ${response.statusCode}'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Terjadi kesalahan saat menghubungi server.'};
    }
  }
}