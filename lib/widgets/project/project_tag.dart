import 'package:flutter/material.dart';

import '../../theme/portfolio_colors.dart';

/// A small pill showing a technology tag on a project card.
class ProjectTag extends StatelessWidget {
  const ProjectTag({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: PortfolioColors.glass,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: PortfolioColors.hairline),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: PortfolioColors.muted,
        ),
      ),
    );
  }
}
