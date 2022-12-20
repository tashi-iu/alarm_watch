import 'package:alarm_watch/navigation/scaffold_shell_route.dart';
import 'package:alarm_watch/screens/add_alarm_screen.dart';
import 'package:alarm_watch/screens/alarms_screen.dart';
import 'package:alarm_watch/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => '/alarms',
    ),
    ScaffoldShellRoute(
      routeItems: [
        RouteNavItem(
          title: 'Alarms',
          navItemWidget: const BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Alarms',
          ),
          route: GoRoute(
            path: '/alarms',
            builder: (context, state) => const AlarmsScreen(),
          ),
        ),
        RouteNavItem(
          navItemWidget: const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          route: GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
        )
      ],
    ),
    GoRoute(
      path: '/add-alarm',
      pageBuilder: (context, state) => const MaterialPage(
        child: AddAlarmScreen(),
      ),
      parentNavigatorKey: _rootNavigatorKey,
    ),
  ],
);
