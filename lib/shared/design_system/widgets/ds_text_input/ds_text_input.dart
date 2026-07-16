import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/utils/extensions/widget.dart';
import 'package:flutter/material.dart';

// TODO (docs)
class DsTextInput extends StatefulWidget {
  const DsTextInput({
    required this.hint,
    this.label,
    this.validator,
    this.isObscurable = false,
    this.customSuffix,
    this.onTapCustomSuffix,
    this.onChanged,
    this.initialValue,
    super.key,
  });

  final String? Function(String?)? validator;
  final String? label;
  final String hint;
  final bool? isObscurable;
  final IconData? customSuffix;
  final void Function(String?)? onChanged;
  final void Function(String?)? onTapCustomSuffix;
  final String? initialValue;

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
      final result = widget.validator!(v);
      return result;
    }
    return null;
  }

  Widget get obscureIcon => Icon(
    _isObscured ? Icons.visibility : Icons.visibility_off,
    size: DsSpacing.lg,
  ).onTap(() => setState(() => _isObscured = !_isObscured));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textController,
      keyboardType: TextInputType.emailAddress,
      onChanged: widget.onChanged,
      initialValue: widget.initialValue,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        suffix: widget.isObscurable!
            ? obscureIcon
            : widget.customSuffix != null
            ? Icon(widget.customSuffix).onTap(
                () => widget.onTapCustomSuffix?.call(_textController.text),
              )
            : null,
      ),
      obscureText: widget.isObscurable == true ? _isObscured : false,
      validator: handleValidation,
    );
  }
}
