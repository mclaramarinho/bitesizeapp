import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/utils/extensions/widget.dart';
import 'package:flutter/material.dart';

class DsTextInput extends StatefulWidget {
  const DsTextInput({
    required this.label,
    required this.hint,
    this.validator,
    this.isObscurable = false,
    this.onChanged,
    super.key,
  });

  final String? Function(String?)? validator;
  final String label;
  final String hint;
  final bool? isObscurable;
  final void Function(String)? onChanged;

  @override
  State<DsTextInput> createState() => _DsTextInputState();
}

class _DsTextInputState extends State<DsTextInput> {
  final _textController = TextEditingController();
  bool _isObscured = true;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  String? handleValidation(String? v) {
    if (widget.validator != null) {
      return widget.validator!(v);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textController,
      keyboardType: TextInputType.emailAddress,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        suffix:
            widget.isObscurable! 
                ? Icon(
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                  size: DsSpacing.lg,
                ).onTap(() => setState(() => _isObscured = !_isObscured))
                : null,
      ),
      obscureText: widget.isObscurable == true ? _isObscured : false,
      validator: (v) => handleValidation(v),
    );
  }
}
