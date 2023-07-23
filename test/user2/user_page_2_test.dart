import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_tutorial/user2/user_model_2.dart';
import 'package:testing_tutorial/user2/user_page_2.dart';

void main() {
  testWidgets(
    '''given UserPage2 class when data is loaded 
  then list of users with title as name and subtitle as email 
  should be displayed''',
    (tester) async {
      final users = [
        User2(id: 1, name: 'Rustam', email: 'rustam@mail.com'),
        User2(id: 2, name: 'Andrey', email: 'andrey@mail.com'),
        User2(id: 3, name: 'Vsevolod', email: 'vsevolod@mail.com'),
        User2(id: 4, name: 'Ekaterina', email: 'ekaterina@mail.com'),
        User2(id: 5, name: 'Vlada', email: 'vlada@mail.com'),
      ];
      Future<List<User2>> mockFetchUsers() async =>
          await Future.delayed(const Duration(milliseconds: 1000), () => users);

      await tester.pumpWidget(
        MaterialApp(
          home: UserPage2(
            futureUsers: mockFetchUsers(),
          ),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(users.length));
      for (final user in users) {
        expect(find.text(user.name), findsOneWidget);
        expect(find.text(user.email), findsOneWidget);
      }
    },
  );
}
