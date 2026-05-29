import 'package:flutter/material.dart';
class DsTypography {
  static final common = DsTypographyDefault();
}


abstract class DsTypographyData {
  const DsTypographyData({
    required this.headlineLarge,
    required this.headlineMedium,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    this.fontFamily = "Roboto"
  });

  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final String fontFamily;

  TextTheme get theme => TextTheme(
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
      );
}

class DsTypographyDefault extends DsTypographyData {
  const DsTypographyDefault()
      : super(
          headlineLarge: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
          headlineMedium: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
          bodyLarge: const TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
          bodySmall: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
          ),
        );
}