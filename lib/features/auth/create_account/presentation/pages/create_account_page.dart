import 'package:adhd_app/features/auth/create_account/presentation/cubit/create_account_cubit.dart';
import 'package:adhd_app/features/auth/create_account/presentation/cubit/create_account_state.dart';
import 'package:adhd_app/features/auth/widgets/auth_page_header.dart';
import 'package:adhd_app/features/auth/create_account/presentation/widgets/create_account_email_password_form.dart';
import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_button/ds_button.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_divider/ds_divider.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_scaffold/ds_scaffold.dart';
import 'package:adhd_app/shared/di/injection.dart';
import 'package:adhd_app/shared/utils/extensions/context_or_null.dart';
import 'package:adhd_app/shared/utils/navigation/router.dart';
import 'package:adhd_app/shared/utils/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<CreateAccountCubit>()..load(),
      child: const _CreateAccountPageContent(),
    );
  }
}

class _CreateAccountPageContent extends StatefulWidget {
  const _CreateAccountPageContent();

  @override
  State<_CreateAccountPageContent> createState() =>
      _CreateAccountPageContentState();
}

class _CreateAccountPageContentState extends State<_CreateAccountPageContent> {
  bool _loadingGoogle = false;
  late AppRouter _router;

  @override
  void initState() {
    super.initState(); 
    _router = getIt.get<AppRouter>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _simulateSignUpWithGoogle() async {
    setState(() => _loadingGoogle = true);
    // TODO: replace this simulation with real Google sign-in wiring
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _loadingGoogle = false);
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    return BlocConsumer<CreateAccountCubit, CreateAccountState>(
      listener: (ctx, state) => {
        if(state is CreateAccountStateSuccess) {
          _router.replace(AppRoutes.home)
        }
      },
      builder: (ctx, state) {
        return DsScaffold(
          children: [
            const SizedBox(height: DsSpacing.xl),

            AuthPageHeader(),

            const SizedBox(height: DsSpacing.xl),

            // Google sign up
            DsButton.loadable(
              onPressed: _simulateSignUpWithGoogle,
              label: loc.continue_with_google,
              loadingLabel: loc.signing_in,
              prefixIcon: Icons.login,
            ),

            const SizedBox(height: DsSpacing.md),
            DsDivider.withText(context, loc.or),
            const SizedBox(height: DsSpacing.md),
            if(state is CreateAccountStateLoaded &&
                state.showFormErrorMessage
                && state.formErrorMessage != null) ...[
              Text(state.formErrorMessage!),
            ],

            CreateAccountWithEmailPasswordForm(),

            SizedBox(height: DsSpacing.md),

            DsButton.textAndLink(
              onPressed: () => _router.replace(AppRoutes.signIn),
              label: "${loc.already_have_an_account} ",
              linkLabel: "${loc.sign_in}.",
            ),
          ],
        );
      },
    );
  }
}
