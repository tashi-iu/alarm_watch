import 'package:alarm_watch/models/alarm.dart';
import 'package:alarm_watch/models/day.dart';
import 'package:flutter/material.dart';

class AlarmCard extends StatelessWidget {
  final Alarm alarm;
  final bool isOn;
  final void Function(bool) onToggled;

  const AlarmCard({
    super.key,
    required this.isOn,
    required this.onToggled,
    required this.alarm,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(alarm.time.format(), style: const TextStyle(fontSize: 56)),
                Switch(value: isOn, onChanged: onToggled)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Theme.of(context).colorScheme.background,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  alarm.repeats.fold(
                      '',
                      (text, day) =>
                          '${text.isNotEmpty ? '$text,' : ''} ${Day(day: day).toString().substring(0, 3)}'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
