import 'package:freezed_annotation/freezed_annotation.dart';

part 'day.freezed.dart';
part 'day.g.dart';

@freezed
class Day with _$Day {
  const Day._();

  const factory Day({
    required Days day,
  }) = _Day;

  factory Day.fromJson(Map<String, Object?> json) => _$DayFromJson(json);

  @override
  String toString() {
    switch (day) {
      case Days.mon:
        return 'Monday';
      case Days.tue:
        return 'Tuesday';
      case Days.wed:
        return 'Wednesday';
      case Days.thu:
        return 'Thursday';
      case Days.fri:
        return 'Friday';
      case Days.sat:
        return 'Saturday';
      case Days.sun:
        return 'Sunday';
      default:
        throw Exception("DayException: Invalid day");
    }
  }
}

enum Days { mon, tue, wed, thu, fri, sat, sun }
