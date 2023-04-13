import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_explanation/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('normal', (tester) async {
    const iPhone55 = Device(name: 'iPhone55', size: Size(414, 736), devicePixelRatio: 3.0);

    List<Device> devices = [iPhone55];

    await tester.pumpWidgetBuilder(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    await multiScreenGolden(
      tester,
      'my_home_page',
      devices: devices,
    );
  });
}
