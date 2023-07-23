import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testing_tutorial/user2/user_model_2.dart';

class UserRepository2 {
  Future<List<User2>> fetchUsers() async {
    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/users',
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => User2.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}
