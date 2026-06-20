import 'package:adhd_app/shared/design_system/constants/ds_themes.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_button/ds_loadable_button.dart/ds_loadable_button.dart';
import 'package:adhd_app/shared/utils/extensions/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// TODO (docs)
class DsButton {
  static Widget loadable({
    required TaskCallback onPressed,
    required String label,
    required String loadingLabel,
    IconData? prefixIcon,
    bool disabled = false,
  }) {
    return DSLoadableButton(
      onPressed: onPressed,
      label: label,
      loadingLabel: loadingLabel,
      prefixIcon: prefixIcon,
      disabled: disabled,
    );
  }

  static Widget link({
    required VoidCallback onPressed,
    required String label,
    Color? color,
    TextAlign? textAlign,
  }) {
    return Center(
      child: Text(
        label,
        textAlign: textAlign ?? TextAlign.left,
        style: DsThemes.current.textTheme.bodyLarge!.copyWith(
          decoration: TextDecoration.underline,
          color: color,
        ),
      ).onTap(onPressed),
    );
  }

  static Widget textAndLink({
    required VoidCallback onPressed,
    required String label,
    required String linkLabel,
    Color? color,
    TextAlign? textAlign,
  }) {
    return Center(
      child: RichText(
        textAlign: textAlign ?? TextAlign.left,
        text: TextSpan(
          text: label,
          style: DsThemes.current.textTheme.bodyLarge?.copyWith(color: color),
          children: [
            TextSpan(
              text: linkLabel,
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ).onTap(onPressed),
          ],
        ),
      ),
    );
  }
}
