import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:testing_tutorial/article/article.dart';
import 'package:testing_tutorial/news/news_change_notifier.dart';
import 'package:testing_tutorial/news/news_page.dart';
import 'package:testing_tutorial/news/news_service.dart';
import 'package:flutter/material.dart';

class MockNewsService extends Mock implements NewsService {}

void main() {
  late MockNewsService mockNewsService;

  setUp(
    () {
      mockNewsService = MockNewsService();
    },
  );

  const List<Article> articlesFromService = [
    Article(title: 'Test 1', content: 'Test 1 Content'),
    Article(title: 'Test 2', content: 'Test 2 Content'),
    Article(title: 'Test 3', content: 'Test 3 Content')
  ];

  void arrangeNewsServiceReturns3Articles() {
    when(() => mockNewsService.getArticles()).thenAnswer(
      (invocation) async => articlesFromService,
    );
  }

  void arrangeNewsServiceReturns3ArticlesAfter2SecondsWait() {
    when(() => mockNewsService.getArticles()).thenAnswer(
      (invocation) async {
        await Future.delayed(const Duration(milliseconds: 2000));
        return articlesFromService;
      },
    );
  }

  Widget createWidgetUnderTest() => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
          create: (_) => NewsChangeNotifier(mockNewsService),
          child: const NewsPage(),
        ),
      );

  group('NewsPAge', () {
    testWidgets(
      'given NewsPage class when it is builded then title should be displayed',
      (WidgetTester widgetTester) async {
        arrangeNewsServiceReturns3Articles();
        await widgetTester.pumpWidget(createWidgetUnderTest());
        expect(find.text('News'), findsOneWidget);
      },
    );

    testWidgets(
      'given NewsPage class when it is loading data then loading indicator should be displayed',
      (WidgetTester widgetTester) async {
        arrangeNewsServiceReturns3ArticlesAfter2SecondsWait();
        await widgetTester.pumpWidget(createWidgetUnderTest());
        await widgetTester.pump(const Duration(milliseconds: 500));
        expect(find.byKey(const Key('progress-indicator')), findsOneWidget);
        await widgetTester.pumpAndSettle();
      },
    );

    testWidgets(
      'given NewsPage class when it is loaded data then list of articles should be displayed',
      (widgetTester) async {
        arrangeNewsServiceReturns3Articles();
        await widgetTester.pumpWidget(createWidgetUnderTest());
        await widgetTester.pump();
        for (final article in articlesFromService) {
          expect(find.text(article.title), findsOneWidget);
          expect(find.text(article.content), findsOneWidget);
        }
      },
    );
  });
}
