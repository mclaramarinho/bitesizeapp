import 'package:adhd_app/features/projects/create/presentation/pages/create_project_page.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_bottom_sheet/ds_bottom_sheet.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_scaffold/ds_fab/ds_fab.dart';
import 'package:adhd_app/shared/utils/navigation/routes.dart';

final appFabRegistry = {
  AppRoutes.home: FabData(
    onTap: () => DsBottomSheet.show(
      child: CreateProjectPage(),
      makeContentScrollable: false,
    ),
    tooltip: "Add",
  ),
};
