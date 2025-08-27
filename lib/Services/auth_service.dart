import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class AuthService {
  static const String baseUrl = 'http://127.0.0.1:8000/api/v1/auth';

  //Login Method
  Future<bool> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );
      // Uncomment this to debug. For development purpose only
      // print(response.body); <<<<<<<-|

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        // Store token or user data if needed
        // You can use shared_preferences here for persistent storage
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // Uncomment this to debug. For development purpose only
      // print('Login error: $e'); <<<<<<<-|
      throw Exception('Network error occurred');
    }

  }
}
