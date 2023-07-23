import 'package:flutter/material.dart';
import 'package:testing_tutorial/user2/user_model_2.dart';

class UserPage2 extends StatelessWidget {
  final Future<List<User2>> futureUsers;
  const UserPage2({
    super.key,
    required this.futureUsers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User2s'),
      ),
      body: FutureBuilder<List<User2>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<User2> users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
