import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time.freezed.dart';
part 'time.g.dart';

@freezed
class Time with _$Time {
  const Time._();

  @Assert('hour >= 0 && hour <= 23', 'hour has to be between 0 to 23')
  @Assert('minute >= 0 && hour <= 59', 'minute has to be between 0 to 59')
  const factory Time({
    required int hour,
    required int minute,
  }) = _Time;

  factory Time.fromJson(Map<String, Object?> json) => _$TimeFromJson(json);
  
  String format({bool use24hformat = true}) {
    final formattedHour = use24hformat ? hour : hour % 12;
    return '${_toDoubleDigits(formattedHour)}:${_toDoubleDigits(minute)}${use24hformat ? '' : hour > 12 ? 'PM' : 'AM'}';
  }

  String _toDoubleDigits(int number) {
    return number > 9 ? '$number' : '0$number';
  }


  static Time now() {
    return Time(hour: DateTime.now().hour, minute: DateTime.now().minute);
  }
}
