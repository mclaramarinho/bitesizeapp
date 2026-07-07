import 'package:adhd_app/shared/design_system/widgets/ds_bottom_sheet/ds_bottom_sheet.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_scaffold/ds_fab/ds_fab.dart';
import 'package:adhd_app/shared/utils/navigation/routes.dart';
import 'package:flutter/material.dart';

final appFabRegistry = {
  AppRoutes.home: FabData(
    onTap: () => DsBottomSheet.show(child: const Text("FAB")),
    tooltip: "Add",
  ),
};
