import 'package:test/test.dart';
import 'package:flutter_riverpod_explanation/models/count_data.dart';

void main() {
  group('CountData tests', () {
    test('increase should increment the count and countUp properties', () {
      const countData = CountData(count: 0, countUp: 0, countDown: 0);
      final newCountData = countData.increase();

      expect(newCountData.count, equals(1));
      expect(newCountData.countUp, equals(1));
      expect(newCountData.countDown, equals(0));
    });

    test('decrease should decrement the count and countDown properties', () {
      const countData = CountData(count: 5, countUp: 5, countDown: 0);
      final newCountData = countData.decrease();

      expect(newCountData.count, equals(4));
      expect(newCountData.countUp, equals(5));
      expect(newCountData.countDown, equals(-1));
    });

    test('reset should set all properties to zero', () {
      const countData = CountData(count: 10, countUp: 5, countDown: 5);
      final newCountData = countData.reset();

      expect(newCountData.count, equals(0));
      expect(newCountData.countUp, equals(0));
      expect(newCountData.countDown, equals(0));
    });
  });
}
