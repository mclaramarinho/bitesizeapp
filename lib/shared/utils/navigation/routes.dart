import 'package:adhd_app/features/auth/create_account/presentation/pages/create_account_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes {
  login(
    path: "/login",
    builder: _loginBuilder,
    private: false,
  );


  final String path;
  final Widget Function(BuildContext, GoRouterState) builder;
  final bool private;
  
  const AppRoutes({required this.path, required this.builder, this.private = true});

  GoRoute toGoRoute() {
    return GoRoute(
      path: path,
      builder: builder
    );
  }

  static List<GoRoute> get allGoRoutes => AppRoutes.values.map((e) => e.toGoRoute()).toList();
  static List<GoRoute> get allPrivateRoutes => AppRoutes.values.where((e) => e.private).map((e) => e.toGoRoute()).toList();
  static List<GoRoute> get allPublicRoutes => AppRoutes.values.where((e) => !e.private).map((e) => e.toGoRoute()).toList();
}


// ========================================================================
// BUILDERS
// ========================================================================
Widget _loginBuilder(BuildContext context, GoRouterState state) {
  return const CreateAccountPage();
}