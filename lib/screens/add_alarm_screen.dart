import 'package:alarm_watch/globals/keys/add_alarm_form_keys.dart';
import 'package:alarm_watch/models/time.dart';
import 'package:alarm_watch/widgets/location_selector.dart';
import 'package:alarm_watch/widgets/time_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddAlarmScreen extends StatelessWidget {
  const AddAlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Add Alarm'),
      ),
      body: ListView(
        children: [
          FormBuilder(
            key: AddAlarmFormKeys.form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Remind me at'),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderField(
                  name: 'time',
                  builder: (field) => TimeField(
                    time: Time.now(),
                    onChange: (time) {
                      field.didChange(time);
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(value: true, onChanged: (_) {}),
                    const Text('when I am around'),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderField(
                  name: 'location',
                  builder: (field) => LocationSelector(
                    onChange: (latLng) {
                      field.didChange(latLng);
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
