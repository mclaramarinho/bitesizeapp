import 'package:adhd_app/shared/design_system/widgets/ds_button/ds_loadable_button/ds_loadable_button.dart';
import 'package:adhd_app/shared/utils/extensions/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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

  static Widget link({required VoidCallback onPressed, required String label}) {
    return TextButton(onPressed: onPressed, child: Text(label));
  }

  static Widget textAndLink({
    required VoidCallback onPressed,
    required String label,
    required String linkLabel,
  }) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: label,
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
