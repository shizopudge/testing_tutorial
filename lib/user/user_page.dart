import 'package:flutter/material.dart';
import 'package:testing_tutorial/user/user_model.dart';
import 'package:testing_tutorial/user/user_repository.dart';
import 'package:http/http.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Future<User> getUser = UserRepository(Client()).getUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: getUser,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return Text(
              snapshot.data.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            );
          },
        ),
      ),
    );
  }
}
