import 'package:adhd_app/features/auth/create_account/presentation/cubit/create_account_cubit.dart';
import 'package:adhd_app/features/auth/create_account/presentation/widgets/create_account_page_header.dart';
import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_button/ds_button.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_scaffold/ds_scaffold.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_text_input/ds_text_input.dart';
import 'package:adhd_app/shared/di/injection.dart';
import 'package:adhd_app/shared/utils/extensions/context.dart';
import 'package:adhd_app/shared/utils/validators/input_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'complete_profile_page.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<CreateAccountCubit>(),
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
  final _formKey = GlobalKey<FormState>();
  bool _loadingEmail = false;
  bool _loadingGoogle = false;

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
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => CompleteProfilePage(email: null)));
  }

  Future<void> _createWithEmail() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loadingEmail = true);
    // TODO: call your auth service here. This simulates network latency.
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _loadingEmail = false);
    if (!mounted) return;
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (_) => CompleteProfilePage(email: _emailController.text.trim()),
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return DsScaffold(
      children: [
        const SizedBox(height: DsSpacing.xl),

        CreateAccountPageHeader(),

        const SizedBox(height: DsSpacing.xl),

        // Google sign up
        DsButton.loadable(
          onPressed: _simulateSignUpWithGoogle,
          label: context.loc.continue_with_google,
          loadingLabel: context.loc.signing_in,
          prefixIcon: Icons.login,
        ),

        const SizedBox(height: DsSpacing.md),
        Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: DsSpacing.sm),
              child: Text(context.loc.or),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: DsSpacing.md),

        // Email / password form
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DsTextInput(
                label: context.loc.email,
                hint: context.loc.email_hint,
                validator: InputValidation.validateEmail,
              ),
              const SizedBox(height: DsSpacing.md),
              DsTextInput(
                label: context.loc.password,
                hint: context.loc.enter_ur_password,
                validator: InputValidation.validatePassword,
                isObscurable: true,
              ),
              const SizedBox(height: DsSpacing.md),
              DsTextInput(
                label: context.loc.confirm_password,
                hint: context.loc.reenter_ur_password,
                isObscurable: true,
                validator:
                    (v, valueToCompare) =>
                        InputValidation.validateConfirm(v, valueToCompare),
              ),
              const SizedBox(height: DsSpacing.lg),
              DsButton.loadable(
                label: context.loc.create_your_account,
                loadingLabel: "",
                onPressed: _createWithEmail,
              ),
            ],
          ),
        ),

        // TODO - move second step form here and show conditionally based on cubit state
      ],
    );
  }
}
