import 'package:flutter/material.dart';

import '../theme/portfolio_colors.dart';

/// Text painted with the brand gradient.
class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    this.style,
    this.gradient = PortfolioColors.aurora,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) => gradient.createShader(bounds),
      child: Text(text, style: style),
    );
  }
}
