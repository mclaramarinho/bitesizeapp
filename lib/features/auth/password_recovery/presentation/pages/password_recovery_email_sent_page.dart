import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/constants/ds_themes.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_button/ds_button.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_scaffold/ds_scaffold.dart';
import 'package:adhd_app/shared/di/injection.dart';
import 'package:adhd_app/shared/utils/navigation/router.dart';
import 'package:adhd_app/shared/utils/navigation/routes.dart';
import 'package:flutter/material.dart';

class PasswordRecoveryPage extends StatelessWidget {
  const PasswordRecoveryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return DsScaffold(
      defaultSpacing: DsSpacing.md,
      children: [
        Text(
          "Check your email!",
          style: DsThemes.currentTextTheme.headlineLarge,
        ),
        Text(
          "If an account is linked to that email, you will receive a link to reset your password.",
          style: DsThemes.currentTextTheme.bodyLarge,
        ),
        // TODO - implement this functionality
        Container(
          color: DsThemes.current.colorScheme.surface,
          padding: EdgeInsets.all(DsSpacing.md),
          child: DsButton.textAndLink(
            onPressed: () {},
            label: "Having trouble resetting your password? ",
            linkLabel: "Contact an admin!",
            color: DsThemes.current.colorScheme.primary,
            textAlign: TextAlign.center,
          ),
        ),
        DsButton.link(
          onPressed: () => getIt.get<AppRouter>().replace(AppRoutes.signIn),
          label: "Back to Login",
          color: DsThemes.current.colorScheme.primary,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
