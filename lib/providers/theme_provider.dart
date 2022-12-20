import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeStateNotifier = StateNotifierProvider(
  (ref) => _ThemeStateNotifer(),
);

class _ThemeStateNotifer extends StateNotifier<bool> {
  _ThemeStateNotifer()
      : super(
          SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark,
        );

  bool get isDarkModeEnabled => state;

  void setLightTheme() {
    state = false;
  }

  void setDarkTheme() {
    state = true;
  }
}
