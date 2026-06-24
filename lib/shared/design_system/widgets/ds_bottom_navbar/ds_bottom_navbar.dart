import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/constants/ds_themes.dart';
import 'package:adhd_app/shared/di/injection.dart';
import 'package:adhd_app/shared/utils/navigation/router.dart';
import 'package:adhd_app/shared/utils/navigation/routes.dart';
import 'package:flutter/material.dart';

class DsBottomNavbar extends StatelessWidget {
  /// Ordered from left-right
  final List<BottomNavbarItem> items;

  DsBottomNavbar({required this.items, super.key})
    : assert(
        items.map((item) => item.route).toSet().length == items.length,
        "Items routes must be different.",
      );
  @override
  Widget build(BuildContext context) {
    final router = getIt.get<AppRouter>();
    final currentRoute = router.matchedLocation;
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: DsSpacing.md),
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.from(
            items.map((item) {
              return IconButton(
                onPressed: item.onTap,
                icon: Icon(item.icon),
                padding: EdgeInsets.symmetric(
                  vertical: DsSpacing.none,
                  horizontal: DsSpacing.sm,
                ),
                iconSize: DsSpacing.xxl,
                isSelected: item.route == currentRoute,
                tooltip: item.tooltip,
                highlightColor: DsThemes.current.colorScheme.onPrimaryContainer,
              );
            }),
          ),
        ),
      ),
    );
  }
}

class BottomNavbarItem {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  final AppRoutes route;

  const BottomNavbarItem({
    required this.icon,
    required this.tooltip,
    required this.onTap,
    required this.route,
  });
}
