import 'package:alarm_watch/models/alarm.dart';
import 'package:alarm_watch/models/day.dart';
import 'package:alarm_watch/models/time.dart';
import 'package:alarm_watch/widgets/alarm_card.dart';
import 'package:flutter/material.dart';

class AlarmsScreen extends StatelessWidget {
  const AlarmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Alarm(time: Time.now(), repeats: [Days.mon, Days.thu]),
        Alarm(time: Time.now(), repeats: [Days.wed, Days.thu, Days.sat]),
        Alarm(time: Time.now(), repeats: [Days.fri, Days.sat, Days.sun]),
      ]
          .map(
            (alarm) => AlarmCard(
              isOn: true,
              onToggled: (_) {},
              alarm: alarm,
            ),
          )
          .toList(),
    );
  }
}
