import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes {
  login(
    path: "/login",
    builder: SizedBox(),
    private: false
  );
  final String path;
  final Widget builder;
  final bool private;
  const AppRoutes({required this.path, required this.builder, this.private = true});

  GoRoute toGoRoute() {
    return GoRoute(
      path: path,
      builder: (context, state) => builder,
    );
  }

  static List<GoRoute> get allGoRoutes => AppRoutes.values.map((e) => e.toGoRoute()).toList();
  static List<GoRoute> get allPrivateRoutes => AppRoutes.values.where((e) => e.private).map((e) => e.toGoRoute()).toList();
  static List<GoRoute> get allPublicRoutes => AppRoutes.values.where((e) => !e.private).map((e) => e.toGoRoute()).toList();
}