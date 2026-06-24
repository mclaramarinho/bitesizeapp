import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/constants/ds_themes.dart';
import 'package:flutter/material.dart';

class DsBottomNavbar extends StatelessWidget {
  final List<BottomNavbarItem> items;
  final int currentSelection;

  DsBottomNavbar({
    required this.items,
    required this.currentSelection,
    super.key,
  }) : assert(
         items.map((item) => item.index).toSet().length == items.length,
         "Items indexes must be different.",
       );

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.from(
          items.map((item) {
            return IconButton(
              onPressed: item.onTap,
              icon: Icon(item.icon),
              padding: EdgeInsets.symmetric(
                vertical: DsSpacing.none,
                horizontal: DsSpacing.sm,
              ),
              isSelected: item.index == currentSelection,
              tooltip: item.tooltip,
              highlightColor: DsThemes.current.colorScheme.onPrimaryContainer,
            );
          }),
        ),
      ),
    );
  }
}

class BottomNavbarItem {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  final int index;

  const BottomNavbarItem({
    required this.icon,
    required this.tooltip,
    required this.onTap,
    required this.index,
  });
}
