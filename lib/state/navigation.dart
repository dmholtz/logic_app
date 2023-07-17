import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarNotifier extends StateNotifier<int> {
  NavBarNotifier() : super(0);

  void setSelectedScreen(int index) {
    state = index;
  }
}

final activeNavBarProvider =
    StateNotifierProvider<NavBarNotifier, int>((ref) => NavBarNotifier());
