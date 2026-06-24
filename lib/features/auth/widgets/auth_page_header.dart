import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_text/ds_text.dart';
import 'package:adhd_app/shared/di/injection.dart';
import 'package:adhd_app/shared/utils/extensions/context_or_null.dart';
import 'package:adhd_app/shared/utils/navigation/router.dart';
import 'package:adhd_app/shared/utils/navigation/routes.dart';
import 'package:flutter/material.dart';

// TODO (docs)
enum AuthPageHeaderType { signIn, createAccount }

class AuthPageHeader extends StatelessWidget {
  const AuthPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final route = getIt.get<AppRouter>().matchedLocation;
    final loc = context.loc;
    String? pageTitle;

    switch (route) {
      case AppRoutes.createAccount:
        pageTitle = loc.create_your_account.toUpperCase();
        break;
      case AppRoutes.signIn:
        pageTitle = loc.sign_in.toUpperCase();
        break;
      default:
    }

    return Column(
      children: [
        DsText(pageTitle ?? loc.app_name, level: DsTextLevel.headerLarge),
        SizedBox(height: DsSpacing.sm),
        DsText(loc.auth_header_subtitle, level: DsTextLevel.headerMedium),
      ],
    );
  }
}
