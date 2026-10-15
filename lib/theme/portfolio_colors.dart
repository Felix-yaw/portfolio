import 'package:flutter/material.dart';

/// Palette for the portfolio: a deep aurora canvas with glassy surfaces and
/// a vivid violet → cyan → pink accent ramp.
abstract final class PortfolioColors {
  static const Color background = Color(0xFF07070B);
  static const Color surface = Color(0xFF111119);
  static const Color surfaceHigh = Color(0xFF181822);

  static const Color text = Color(0xFFF4F5FA);
  static const Color muted = Color(0xFF9AA0B2);
  static const Color faint = Color(0xFF5A6072);

  static const Color violet = Color(0xFF7C5CFF);
  static const Color cyan = Color(0xFF22D3EE);
  static const Color pink = Color(0xFFFF5DA2);
  static const Color lime = Color(0xFFC8F135);

  static const Color hairline = Color(0x1FFFFFFF);
  static const Color glass = Color(0x14FFFFFF);

  static const LinearGradient brand = LinearGradient(
    colors: <Color>[violet, cyan],
  );

  static const LinearGradient aurora = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[violet, pink, cyan],
  );
}
