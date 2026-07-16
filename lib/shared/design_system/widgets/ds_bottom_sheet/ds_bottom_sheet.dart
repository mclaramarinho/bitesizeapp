import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/constants/ds_themes.dart';
import 'package:adhd_app/shared/di/injection.dart';
import 'package:adhd_app/shared/utils/navigation/router.dart';
import 'package:flutter/material.dart';

class DsBottomSheet {
  static Future<T?> show<T>({
    BuildContext? context,
    required Widget child,
    bool isDismissible = false,
    Color? backgroundColor,
    bool isScrollControlled = true,
    bool makeContentScrollable = false,
  }) {
    return showModalBottomSheet<T>(
      context: context ?? Navigator.of(getIt.get<AppRouter>().context!).context,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      isDismissible: isDismissible,
      useSafeArea: true,
      builder: (context) => SizedBox.expand(
        child: Container(
          color: backgroundColor ?? DsThemes.current.colorScheme.surface,
          padding: EdgeInsets.only(
            top: DsSpacing.md,
            left: DsSpacing.md,
            right: DsSpacing.md,
            bottom: MediaQuery.of(context).viewInsets.bottom + DsSpacing.md,
          ),
          child: makeContentScrollable
              ? SingleChildScrollView(child: Column(children: [child]))
              : child,
        ),
      ),
    );
  }
}
