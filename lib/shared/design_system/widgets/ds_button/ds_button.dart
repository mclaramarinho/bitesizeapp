import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/constants/ds_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DsButton {
  static Widget loadable({
    required TaskCallback onPressed,
    required String label,
    required String loadingLabel,
    IconData? prefixIcon,
  }) {
    return _DSLoadableButton(
      onPressed: onPressed,
      label: label,
      loadingLabel: loadingLabel,
      prefixIcon: prefixIcon,
    );
  }
}

// =======================================================================================

/// DS Loadable Button
class _DSLoadableButton extends StatefulWidget {
  final TaskCallback onPressed;
  final String label;
  final String loadingLabel;
  final IconData? prefixIcon;

  const _DSLoadableButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.loadingLabel,
    this.prefixIcon,
  });
  @override
  State<_DSLoadableButton> createState() => _DSLoadableButtonState();
}

class _DSLoadableButtonState extends State<_DSLoadableButton> {
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

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: DsSpacing.md),
        elevation: DsSpacing.none,
      ),
      onPressed: _loading ? null : _handlePress,
      icon: _loading ? loadingIndicator : prefixIconWidget,
      label: Text(_loading ? widget.loadingLabel : widget.label),
    );
  }
}
