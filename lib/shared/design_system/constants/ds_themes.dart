import 'package:adhd_app/shared/design_system/constants/ds_colors.dart';
import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/constants/ds_typography.dart';
import 'package:adhd_app/shared/utils/navigation/global.dart';
import 'package:flutter/material.dart';

/// ==========================================
/// 🎨 THEME CONSTANTS & COLOR SCHEMES
/// ==========================================
class DsThemes {
  static ThemeData get current => Theme.of(NavigationService.context!);
  static TextTheme get currentTextTheme => current.textTheme;


  /// Dynamic evaluator to handle dark/light mode detection safely.
  /// If context is not ready yet, it safely defaults to dark mode to prevent light flashes.
  static ThemeData get freeDefault {
    final context = NavigationService.context;
    if (context == null) return freeDark;
    
    final isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    return isDark ? freeDark : freeLight;
  }

  // ------------------------------------------
  // 🆓 DEFAULT FREE THEMES: "Neon Focus"
  // Clean, high-contrast minimalist styles
  // ------------------------------------------
  
  static ThemeData get freeDark {
    final cardColor = DsColors.blue.veryDark;
    final primaryColor = DsColors.green.dopamineMint; // Dopamine Mint Green
    
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: DsColors.blue.deepSlateObsidian, // Deep slate obsidian
      fontFamily: DsTypography.common.fontFamily,
      textTheme: DsTypography.common.theme,
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        secondary: DsColors.blue.lightCyber, // Light Cyber Blue
        surface: cardColor,               // Container Cards
        error: DsColors.red.deadline, // Deadline Alerts
        onPrimary: DsColors.green.veryDark,
        onSurface: DsColors.white.white2, // High-visibility Text
        onSurfaceVariant: DsColors.blue.softDetails,  // Soft details
      ),
      cardTheme: CardThemeData(
        color: cardColor,
        margin: EdgeInsets.zero,
        elevation: DsSpacing.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(DsSpacing.md)),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: DsSpacing.none,
        foregroundColor: DsColors.white.white2,
        centerTitle: false,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) => 
          states.contains(WidgetState.selected) ? primaryColor : DsColors.transparent),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(DsSpacing.xs))),
      ),
    );
  }

  static ThemeData get freeLight {
    final cardColor = DsColors.white.white;
    final primaryColor = DsColors.green.mutedMint; // Muted Mint Green
    
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: DsColors.white.white3, // Very light slate
      fontFamily: DsTypography.common.fontFamily,
      textTheme: DsTypography.common.theme,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: DsColors.blue.pure, // Cyan accents
        surface: cardColor,
        error: DsColors.red.veryDark,
        onPrimary: cardColor,
        onSurface: DsColors.blue.veryDark, // Primary text color
        onSurfaceVariant: DsColors.black.gray,
      ),
      cardTheme: CardThemeData(
        color: cardColor,
        margin: EdgeInsets.zero,
        elevation: 1,
        shadowColor: DsColors.black.transparency,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(DsSpacing.md)),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: DsSpacing.none,
        foregroundColor: DsColors.blue.veryDark2,
        centerTitle: false,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) => 
          states.contains(WidgetState.selected) ? primaryColor : DsColors.transparent),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(DsSpacing.xs))),
      ),
    );
  }

  // ------------------------------------------
  // 👑 PREMIUM COSMETIC THEME 1: "8-Bit Retro Quest"
  // Gamified RPG styling for hyper-focus engagement
  // ------------------------------------------
  static ThemeData get premiumRetroRPG {
    final cardColor = DsColors.purple.veryDark; // Window Background
    final primaryColor = DsColors.yellow.gold; // Quest Gold
    
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: DsColors.purple.veryDark2, // Dark Arcade Purple
      fontFamily: DsTypography.common.fontFamily,
      textTheme: DsTypography.common.theme,
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        secondary: DsColors.purple.elixirMagenta,     // Neon Elixir Magenta 
        surface: cardColor,
        error: DsColors.red.critical,         // Critical Threat Warning
        onPrimary: DsColors.yellow.veryDark,
        onSurface: DsColors.white.white,
        onSurfaceVariant: DsColors.purple.light,
      ),
      cardTheme: CardThemeData(
        color: cardColor,
        margin: EdgeInsets.zero,
        elevation: DsSpacing.none,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: primaryColor.withOpacity(0.5), width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(DsSpacing.sm)), // Sharper retro corners
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: DsSpacing.none,
        foregroundColor: primaryColor,
        centerTitle: true,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) => 
          states.contains(WidgetState.selected) ? primaryColor : Colors.transparent),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), // Pure pixel square
      ),
    );
  }

  // ------------------------------------------
  // 👑 PREMIUM COSMETIC THEME 2: "Cyberpunk Terminal"
  // Intense hyperfixation visual engine
  // ------------------------------------------
  static ThemeData get premiumCyberpunk {
    final cardColor = DsColors.black.black2; // Shell blocks
    final primaryColor = DsColors.pink.laserNeon; // Laser Neon Pink
    
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: DsColors.black.black, // Raw Terminal Black
      fontFamily: DsTypography.common.fontFamily,
      textTheme: DsTypography.common.theme,
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        secondary: DsColors.green.toxic,     // Matrix Toxic Green
        surface: cardColor,
        error: DsColors.red.red,
        onPrimary: DsColors.black.black, 
        onSurface: DsColors.blue.cyanDigital,     // Cyan Digital Text
        onSurfaceVariant: DsColors.blue.blueSea, // Subtle blue details
      ),
      cardTheme: CardThemeData(
        color: cardColor,
        margin: EdgeInsets.zero,
        elevation: DsSpacing.none,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: primaryColor, width: DsSpacing.xxxs),
          borderRadius: BorderRadius.all(Radius.circular(DsSpacing.xs)),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: DsSpacing.none,
        foregroundColor: DsColors.blue.cyanDigital,
        centerTitle: false,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) => 
          states.contains(WidgetState.selected) ? primaryColor : Colors.transparent),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(DsSpacing.xxs))),
      ),
    );
  }
}