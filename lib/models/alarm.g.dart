// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Alarm _$$_AlarmFromJson(Map<String, dynamic> json) => _$_Alarm(
      time: Time.fromJson(json['time'] as Map<String, dynamic>),
      repeats: (json['repeats'] as List<dynamic>)
          .map((e) => $enumDecode(_$DaysEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$_AlarmToJson(_$_Alarm instance) => <String, dynamic>{
      'time': instance.time,
      'repeats': instance.repeats.map((e) => _$DaysEnumMap[e]!).toList(),
    };

const _$DaysEnumMap = {
  Days.mon: 'mon',
  Days.tue: 'tue',
  Days.wed: 'wed',
  Days.thu: 'thu',
  Days.fri: 'fri',
  Days.sat: 'sat',
  Days.sun: 'sun',
};
