import 'package:adhd_app/features/auth/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:adhd_app/features/auth/sign_in/presentation/cubit/sign_in_state.dart';
import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_button/ds_button.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_text_input/ds_text_input.dart';
import 'package:adhd_app/shared/di/injection.dart';
import 'package:adhd_app/shared/utils/extensions/context_or_null.dart';
import 'package:adhd_app/shared/utils/navigation/router.dart';
import 'package:adhd_app/shared/utils/validators/input_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordRecoveryDialogContent extends StatelessWidget {
  final SignInCubit cubit;
  const PasswordRecoveryDialogContent({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: _PasswordRecoveryDialogContent(cubit: cubit),
    );
  }
}

class _PasswordRecoveryDialogContent extends StatefulWidget {
  final SignInCubit cubit;
  const _PasswordRecoveryDialogContent({required this.cubit});

  @override
  State<_PasswordRecoveryDialogContent> createState() =>
      _PasswordRecoveryDialogContentState();
}

class _PasswordRecoveryDialogContentState
    extends State<_PasswordRecoveryDialogContent> {
  final _recoveryFormKey = GlobalKey<FormState>();
  bool _isEmailValid = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        final loadedState = state is SignInStateLoaded ? state : null;
        final hasError = loadedState?.showErrorInRecoveryDialog ?? false;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (hasError &&
                (loadedState?.recoveryDialogErrorMessage?.isNotEmpty ?? false))
              Text(loadedState!.recoveryDialogErrorMessage!),

            Form(
              key: _recoveryFormKey,
              child: DsTextInput(
                label: "Enter your email",
                hint: context.loc.email_hint,
                onChanged: (email) {
                  setState(() {
                    _isEmailValid =
                        _recoveryFormKey.currentState?.validate() ?? false;
                  });
                },
                validator: InputValidation.validateEmail,
              ),
            ),
            const SizedBox(height: DsSpacing.md),

            DsButton.loadable(
              onPressed: () {
                widget.cubit.setRecoveryEmail(
                  _recoveryFormKey.currentState?.fields.first.value ?? "",
                );
                widget.cubit.sendRecoveryEmail();
                getIt.get<AppRouter>().goBack();
              },
              label: "Send recovery email",
              loadingLabel: "",
              disabled:
                  !_isEmailValid, // Naturally mutates and triggers local redraws
            ),
          ],
        );
      },
    );
  }
}
