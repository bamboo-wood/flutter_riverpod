import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_explanation/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    expect(find.text('0'), findsNWidgets(3));
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(CupertinoIcons.plus));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNWidgets(2));
  });

  testWidgets('Counter decrements smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    expect(find.text('0'), findsNWidgets(3));
    expect(find.text('-1'), findsNothing);

    await tester.tap(find.byIcon(CupertinoIcons.minus));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
    expect(find.text('-1'), findsNWidgets(2));
  });

  testWidgets('Counter resets smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    expect(find.text('0'), findsNWidgets(3));
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(CupertinoIcons.plus));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNWidgets(2));

    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();

    expect(find.text('0'), findsNWidgets(3));
    expect(find.text('1'), findsNothing);
  });
}
