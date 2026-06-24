import 'package:adhd_app/shared/design_system/widgets/ds_bottom_navbar/ds_bottom_navbar.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_scaffold/ds_scaffold.dart';
import 'package:adhd_app/shared/di/injection.dart';
import 'package:adhd_app/shared/utils/navigation/router.dart';
import 'package:adhd_app/shared/utils/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DsScaffoldPrivate extends StatefulWidget {
  final StatefulNavigationShell navShell;

  const DsScaffoldPrivate({required this.navShell, super.key});

  @override
  State<StatefulWidget> createState() => _DsScaffoldPrivateState();
}

class _DsScaffoldPrivateState extends State<DsScaffoldPrivate> {
  @override
  Widget build(BuildContext context) {
    return DsScaffold(
      bottomNavBar: DsBottomNavbar(items: bottomNavbarItems),
      children: [widget.navShell],
    );
  }
}

// TODO (localize)
final bottomNavbarItems = [
  BottomNavbarItem(
    icon: Icons.query_builder,
    tooltip: "Parking Lot",
    onTap: () => print("Parking Lot"),
    route: AppRoutes.signIn, // TODO (fix)
  ),
  BottomNavbarItem(
    icon: Icons.home,
    tooltip: "Home",
    onTap: () => getIt.get<AppRouter>().pushIfDifferentRoute(AppRoutes.home),
    route: AppRoutes.home,
  ),
  BottomNavbarItem(
    icon: Icons.person,
    tooltip: "Profile",
    onTap: () => getIt.get<AppRouter>().pushIfDifferentRoute(AppRoutes.profile),
    route: AppRoutes.profile,
  ),
];
