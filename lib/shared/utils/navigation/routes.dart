import 'package:adhd_app/features/auth/create_account/presentation/pages/create_account_page.dart';
import 'package:adhd_app/features/auth/password_recovery/presentation/pages/password_recovery_email_sent_page.dart';
import 'package:adhd_app/features/auth/sign_in/presentation/pages/sign_in_page.dart';
import 'package:adhd_app/features/home/presentation/pages/home_page.dart';
import 'package:adhd_app/features/profile/profile/presentation/pages/profile_page.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_scaffold/private/ds_scaffold_private.dart';
import 'package:adhd_app/shared/utils/exceptions/navigation/navigation_exception.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO (docs)
enum AppRoutes {
  createAccount(path: "/create-account", private: false),
  signIn(path: "/sign-in", private: false),
  home(path: "/", private: true),
  profile(path: "/profile", private: true),
  recoveryEmailSent(path: "/recovery-email-sent", private: false);

  final String path;
  final bool private;

  const AppRoutes({required this.path, this.private = true});

  static AppRoutes fromPath(String path) {
    final route = AppRoutes.values.where((v) => v.path == path).firstOrNull;
    if (route == null) throw RouteDoesNotExist();
    return route;
  }

  GoRoute toGoRoute() {
    return GoRoute(path: path, builder: (context, state) => getPageWidget);
  }

  Widget get getPageWidget {
    switch (this) {
      case AppRoutes.home:
        return HomePage();
      case AppRoutes.recoveryEmailSent:
        return PasswordRecoveryPage();
      case AppRoutes.createAccount:
        return CreateAccountPage();
      case AppRoutes.signIn:
        return SignInPage();
      case AppRoutes.profile:
        return ProfilePage();
    }
  }

  static List<RouteBase> get allGoRoutes {
    return [
      ...AppRoutes.allPublicRoutes,
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DsScaffoldPrivate(navShell: navigationShell);
        },
        branches: AppRoutes.allPrivateRoutes
            .map((route) => StatefulShellBranch(routes: [route]))
            .toList(),
      ),
    ];
  }

  static List<GoRoute> get allPrivateRoutes => AppRoutes.values
      .where((e) => e.private)
      .map((e) => e.toGoRoute())
      .toList();

  static List<GoRoute> get allPublicRoutes => AppRoutes.values
      .where((e) => !e.private)
      .map((e) => e.toGoRoute())
      .toList();
}
