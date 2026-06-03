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
  State<CreateAccountWithEmailPasswordForm> createState() => _CreateAccountWithEmailPasswordFormState();
}

class _CreateAccountWithEmailPasswordFormState extends State<CreateAccountWithEmailPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  late CreateAccountCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<CreateAccountCubit>();
  }

   Future<void> _createWithEmail() async {
    if (!_formKey.currentState!.validate()) return;
    // setState(() => _loadingEmail = true);
    // TODO: call your auth service here. This simulates network latency.
    await Future.delayed(const Duration(seconds: 1));
    // setState(() => _loadingEmail = false);
    if (!mounted) return;
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (_) => CompleteProfilePage(email: _emailController.text.trim()),
    // ));
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
              ),
              const SizedBox(height: DsSpacing.md),
              DsTextInput(
                label: loc.password,
                hint: loc.enter_ur_password,
                validator: InputValidation.validatePassword,
                isObscurable: true,
              ),
              const SizedBox(height: DsSpacing.md),
              DsTextInput(
                label: loc.confirm_password,
                hint: loc.reenter_ur_password,
                isObscurable: true,
                validator:
                    (v, valueToCompare) =>
                        InputValidation.validateConfirm(v, valueToCompare),
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