import 'package:adhd_app/shared/design_system/constants/ds_themes.dart';
import 'package:flutter/widgets.dart';

class DsText extends StatelessWidget {
  final String text;
  final DsTextLevel level;
  final CustomTextStyle? customTextStyle;

  const DsText(
    this.text, {
    this.level = DsTextLevel.bodyMedium,
    this.customTextStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: customTextStyle?.textAlign,
      style: level.style?.copyWith(
        color: customTextStyle?.color,
        decoration: customTextStyle != null && customTextStyle!.isUnderlined
            ? TextDecoration.underline
            : null,
      ),
    );
  }
}

class CustomTextStyle {
  final Color? color;
  final bool isUnderlined;
  final TextAlign? textAlign;

  const CustomTextStyle({
    this.color,
    this.textAlign,
    this.isUnderlined = false,
  });
}

enum DsTextLevel {
  headerLarge,
  headerMedium,
  bodyLarge,
  bodyMedium,
  bodySmall;

  TextStyle? get style {
    final theme = DsThemes.current.textTheme;

    switch (this) {
      case .headerLarge:
        return theme.headlineLarge;
      case .headerMedium:
        return theme.headlineMedium;
      case .bodyLarge:
        return theme.bodyLarge;
      case .bodyMedium:
        return theme.bodyMedium;
      case .bodySmall:
        return theme.bodySmall;
    }
  }
}
