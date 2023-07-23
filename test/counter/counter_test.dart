import 'package:flutter_test/flutter_test.dart';
import 'package:testing_tutorial/counter/counter.dart';

void main() {
  late Counter counter;
  // Pretest
  setUp(() {
    counter = Counter();
  });
  // setUpAll(() => null);

  // Test
  group(
    'Counter Class',
    () {
      test(
        'given counter class when it is instantiated then the value of count should be 0',
        () {
          final val = counter.count;
          expect(val, 0);
        },
      );
      test(
        'given counter class when it is incremented then the value of count should be 1',
        () {
          counter.incrementCounter();
          final val = counter.count;
          expect(val, 1);
        },
      );

      test(
        'given counter class when it is decremented then the value of count should be -1',
        () {
          counter.decrementCounter();
          final val = counter.count;
          expect(val, -1);
        },
      );

      test(
          'given counter class when it is reseted then the value of counter should be 0',
          () {
        counter.reset();
        final val = counter.count;
        expect(val, 0);
      });
    },
  );

  // Post Test
  // tearDown(() => null);
  // tearDownAll(() => null);
}
