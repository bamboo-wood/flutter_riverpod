import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_explanation/models/count_data.dart';

// Providerは定数をグローバル管理するためのもの
final titleProvider = Provider<String>((ref) {
  return 'Flutter Demo Home Page';
});

final messageProvider = Provider<String>((ref) {
  return 'You have pushed the button this many times:';
});

// State Providerは変数をグローバル管理するためのもの
final countProvider = StateProvider<int>((ref) {
  return 0;
});

final countDataProvider =
    StateProvider<CountData>((ref) => const CountData(count: 0, countUp: 0, countDown: 0));
