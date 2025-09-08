import 'dart:convert';

import '../models/user.dart';
import 'package:http/http.dart' as http;

Future<User> getCurrentUser(String userId) async {
  final response = await http.get(
    Uri.parse('http://127.0.0.1:8080/api/v1/users/$userId'),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    User user = User(username: data["username"],
        email: data["username"],
        fullName: data["full_name"],
        role: data["role"],
        isActive: data["is_active"],
        lastLogin: data["last_login"]
    );

    return user;
    // assuming you have a User.fromJson factory
  } else {
    throw Exception('Failed to load user');
  }
}