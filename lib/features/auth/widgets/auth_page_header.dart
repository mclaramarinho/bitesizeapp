import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/constants/ds_themes.dart';
import 'package:adhd_app/shared/di/injection.dart';
import 'package:adhd_app/shared/utils/extensions/context.dart';
import 'package:adhd_app/shared/utils/navigation/router.dart';
import 'package:adhd_app/shared/utils/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AuthPageHeaderType {
  signIn,
  createAccount;
}

class AuthPageHeader extends StatelessWidget {
  const AuthPageHeader({super.key});

  
  @override
  Widget build(BuildContext context) {
    final route = getIt.get<AppRouter>().matchedLocation;
    final loc = context.loc;
    String? pageTitle;

    switch(route) {
      case AppRoutes.createAccount:
        pageTitle = loc.create_your_account.toUpperCase();
        break;
      case AppRoutes.signIn:
        pageTitle = "Sign In".toUpperCase();
        break;
      default:
    }

    return Column(
      children: [
        Text(
          pageTitle ?? "Bite Size",
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