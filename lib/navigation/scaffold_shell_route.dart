import 'package:alarm_watch/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ScaffoldShellRoute extends ShellRoute {
  ScaffoldShellRoute({
    GlobalKey<NavigatorState>? navigatorKey,
    required List<RouteNavItem> routeItems,
  }) : super(
          navigatorKey: navigatorKey,
          routes: routeItems.map((item) => item.route).toList(),
          builder: (context, state, Widget body) {
            return ScaffoldWithNavBar(
              body: body,
              items: routeItems,
            );
          },
        );
}

class ScaffoldWithNavBar extends ConsumerStatefulWidget {
  final Widget body;
  final List<RouteNavItem> items;
  const ScaffoldWithNavBar(
      {super.key, required this.body, required this.items});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ScaffoldWithNavBarState();
  }
}

class _ScaffoldWithNavBarState extends ConsumerState<ScaffoldWithNavBar> {
  int _activeItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeStateNotifier.notifier);
    final matchingRoute = widget.items[_activeItemIndex];
    final String? title =
        matchingRoute.title ?? matchingRoute.navItemWidget.label;
    final List<BottomNavigationBarItem> navBarItems =
        widget.items.map((item) => item.navItemWidget).toList();
    return Scaffold(
      appBar: AppBar(
        title: title != null ? Text(title) : null,
        actions: [
          IconButton(
            onPressed: () {
              if (theme.isDarkModeEnabled) {
                theme.setLightTheme();
              } else {
                theme.setDarkTheme();
              }
            },
            icon: Icon(
              theme.isDarkModeEnabled ? Icons.dark_mode : Icons.light_mode,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/add-alarm'),
        label: const Text('Add Alarm'),
        icon: const Icon(Icons.add_alarm),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: widget.body,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => _handleNavItemTapped(index, context),
        currentIndex: _activeItemIndex,
        items: navBarItems,
      ),
    );
  }

  void _handleNavItemTapped(int index, BuildContext context) {
    context.go(widget.items[index].route.path);
    setState(() {
      _activeItemIndex = index;
    });
  }
}

class RouteNavItem {
  final GoRoute route;
  final String? title;
  final BottomNavigationBarItem navItemWidget;
  RouteNavItem({
    required this.route,
    required this.navItemWidget,
    this.title,
  });
}
