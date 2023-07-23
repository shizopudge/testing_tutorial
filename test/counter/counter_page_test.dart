import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_tutorial/counter/counter_page.dart';

void main() {
  testWidgets(
    'given CounterPage with counter 0 when increment button is clicked then counter should be 1 ',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CounterPage(),
        ),
      );
      expect(find.byType(AppBar), findsOneWidget);
      final counter = find.text('Count: 0');
      expect(counter, findsOneWidget);
      final counter2 = find.text('Count: 1');
      expect(counter2, findsNothing);
      final incrementButton = find.byKey(const Key('increment-counter-button'));
      await tester.tap(incrementButton);
      await tester.pump();
      final counter3 = find.text('Count: 1');
      expect(counter3, findsOneWidget);
      final counter4 = find.text('Count: 0');
      expect(counter4, findsNothing);
    },
  );
}
