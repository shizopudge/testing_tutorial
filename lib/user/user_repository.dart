import 'user_model.dart';
import 'package:http/http.dart';

class UserRepository {
  final Client client;
  UserRepository(this.client);

  Future<User> getUser() async {
    final response = await client.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/users/1',
      ),
    );
    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    }
    throw Exception('Some Error Occured');
  }
}
