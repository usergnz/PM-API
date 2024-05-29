import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  final String baseUrl = 'https://reqres.in/api';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      return List<User>.from(data.map((user) => User.fromJson(user)));
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<User> fetchUserById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$id'));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<http.Response> createUser(String name, String job) {
    return http.post(
      Uri.parse('$baseUrl/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'job': job,
      }),
    );
  }
}
