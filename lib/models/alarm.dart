import 'package:alarm_watch/models/day.dart';
import 'package:alarm_watch/models/time.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm.freezed.dart';
part 'alarm.g.dart';

@freezed
class Alarm with _$Alarm {
  const factory Alarm({
    required Time time,
    required List<Days> repeats,
  }) = _Alarm;

  factory Alarm.fromJson(Map<String, Object?> json) => _$AlarmFromJson(json);
}
