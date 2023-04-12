import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/count_data.dart';

class CountDataNotifier extends StateNotifier<CountData> {
  CountDataNotifier() : super(CountData.initial());

  void increase() {
    state = state.increase();
  }

  void decrease() {
    state = state.decrease();
  }

  void reset() {
    state = state.reset();
  }
}
