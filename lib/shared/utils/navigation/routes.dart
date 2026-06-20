import 'package:adhd_app/features/auth/create_account/presentation/pages/create_account_page.dart';
import 'package:adhd_app/features/auth/password_recovery/presentation/pages/password_recovery_email_sent_page.dart';
import 'package:adhd_app/features/auth/sign_in/presentation/pages/sign_in_page.dart';
import 'package:adhd_app/features/home/presentation/pages/home_page.dart';
import 'package:adhd_app/shared/utils/exceptions/navigation/navigation_exception.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO (docs)
enum AppRoutes {
  createAccount(
    path: "/create-account",
    builder: _createAccountBuilder,
    private: false,
  ),
  signIn(path: "/sign-in", builder: _loginBuilder, private: false),
  home(path: "/", builder: _homeBuilder, private: true),
  recoveryEmailSent(
    path: "/recovery-email-sent",
    builder: _passwordRecoveryEmailSentBuilder,
    private: false,
  );

  final String path;
  final Widget Function(BuildContext, GoRouterState) builder;
  final bool private;

  const AppRoutes({
    required this.path,
    required this.builder,
    this.private = true,
  });

  static AppRoutes fromPath(String path) {
    final route = AppRoutes.values.where((v) => v.path == path).firstOrNull;
    if (route == null) throw RouteDoesNotExist();
    return route;
  }

  GoRoute toGoRoute() {
    return GoRoute(path: path, builder: builder);
  }

  static List<GoRoute> get allGoRoutes =>
      AppRoutes.values.map((e) => e.toGoRoute()).toList();
  static List<GoRoute> get allPrivateRoutes => AppRoutes.values
      .where((e) => e.private)
      .map((e) => e.toGoRoute())
      .toList();
  static List<GoRoute> get allPublicRoutes => AppRoutes.values
      .where((e) => !e.private)
      .map((e) => e.toGoRoute())
      .toList();
}

// ========================================================================
// BUILDERS
// ========================================================================
Widget _loginBuilder(BuildContext context, GoRouterState state) {
  return const SignInPage();
}

Widget _createAccountBuilder(BuildContext context, GoRouterState state) {
  return const CreateAccountPage();
}

Widget _homeBuilder(BuildContext context, GoRouterState state) {
  return const HomePage();
}

Widget _passwordRecoveryEmailSentBuilder(
  BuildContext context,
  GoRouterState state,
) {
  return const PasswordRecoveryPage();
}
