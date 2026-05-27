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
    const cardColor = Color(0xFF181E26);
    const primaryColor = Color(0xFF00FF87); // Dopamine Mint Green
    
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0F1319), // Deep slate obsidian
      fontFamily: "Roboto",
      textTheme: textThemes,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: Color(0xFF60EFFF),     // Light Cyber Blue
        surface: cardColor,               // Container Cards
        error: Color(0xFFFF4B4B),         // Deadline Alerts
        onPrimary: Color(0xFF00381A),
        onSurface: Color(0xFFE2E8F0),     // High-visibility Text
        onSurfaceVariant: Color(0xFF94A3B8), // Soft details
      ),
      cardTheme: const CardTheme(
        color: cardColor,
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Color(0xFFE2E8F0),
        centerTitle: false,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) => 
          states.contains(WidgetState.selected) ? primaryColor : Colors.transparent),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
      ),
    );
  }

  static ThemeData get freeLight {
    const cardColor = Color(0xFFFFFFFF);
    const primaryColor = Color(0xFF007A4F); // Muted Mint Green
    
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF7FAFC), // Very light slate
      fontFamily: "Roboto",
      textTheme: textThemes,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: Color(0xFF0288D1),     // Cyan accents
        surface: cardColor,
        error: Color(0xFFB00020),
        onPrimary: cardColor,
        onSurface: Color(0xFF0F172A),     // Primary text color
        onSurfaceVariant: Color(0xFF6B7280),
      ),
      cardTheme: const CardTheme(
        color: cardColor,
        margin: EdgeInsets.zero,
        elevation: 1,
        shadowColor: Color(0x0A000000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Color(0xFF0F172A),
        centerTitle: false,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) => 
          states.contains(WidgetState.selected) ? primaryColor : Colors.transparent),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
      ),
    );
  }

  // ------------------------------------------
  // 👑 PREMIUM COSMETIC THEME 1: "8-Bit Retro Quest"
  // Gamified RPG styling for hyper-focus engagement
  // ------------------------------------------
  static ThemeData get premiumRetroRPG {
    const cardColor = Color(0xFF221538); // Window Background
    const primaryColor = Color(0xFFFFB800); // Quest Gold
    
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF120C1F), // Dark Arcade Purple
      fontFamily: "Roboto",
      textTheme: textThemes,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: Color(0xFFE040FB),     // Neon Elixir Magenta
        surface: cardColor,
        error: Color(0xFFFF0055),         // Critical Threat Warning
        onPrimary: Color(0xFF3D2B00),
        onSurface: Color(0xFFFFFFFF),
        onSurfaceVariant: Color(0xFFA594C4),
      ),
      cardTheme: CardTheme(
        color: cardColor,
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: primaryColor.withOpacity(0.5), width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(8)), // Sharper retro corners
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
    const cardColor = Color(0xFF0D0D0D); // Shell blocks
    const primaryColor = Color(0xFFFF007F); // Laser Neon Pink
    
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF000000), // Raw Terminal Black
      fontFamily: "Roboto",
      textTheme: textThemes,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: Color(0xFF39FF14),     // Matrix Toxic Green
        surface: cardColor,
        error: Color(0xFFE53935),
        onPrimary: const Color(0xFF000000),
        onSurface: Color(0xFF00FFFF),     // Cyan Digital Text
        onSurfaceVariant: Color(0xFF008B8B),
      ),
      cardTheme: CardTheme(
        color: cardColor,
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: primaryColor, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Color(0xFF00FFFF),
        centerTitle: false,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) => 
          states.contains(WidgetState.selected) ? primaryColor : Colors.transparent),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
      ),
    );
  }

  // ------------------------------------------
  // DEFAULT TEXT THEMES
  // ------------------------------------------
  static TextTheme get textThemes {
    return const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.5,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.2,
      ),
      bodyLarge: TextStyle(
        fontSize: 16, 
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.4,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.0,
      ),
    );
  }
}