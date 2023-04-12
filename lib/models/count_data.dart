import 'package:freezed_annotation/freezed_annotation.dart';

part 'count_data.freezed.dart';
part 'count_data.g.dart';

@freezed
class CountData with _$CountData {
  const factory CountData({
    required int count,
    required int countUp,
    required int countDown,
  }) = _CountData;

  factory CountData.initial() => const CountData(count: 0, countDown: 0, countUp: 0);

  factory CountData.fromJson(Map<String, dynamic> json) => _$CountDataFromJson(json);
}

extension CountDataX on CountData {
  CountData increase() {
    return CountData(
      count: count + 1,
      countUp: countUp + 1,
      countDown: countDown,
    );
  }

  CountData decrease() {
    return CountData(
      count: count - 1,
      countUp: countUp,
      countDown: countDown - 1,
    );
  }

  CountData reset() {
    return CountData.initial();
  }
}
