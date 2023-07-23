import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testing_tutorial/article/article.dart';
import 'package:testing_tutorial/news/news_change_notifier.dart';
import 'package:testing_tutorial/news/news_service.dart';

// class BadMockNewsService implements NewsService {
//   bool getArticlesCalled = false;
//   @override
//   Future<List<Article>> getArticles() async {
//     getArticlesCalled = true;
//     return [
//       Article(
//         title: 'Test 1',
//         content: 'Test Content 1',
//       ),
//       Article(
//         title: 'Test 2',
//         content: 'Test Content 2',
//       ),
//       Article(
//         title: 'Test 3',
//         content: 'Test Content 3',
//       ),
//       Article(
//         title: 'Test 4',
//         content: 'Test Content 4',
//       ),
//       Article(
//         title: 'Test 5',
//         content: 'Test Content 5',
//       ),
//     ];
//   }
// }

class MockNewsService extends Mock implements NewsService {}

void main() {
  // sut - System Under Test
  late NewsChangeNotifier sut;
  late MockNewsService mockNewsService;

  setUp(() {
    mockNewsService = MockNewsService();
    sut = NewsChangeNotifier(mockNewsService);
  });

  group(
    'NewsChangeNotifier',
    () {
      test(
        'given NewsChangeNotifier class when it is initialized then the values should be correct',
        () {
          expect(sut.articles, []);
          expect(sut.isLoading, false);
        },
      );

      group('getArticles', () {
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

        test(
          'given NewsChangeNotifier class when getArticles function is called then getArticles should be called once',
          () async {
            arrangeNewsServiceReturns3Articles();
            await sut.getArticles();
            verify(() => mockNewsService.getArticles()).called(1);
          },
        );

        test(
          '''given NewsChangeNotifier class when getArticles function is called 
        then indicates loading of data, sets articles to the ones from the service 
        and inidcates that the data is not being loaded anymore''',
          () async {
            arrangeNewsServiceReturns3Articles();
            final getArticles = sut.getArticles();
            expect(sut.isLoading, true);
            await getArticles;
            expect(sut.articles, articlesFromService);
            expect(sut.isLoading, false);
          },
        );
      });
    },
  );
}
