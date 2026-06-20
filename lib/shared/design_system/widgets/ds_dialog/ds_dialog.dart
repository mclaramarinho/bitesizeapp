import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/constants/ds_themes.dart';
import 'package:adhd_app/shared/di/injection.dart';
import 'package:adhd_app/shared/utils/navigation/router.dart';
import 'package:flutter/material.dart';

// TODO (docs)
class DsDialog {
  static void show(
    BuildContext? context, {
    required WidgetBuilder bodyBuilder,
    String? title,
    String? subtitle,
    Function? onClosed,
  }) {
    final router = getIt.get<AppRouter>();
    final context = router.context;
    if (context == null) return;

    showAdaptiveDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(DsSpacing.md),
            color: DsThemes.current.colorScheme.surface,
            child: Wrap(
              runSpacing: DsSpacing.lg,
              children: [
                if (title != null) ...[
                  Text(title, style: DsThemes.currentTextTheme.headlineMedium),
                ],
                if (subtitle != null) ...[
                  Text(subtitle, style: DsThemes.currentTextTheme.bodyMedium),
                ],
                Builder(builder: bodyBuilder),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      onClosed?.call();
    });
  }
}
