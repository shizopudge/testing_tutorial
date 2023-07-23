import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_tutorial/counter/counter_page.dart';
import 'package:testing_tutorial/login/login_page.dart';
import 'package:testing_tutorial/user2/user_page_2.dart';
import 'package:testing_tutorial/user2/user_repository_2.dart';

import 'animation/animation_page.dart';
import 'news/news_change_notifier.dart';
import 'news/news_page.dart';
import 'news/news_service.dart';
import 'user/user_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const UserPage(),
                    ),
                  ),
                  color: Colors.black,
                  child: Text(
                    'USER',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CounterPage(),
                    ),
                  ),
                  color: Colors.black,
                  child: Text(
                    'COUNTER',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (_) => NewsChangeNotifier(NewsService()),
                        child: const NewsPage(),
                      ),
                    ),
                  ),
                  color: Colors.black,
                  child: Text(
                    'NEWS',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UserPage2(
                        futureUsers: UserRepository2().fetchUsers(),
                      ),
                    ),
                  ),
                  color: Colors.black,
                  child: Text(
                    'USERS',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AnimationPage(),
                    ),
                  ),
                  color: Colors.black,
                  child: Text(
                    'ANIMATION',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  key: const Key('login_button'),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  ),
                  color: Colors.black,
                  child: Text(
                    'LOGIN',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
