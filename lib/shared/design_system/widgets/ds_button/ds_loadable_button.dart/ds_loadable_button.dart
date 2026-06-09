import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/constants/ds_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DSLoadableButton extends StatefulWidget {
  final TaskCallback onPressed;
  final String label;
  final String loadingLabel;
  final IconData? prefixIcon;
  final bool disabled;

  const DSLoadableButton({
    required this.onPressed,
    required this.label,
    required this.loadingLabel,
    this.prefixIcon,
    this.disabled = false,
    super.key,
  });
  @override
  State<DSLoadableButton> createState() => _DSLoadableButtonState();
}

class _DSLoadableButtonState extends State<DSLoadableButton> {
  bool _loading = false;

  Future<void> _handlePress() async {
    setState(() {
      _loading = true;
    });
    await widget.onPressed();
    setState(() {
      _loading = false;
    });
  }

  Icon? get prefixIconWidget =>
      widget.prefixIcon != null ? Icon(widget.prefixIcon) : null;

  SizedBox get loadingIndicator => SizedBox(
    width: DsSpacing.md,
    height: DsSpacing.md,
    child: CircularProgressIndicator(
      strokeWidth: DsSpacing.xxs,
      color: DsThemes.current.primaryColor,
    ),
  );

  Future<void> Function()? get onPressedCallback {
    if (_loading || widget.disabled) return null;
    return _handlePress;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: DsSpacing.md),
        elevation: DsSpacing.none,
        enableFeedback: !widget.disabled,
      ),
      onPressed: onPressedCallback,
      icon: _loading ? loadingIndicator : prefixIconWidget,
      label: Text(
        _loading ? widget.loadingLabel : widget.label,
        textAlign: TextAlign.center,
      ),
    );
  }
}
