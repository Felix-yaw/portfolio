import 'package:flutter/material.dart';

import 'portfolio_colors.dart';

/// Dark aurora theme for the portfolio.
abstract final class PortfolioTheme {
  static ThemeData dark() {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: PortfolioColors.violet,
      brightness: Brightness.dark,
    ).copyWith(
      primary: PortfolioColors.violet,
      secondary: PortfolioColors.cyan,
      surface: PortfolioColors.surface,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: PortfolioColors.background,
      splashFactory: NoSplash.splashFactory,
      textTheme: _textTheme(),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: PortfolioColors.text,
          foregroundColor: PortfolioColors.background,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: PortfolioColors.text,
          side: const BorderSide(color: PortfolioColors.hairline, width: 1.2),
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
        ),
      ),
    );
  }

  static TextTheme _textTheme() {
    return const TextTheme(
      displayLarge: TextStyle(
        color: PortfolioColors.text,
        fontSize: 68,
        fontWeight: FontWeight.w800,
        letterSpacing: -3,
        height: 1.02,
      ),
      displayMedium: TextStyle(
        color: PortfolioColors.text,
        fontSize: 44,
        fontWeight: FontWeight.w800,
        letterSpacing: -2,
        height: 1.05,
      ),
      headlineMedium: TextStyle(
        color: PortfolioColors.text,
        fontSize: 30,
        fontWeight: FontWeight.w800,
        letterSpacing: -1,
      ),
      headlineSmall: TextStyle(
        color: PortfolioColors.text,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.6,
      ),
      titleLarge: TextStyle(
        color: PortfolioColors.text,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.4,
      ),
      titleMedium: TextStyle(
        color: PortfolioColors.text,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: PortfolioColors.muted,
        fontSize: 16,
        height: 1.6,
      ),
      bodyMedium: TextStyle(
        color: PortfolioColors.muted,
        fontSize: 14,
        height: 1.6,
      ),
      labelLarge: TextStyle(
        color: PortfolioColors.text,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.2,
      ),
    );
  }
}
