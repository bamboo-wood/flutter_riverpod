// ignore_for_file: void_checks, invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_explanation/main.dart';
import 'package:flutter_riverpod_explanation/models/count_data.dart';
import 'package:flutter_riverpod_explanation/providers/provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/mock_count_data_notifier.dart';

void main() {
  const iPhone55 = Device(name: 'iPhone55', size: Size(414, 736), devicePixelRatio: 3.0);
  List<Device> devices = [iPhone55];

  setUpAll(() async {
    await loadAppFonts();
  });

  testGoldens('normal', (tester) async {
    await tester.pumpWidgetBuilder(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    await multiScreenGolden(
      tester,
      'my_home_page_initial',
      devices: devices,
    );

    await tester.tap(find.byIcon(CupertinoIcons.plus));
    await tester.tap(find.byIcon(CupertinoIcons.plus));
    await tester.tap(find.byIcon(CupertinoIcons.minus));
    await tester.pump();

    await multiScreenGolden(
      tester,
      'my_home_page_tapped',
      devices: devices,
    );
  });

  // Not working...🤯
  testGoldens('view_model_test', (tester) async {
    final mock = MockCountDataNotifier();

    await tester.pumpWidgetBuilder(
      ProviderScope(
        overrides: [countDataProvider.overrideWith((ref) => mock)],
        child: const MyHomePage(),
      ),
    );

    await multiScreenGolden(
      tester,
      'my_home_page_mock',
      devices: devices,
    );
  });
}
