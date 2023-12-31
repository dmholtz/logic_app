import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:logic_app/state/achievement.dart';
import 'package:logic_app/state/navigation.dart';

class _NavBarItemWithLocator extends BottomNavigationBarItem {
  const _NavBarItemWithLocator(
      {required this.navigationLocator, required Widget icon, String? label})
      : super(icon: icon, label: label);

  final String navigationLocator;
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({required this.child, super.key});
  final Widget child;

  static const tabs = [
    _NavBarItemWithLocator(
      navigationLocator: "/practice",
      icon: Icon(FontAwesome.gamepad),
      label: "Practice",
    ),
    _NavBarItemWithLocator(
      navigationLocator: "/progress",
      icon: Icon(Icons.bar_chart),
      //icon: Icon(Octicons.milestone),
      label: "Progress",
    ),
    _NavBarItemWithLocator(
      navigationLocator: "/competition",
      icon: Icon(FontAwesome.award),
      label: "Competition",
    ),
    _NavBarItemWithLocator(
      navigationLocator: "/settings",
      icon: Icon(Icons.settings),
      label: "Settings",
    )
  ];

  void _onTap(BuildContext context, WidgetRef ref, int index) {
    ref.read(activeNavBarProvider.notifier).setSelectedScreen(index);
    ref.invalidate(achievementsProvider);
    context.go(
      tabs[index].navigationLocator,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedIndex = ref.watch(activeNavBarProvider);

    Scaffold page = Scaffold(
      body: child, //const Text("Body"), //widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: tabs,
        onTap: (index) => _onTap(context, ref, index),
        currentIndex: selectedIndex,
      ),
    );
    return page;
  }
}
