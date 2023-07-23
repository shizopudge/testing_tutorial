import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing_tutorial/login/home_screen.dart';
import 'package:testing_tutorial/login/login_page.dart';
import 'package:testing_tutorial/main.dart' as app;
import 'package:testing_tutorial/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'login test',
    () {
      testWidgets(
        'verify login page with correct username and password',
        (tester) async {
          app.main();
          await tester.pumpAndSettle();
          expect(find.byType(MainApp), findsOneWidget);
          expect(find.byKey(const Key('login_button')), findsOneWidget);
          await tester.tap(find.byKey(const Key('login_button')));
          await tester.pumpAndSettle();
          expect(find.byType(LoginPage), findsOneWidget);
          await tester.enterText(
              find.byKey(const Key('username_controller')), 'username');
          await Future.delayed(const Duration(milliseconds: 1000));
          await tester.enterText(
              find.byKey(const Key('password_controller')), 'password');
          await tester.tap(find.byType(ElevatedButton));
          await tester.pumpAndSettle();
          expect(find.byType(HomePage), findsOneWidget);
        },
      );

      testWidgets(
        'verify login page with incorrect username and password',
        (tester) async {
          app.main();
          await tester.pumpAndSettle();
          expect(find.byType(MainApp), findsOneWidget);
          expect(find.byKey(const Key('login_button')), findsOneWidget);
          await tester.tap(find.byKey(const Key('login_button')));
          await tester.pumpAndSettle();
          expect(find.byType(LoginPage), findsOneWidget);
          await tester.enterText(
              find.byKey(const Key('username_controller')), 'rustam');
          await Future.delayed(const Duration(milliseconds: 1000));
          await tester.enterText(
              find.byKey(const Key('password_controller')), '123456');
          await tester.tap(find.byType(ElevatedButton));
          await tester.pumpAndSettle();
          expect(find.byType(AlertDialog), findsOneWidget);
        },
      );
    },
  );
}
