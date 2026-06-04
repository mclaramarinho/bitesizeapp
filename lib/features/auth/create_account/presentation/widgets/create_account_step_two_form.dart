import 'package:adhd_app/features/auth/create_account/presentation/cubit/create_account_cubit.dart';
import 'package:adhd_app/features/auth/create_account/presentation/cubit/create_account_state.dart';
import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_button/ds_button.dart';
import 'package:adhd_app/shared/utils/extensions/context.dart';
import 'package:adhd_app/shared/utils/validators/input_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountStepTwoForm extends StatefulWidget {
  const CreateAccountStepTwoForm({super.key});

  @override
  State<CreateAccountStepTwoForm> createState() =>
      _CreateAccountStepTwoFormState();
}

class _CreateAccountStepTwoFormState extends State<CreateAccountStepTwoForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  DateTime? _birthdate;
  String? _country;
  final _countries = ['United States', 'Canada', 'United Kingdom', 'Other'];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pickBirthdate() async {
    final now = DateTime.now();
    final initial = _birthdate ?? DateTime(now.year - 20);
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null) setState(() => _birthdate = picked);
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    // TODO: send profile to backend
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(context.loc.profile_complete),
        content: Text('${context.loc.profile}: ${context.loc.profile.toString()}'),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.of(context).popUntil((route) => route.isFirst),
            child: Text(context.loc.done),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateAccountCubit, CreateAccountState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is! CreateAccountStateLoaded) {
          return Center(child: CircularProgressIndicator());
        }

        final formData = state.form;

        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (formData.email != null) ...[
                Text('${context.loc.signed_up_as} ${formData.email}'),
                const SizedBox(height: DsSpacing.md),
              ],
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: context.loc.full_name),
                validator: InputValidation.validateName,
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: _pickBirthdate,
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: context.loc.birthdate,
                    errorText: InputValidation.validateBirthdate(_birthdate),
                  ),
                  child: Text(
                    _birthdate == null
                        ? context.loc.tap_to_select
                        : '${_birthdate!.toLocal()}'.split(' ')[0],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _country,
                items: _countries
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) => setState(() => _country = v),
                decoration: InputDecoration(labelText: context.loc.country),
                validator: InputValidation.validateCountry,
              ),
              const SizedBox(height: 20),
              DsButton.loadable(
                onPressed: _submit,
                label: context.loc.save_profile,
                loadingLabel: "Saving..."
              ),
            ],
          ),
        );
      },
    );
  }
}
