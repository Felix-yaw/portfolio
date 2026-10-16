import 'package:flutter/material.dart';

import '../../theme/portfolio_colors.dart';

/// A single skill rendered as a pill.
class SkillChip extends StatelessWidget {
  const SkillChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: PortfolioColors.glass,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: PortfolioColors.hairline),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: PortfolioColors.text,
        ),
      ),
    );
  }
}
