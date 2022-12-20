// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Day _$$_DayFromJson(Map<String, dynamic> json) => _$_Day(
      day: $enumDecode(_$DaysEnumMap, json['day']),
    );

Map<String, dynamic> _$$_DayToJson(_$_Day instance) => <String, dynamic>{
      'day': _$DaysEnumMap[instance.day]!,
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
