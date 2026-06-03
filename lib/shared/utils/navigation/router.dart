import 'package:adhd_app/shared/utils/navigation/global.dart';
import 'package:adhd_app/shared/utils/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppRouter {
  static final GoRouter _router = GoRouter(
    routes: AppRoutes.allPublicRoutes, // TODO - Add private routes and conditional
    initialLocation: AppRoutes.createAccount.path, // TODO - Add private routes and conditional
    navigatorKey: NavigationService.navigatorKey,
  );

  GoRouter get router => _router;

  BuildContext? get context => _router.routerDelegate.navigatorKey.currentContext;

  void push(AppRoutes route) async {
    _router.go(route.path);
  }

  void goBack() {
    _router.pop();
  }

  void replace(AppRoutes route) {
    _router.replace(route.path);
  }
}