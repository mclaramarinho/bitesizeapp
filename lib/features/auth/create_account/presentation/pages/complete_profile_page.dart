import 'package:adhd_app/shared/utils/extensions/context.dart';
import 'package:flutter/material.dart';

// TODO - this is going to be rendered conditionally on the CreateAccountPage, depending on the current step of the flow.

class CompleteProfilePage extends StatefulWidget {
  final String? email;
  const CompleteProfilePage({super.key, this.email});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
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
    // collect profile data
    final profile = {
      'email': widget.email,
      'name': _nameController.text.trim(),
      'birthdate': _birthdate?.toIso8601String(),
      'country': _country,
    };
    // TODO: send profile to backend or save locally
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(context.loc.profile_complete),
        content: Text('${context.loc.profile}: ${profile.toString()}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
            child: Text(context.loc.done),
          )
        ],
      ),
    );
  }

  String? _validateName(String? v) => (v == null || v.trim().isEmpty) ? context.loc.enter_name : null;
  String? _validateBirthdate(_) => _birthdate == null ? context.loc.select_birthdate : null;
  String? _validateCountry(String? v) => (v == null || v.isEmpty) ? context.loc.select_country : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.complete_ur_profile)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (widget.email != null) ...[
                  Text('${context.loc.signed_up_as} ${widget.email}'),
                  const SizedBox(height: 12),
                ],
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: context.loc.full_name),
                  validator: _validateName,
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: _pickBirthdate,
                  child: InputDecorator(
                    decoration: InputDecoration(labelText: context.loc.birthdate, errorText: _validateBirthdate(null)),
                    child: Text(_birthdate == null ? context.loc.tap_to_select : '${_birthdate!.toLocal()}'.split(' ')[0]),
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _country,
                  items: _countries.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                  onChanged: (v) => setState(() => _country = v),
                  decoration: InputDecoration(labelText: context.loc.country),
                  validator: _validateCountry,
                ),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: _submit, child: Text(context.loc.save_profile)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
