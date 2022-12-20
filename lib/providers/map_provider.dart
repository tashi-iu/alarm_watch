import 'package:alarm_watch/providers/theme_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mapThemeProvider = FutureProvider((ref) async {
  final theme = ref.watch(themeStateNotifier.notifier);

  final mapStyle = await rootBundle.loadString(
      'assets/map_styles/${theme.isDarkModeEnabled ? 'dark' : 'light'}.json');

  return mapStyle;
});
