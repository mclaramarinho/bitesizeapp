import 'package:flutter/material.dart';

// TODO (docs)
class DsColors {
  static const Blue blue = Blue();
  static const Green green = Green();
  static const Red red = Red();
  static const White white = White();
  static const Black black = Black();
  static const Purple purple = Purple();
  static const Yellow yellow = Yellow();
  static const Pink pink = Pink();
  static const Color transparent = Colors.transparent;
}

abstract class DsColor {
  const DsColor();
}

class Blue extends DsColor {
  const Blue() : super();
  Color get cyanDigital => Color(0xFF00FFFF);
  Color get lightCyber => Color(0xFF60EFFF);
  Color get blueSea => Color(0xFF008B8B);
  Color get veryDark => Color(0xFF181E26);
  Color get veryDark2 => Color(0xFF0F172A);
  Color get deepSlateObsidian => Color(0xFF0F1319);
  Color get softDetails => Color(0xFF94A3B8);
  Color get pure => Color(0xFF0288D1);
}

class Green extends DsColor {
  const Green() : super();
  Color get dopamineMint => Color(0xFF00FF87);
  Color get veryDark => Color(0xFF00381A);
  Color get mutedMint => Color(0xFF007A4F);
  Color get toxic => Color(0xFF39FF14);
  Color get success => Color(0xFF22C55E);
}

class Red extends DsColor {
  const Red() : super();
  Color get deadline => Color(0xFFFF4B4B);
  Color get veryDark => Color(0xFFB00020);
  Color get critical => Color(0xFFFF0055);
  Color get red => Color(0xFFE53935);
  Color get error => Color(0xFFEF4444);
}

class White extends DsColor {
  const White() : super();
  Color get white => Color(0xFFFFFFFF);
  Color get white2 => Color(0xFFE2E8F0);
  Color get white3 => Color(0xFFF7FAFC);
}

class Black extends DsColor {
  const Black() : super();
  Color get black => Color(0xFF000000);
  Color get black2 => Color(0xFF0D0D0D);
  Color get gray => Color(0xFF6B7280);
  Color get transparency => Color(0x0A000000);
}

class Purple extends DsColor {
  const Purple() : super();
  Color get veryDark => Color(0xFF221538);
  Color get veryDark2 => Color(0xFF120C1F);
  Color get elixirMagenta => Color(0xFFE040FB);
  Color get light => Color(0xFFA594C4);
}

class Yellow extends DsColor {
  const Yellow() : super();
  Color get gold => Color(0xFFFFB800);
  Color get veryDark => Color(0xFF3D2B00);
  Color get warning => Color(0xFFF59E0B);
}

class Pink extends DsColor {
  const Pink() : super();
  Color get laserNeon => Color(0xFFFF007F);
}
