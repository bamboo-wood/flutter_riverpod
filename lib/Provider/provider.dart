import 'package:flutter_riverpod/flutter_riverpod.dart';

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
