import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/constants/ds_themes.dart';
import 'package:flutter/material.dart';

class CreateAccountPageHeader extends StatelessWidget {
  const CreateAccountPageHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'ADHD App',
          style: DsThemes.current.textTheme.headlineLarge,
        ),
        SizedBox(height: DsSpacing.sm),
        Text(
          'Start building your future step by step',
          style: DsThemes.current.textTheme.headlineMedium,
        ),
      ],
    );
  }
}