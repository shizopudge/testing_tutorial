import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_tutorial/animation/animation_page.dart';

void main() {
  testWidgets(
    'given AnimationPage class when it is builded then animation should by played',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AnimationPage(),
        ),
      );
      var containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      var container = tester.widget<Container>(containerFinder);

      // INITIAL
      expect(container.constraints!.minWidth, 50);
      expect(container.constraints!.minHeight, 50);
      expect((container.decoration as BoxDecoration).color, Colors.blue);
      expect((container.decoration as BoxDecoration).borderRadius,
          BorderRadius.zero);

      await tester.pumpAndSettle();

      containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      container = tester.widget<Container>(containerFinder);

      // AFTER ANIMATION
      expect(container.constraints!.minWidth, 200);
      expect(container.constraints!.minHeight, 200);
      expect((container.decoration as BoxDecoration).color, Colors.green);
      expect((container.decoration as BoxDecoration).borderRadius,
          BorderRadius.circular(50));
    },
  );
}
