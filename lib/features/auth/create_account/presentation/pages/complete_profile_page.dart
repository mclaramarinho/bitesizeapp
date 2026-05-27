import 'package:flutter/material.dart';

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
        title: const Text('Profile complete'),
        content: Text('Profile: ${profile.toString()}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
            child: const Text('Done'),
          )
        ],
      ),
    );
  }

  String? _validateName(String? v) => (v == null || v.trim().isEmpty) ? 'Enter your name' : null;
  String? _validateBirthdate(_) => _birthdate == null ? 'Select your birthdate' : null;
  String? _validateCountry(String? v) => (v == null || v.isEmpty) ? 'Select your country' : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complete your profile')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (widget.email != null) ...[
                  Text('Signed up as ${widget.email}'),
                  const SizedBox(height: 12),
                ],
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Full name'),
                  validator: _validateName,
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: _pickBirthdate,
                  child: InputDecorator(
                    decoration: InputDecoration(labelText: 'Birthdate', errorText: _validateBirthdate(null)),
                    child: Text(_birthdate == null ? 'Tap to select' : '${_birthdate!.toLocal()}'.split(' ')[0]),
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _country,
                  items: _countries.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                  onChanged: (v) => setState(() => _country = v),
                  decoration: const InputDecoration(labelText: 'Country'),
                  validator: _validateCountry,
                ),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: _submit, child: const Text('Save profile')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
