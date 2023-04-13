import 'package:flutter_riverpod_explanation/models/count_data.dart';
import 'package:flutter_riverpod_explanation/notifiers/count_data_notifier.dart';
import 'package:mocktail/mocktail.dart';

class MockCountDataNotifier extends Mock implements CountDataNotifier {
  MockCountDataNotifier() {
    _registerFallbackValue();
  }

  void _registerFallbackValue() {
    registerFallbackValue(CountData.initial());
  }
}
