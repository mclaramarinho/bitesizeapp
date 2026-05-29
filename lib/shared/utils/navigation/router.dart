import 'package:adhd_app/shared/utils/navigation/global.dart';
import 'package:adhd_app/shared/utils/navigation/routes.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    routes: AppRoutes.allPublicRoutes, // TODO - Add private routes and conditional
    initialLocation: AppRoutes.login.path, // TODO - Add private routes and conditional
    navigatorKey: NavigationService.navigatorKey,
  );

  static GoRouter get router => _router;

  static final _privateRoutes = <GoRoute>[]; 
}