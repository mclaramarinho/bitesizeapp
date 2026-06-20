import 'package:flutter/material.dart';

// TODO (docs)
class NavigationService {
  static BuildContext? get context => navigatorKey.currentContext;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
