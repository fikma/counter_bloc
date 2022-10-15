import 'package:fatree/app.dart';
import 'package:fatree/counter/view/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterApp', () {
    testWidgets('is a Material App', (WidgetTester tester) async {
      expect(const CounterApp(), isA<MaterialApp>());
    });

    testWidgets('home is CounterPage', (WidgetTester tester) async {
      expect(const CounterApp().home, isA<CounterPage>());
    });

    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const CounterApp());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
