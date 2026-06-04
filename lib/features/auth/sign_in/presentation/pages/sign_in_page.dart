import 'package:adhd_app/features/auth/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:adhd_app/features/auth/sign_in/presentation/cubit/sign_in_state.dart';
import 'package:adhd_app/features/auth/widgets/auth_page_header.dart';
import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_button/ds_button.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_scaffold/ds_scaffold.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_text_input/ds_text_input.dart';
import 'package:adhd_app/shared/di/injection.dart';
import 'package:adhd_app/shared/utils/extensions/context_or_null.dart';
import 'package:adhd_app/shared/utils/navigation/router.dart';
import 'package:adhd_app/shared/utils/navigation/routes.dart';
import 'package:adhd_app/shared/utils/validators/input_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<SignInCubit>(),
      child: const _SignInPageContent(),
    );
  }
}

class _SignInPageContent extends StatefulWidget {
  const _SignInPageContent();

  @override
  State<StatefulWidget> createState() => _SignInPageContentState();
}

class _SignInPageContentState extends State<_SignInPageContent> {
  final _formKey = GlobalKey<FormState>();
  late SignInCubit _cubit;
  late AppRouter _router;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<SignInCubit>();
    _router = getIt.get<AppRouter>();
  }

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {},
      builder: ((context, state) {
        return DsScaffold(
          defaultSpacing: DsSpacing.lg,
          children: [
            AuthPageHeader(),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DsTextInput(
                    label: loc.email,
                    hint: loc.email_hint,
                    validator: InputValidation.validateEmail,
                    // onChanged: (value) => _cubit.setEmail(value),
                  ),
                  const SizedBox(height: DsSpacing.md),
                  DsTextInput(
                    label: loc.password,
                    hint: loc.enter_ur_password,
                    isObscurable: true,
                    // onChanged: (value) => _cubit.setPassword(value),
                  ),
                  const SizedBox(height: DsSpacing.lg),
                  DsButton.loadable(
                    label: loc.sign_in,
                    loadingLabel: "",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            DsButton.textAndLink(
              onPressed: () => _router.push(AppRoutes.createAccount),
              label: "${loc.dont_have_an_account} ",
              linkLabel: loc.create_now,
            ),
          ],
        );
      }),
    );
  }
}
