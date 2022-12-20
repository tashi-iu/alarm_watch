import 'package:alarm_watch/navigation/router.dart';
import 'package:alarm_watch/providers/location_provider.dart';
import 'package:alarm_watch/providers/theme_provider.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeStateNotifier.notifier);
    final locationPermission = ref.watch(locationPermissionProvider.notifier);
    switch (locationPermission.status) {
      case LocationPermission.denied:
        locationPermission.checkPermissions();
        break;
      default:
    }
    return MaterialApp.router(
      title: 'Alarm Watch',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(scheme: FlexScheme.sakura, useMaterial3: true),
      darkTheme:
          FlexThemeData.dark(scheme: FlexScheme.sakura, useMaterial3: true),
      themeMode: theme.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      routerConfig: router,
    );
  }
}
