import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testing_tutorial/user/user_model.dart';
import 'package:testing_tutorial/user/user_repository.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;

  setUpAll(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient);
  });
  group('UserRepository', () {
    group('getUser function', () {
      test(
        'given UserRepository class when getUser function is called and status code is 200 then an UserModel should be returned',
        () async {
          when(
            () => mockHTTPClient.get(
              Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
            ),
          ).thenAnswer(
            (invocation) async => Response(
              '''
              {
                    "id": 1,
                    "name": "Leanne Graham",
                    "email": "Sincere@april.biz",
                    "website": "hildegard.org"
              }
              ''',
              200,
            ),
          );

          final user = await userRepository.getUser();

          expect(user, isA<User>());
        },
      );

      test(
        'given UserRepository class when getUser function is called and status code is not 200 then an Exception should be thrown',
        () async {
          when(
            () => mockHTTPClient.get(
              Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
            ),
          ).thenAnswer(
            (invocation) async => Response(
              '{}',
              500,
            ),
          );

          final getUser = userRepository.getUser();

          expect(getUser, throwsException);
        },
      );
    });
  });
}
