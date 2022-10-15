import 'package:fatree/counter/counter.dart';
import 'package:fatree/counter/view/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterPage', () {
    testWidgets('tampilkan CounterView', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: CounterPage(),
      ));

      expect(find.byType(CounterView), findsOneWidget);
    });
  });
}
