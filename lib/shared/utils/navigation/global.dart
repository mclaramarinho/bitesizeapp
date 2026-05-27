import 'package:flutter/material.dart';

class NavigationService {
  static BuildContext? get context => navigatorKey.currentContext;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
