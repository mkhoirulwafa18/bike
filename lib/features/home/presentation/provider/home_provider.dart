import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationIndexProvider =
    StateNotifierProvider<NavigationIndex, int>((ref) => NavigationIndex());

class NavigationIndex extends StateNotifier<int> {
  NavigationIndex() : super(0);

  // ignore: use_setters_to_change_properties
  void navigateTo(int index) {
    state = index;
  }
}
