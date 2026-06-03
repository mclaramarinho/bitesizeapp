import 'package:adhd_app/features/auth/create_account/presentation/cubit/create_account_cubit.dart';
import 'package:adhd_app/features/auth/create_account/presentation/cubit/create_account_state.dart';
import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_button/ds_button.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_text_input/ds_text_input.dart';
import 'package:adhd_app/shared/utils/extensions/context.dart';
import 'package:adhd_app/shared/utils/validators/input_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountWithEmailPasswordForm extends StatefulWidget {
  const CreateAccountWithEmailPasswordForm({super.key});

  @override
  State<CreateAccountWithEmailPasswordForm> createState() =>
      _CreateAccountWithEmailPasswordFormState();
}

class _CreateAccountWithEmailPasswordFormState
    extends State<CreateAccountWithEmailPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  late CreateAccountCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<CreateAccountCubit>();
  }

  Future<void> _createWithEmail() async {
    if (!_formKey.currentState!.validate()) return;
    _cubit.createWithEmailAndPassword();
    await Future.delayed(const Duration(seconds: 1));
    // setState(() => _loadingEmail = false);
    if (!mounted) return;
  }

  String? confirmPasswordValidator(String? v, CreateAccountState state) {
    return InputValidation.validateConfirm(
      v,
      state is CreateAccountStateLoaded ? state.form.password : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    return BlocConsumer<CreateAccountCubit, CreateAccountState>(
      listener: (ctx, state) => {},
      builder: (ctx, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DsTextInput(
                label: loc.email,
                hint: loc.email_hint,
                validator: InputValidation.validateEmail,
                onChanged: (value) => _cubit.setEmail(value),
              ),
              const SizedBox(height: DsSpacing.md),
              DsTextInput(
                label: loc.password,
                hint: loc.enter_ur_password,
                validator: InputValidation.validatePassword,
                isObscurable: true,
                onChanged: (value) => _cubit.setPassword(value),
              ),
              const SizedBox(height: DsSpacing.md),
              DsTextInput(
                label: loc.confirm_password,
                hint: loc.reenter_ur_password,
                isObscurable: true,
                onChanged: (value) => _cubit.setConfirmPassword(value),
                validator: (v) => confirmPasswordValidator(v, state),
              ),
              const SizedBox(height: DsSpacing.lg),
              DsButton.loadable(
                label: loc.create_your_account,
                loadingLabel: "",
                onPressed: _createWithEmail,
              ),
            ],
          ),
        );
      },
    );
  }
}
