import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/utils/extensions/context_or_null.dart';
import 'package:flutter/material.dart';

// TODO (docs)
class DsDivider {
  static Widget withText(BuildContext context, String text) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: DsSpacing.sm),
          child: Text(context.loc.or),
        ),
        Expanded(child: Divider()),
      ],
    );
  }

  static Widget simple() {
    return Row(children: [Expanded(child: Divider())]);
  }
}
